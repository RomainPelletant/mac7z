import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:path/path.dart' as p;
import '../models/archive_entry.dart';

// ── Compression enums ─────────────────────────────────────────────────────────

enum ArchiveFormat {
  sevenZip('7z',     '-t7z',    true,  true),
  zip     ('zip',    '-tzip',   true,  false),
  tar     ('tar',    '-ttar',   false, false),
  tarGz   ('tar.gz',  null,     true,  false),
  tarBz2  ('tar.bz2', null,     true,  false),
  tarXz   ('tar.xz',  null,     true,  false);

  /// File extension shown in UI and appended to output filename.
  final String label;

  /// 7zip `-t` flag, or null to let 7zip infer from extension (compound tars).
  final String? typeFlag;

  /// Whether this format supports a meaningful compression level.
  final bool supportsLevel;

  /// Whether this format supports header + content encryption.
  final bool supportsEncryption;

  const ArchiveFormat(this.label, this.typeFlag, this.supportsLevel, this.supportsEncryption);
}

enum CompressionLevel {
  store  ('Store',    0),
  fastest('Fastest',  1),
  fast   ('Fast',     3),
  normal ('Normal',   5),
  maximum('Maximum',  7),
  ultra  ('Ultra',    9);

  final String label;
  final int value;
  const CompressionLevel(this.label, this.value);
}

enum SplitSize {
  none ('No split',      null),
  mb10 ('10 MB',         '10m'),
  mb100('100 MB',        '100m'),
  mb700('700 MB (CD)',   '700m'),
  gb1  ('1 GB',          '1g'),
  gb4  ('4 GB (FAT32)',  '4g');

  final String label;
  final String? flag;
  const SplitSize(this.label, this.flag);
}

// ── Thrown when a split archive has missing volumes. ─────────────────────────

/// Thrown when a split archive has missing volumes.
/// [partialEntries] contains whatever 7zip was able to read from the
/// available parts (may be empty if the index lives in a missing part).
class SplitVolumeException implements Exception {
  final List<ArchiveEntry> partialEntries;
  const SplitVolumeException(this.partialEntries);
  @override
  String toString() => 'Split archive incomplete: volumes are missing.';
}

class SevenZipService {
  /// Finds the 7z/7zz binary on the current platform.
  static String? _binaryPath;

  /// Returns the path of the 7zz binary bundled inside the macOS app bundle
  /// (Contents/Resources/7zz), and ensures it is executable.
  static Future<String?> _bundledBinaryPath() async {
  try {
    if (Platform.isMacOS) {
      final macosDir = p.dirname(Platform.resolvedExecutable);
      final resourcesDir = p.join(macosDir, '..', 'Resources');
      final binary = File(p.normalize(p.join(resourcesDir, '7zz')));
      if (!binary.existsSync()) return null;
      await Process.run('chmod', ['+x', binary.path]);
      return binary.path;
    }

    if (Platform.isLinux) {
      final exeDir = p.dirname(Platform.resolvedExecutable);
      final binary = File(p.join(exeDir, '7zz'));
      if (!binary.existsSync()) return null;
      await Process.run('chmod', ['+x', binary.path]);
      return binary.path;
    }

    return null;
    } catch (_) {
      return null;
    }
  }

  static Future<String?> findBinary() async {
    if (_binaryPath != null) return _binaryPath;

    // 1. Bundled binary inside the app bundle (no installation required)
    final bundled = await _bundledBinaryPath();
    if (bundled != null) {
      try {
        final result = await Process.run(bundled, ['i']);
        if (result.exitCode == 0 || result.stdout.toString().contains('7-Zip')) {
          _binaryPath = bundled;
          return _binaryPath;
        }
      } catch (_) {}
    }

    // 2. Fallback: system-installed binaries
    final candidates = Platform.isWindows
        ? [
            r'C:\Program Files\7-Zip\7z.exe',
            r'C:\Program Files (x86)\7-Zip\7z.exe',
            '7z.exe',
          ]
        : Platform.isMacOS
            ? [
                '/opt/homebrew/bin/7zz',
                '/usr/local/bin/7zz',
                '/opt/homebrew/bin/7z',
                '/usr/local/bin/7z',
              ]
            : [
                '/usr/bin/7zz',
                '/usr/local/bin/7zz',
                '7zz',
              ];

    for (final c in candidates) {
      try {
        final result = await Process.run(c, ['i'], runInShell: true);
        if (result.exitCode == 0 || result.stdout.toString().contains('7-Zip')) {
          _binaryPath = c;
          return c;
        }
      } catch (_) {}
    }
    return null;
  }

  /// Lists entries in an archive without extracting.
  /// Handles compound archives (.tar.xz, .tar.gz, .tar.bz2) transparently.
  static Future<List<ArchiveEntry>> listContents(
    String archivePath, {
    String? password,
  }) async {
    final bin = await findBinary();
    if (bin == null) throw Exception('7zip binary not found. Please install 7-Zip.');

    // Always pass -p to avoid interactive prompts. Empty string is ignored
    // for non-encrypted archives; for encrypted ones it forces exit code 2.
    final args = ['l', '-slt', '-p${password ?? ""}', '--', archivePath];
    final result = await Process.run(bin, args, runInShell: Platform.isWindows);

    final stderr = result.stderr.toString();
    final stdout = result.stdout.toString();
    final allOutput = stdout + stderr;

    if (_isVolumeError(allOutput)) {
      // Parse whatever 7zip managed to output before bailing out
      throw SplitVolumeException(parseListOutput(stdout));
    }
    if (result.exitCode == 2 || _isPasswordError(allOutput)) {
      throw Exception('Wrong password or corrupted archive.');
    }
    if (result.exitCode != 0 && result.exitCode != 1) {
      throw Exception('7zip error: $stderr');
    }

    final entries = parseListOutput(stdout);

    // Compound archive (.tar.xz, .tar.gz, etc.) : 7zip ne voit que le .tar
    // interne. On pipe la décompression vers un second listing du tar.
    if (entries.length == 1 &&
        entries.first.extension == 'tar' &&
        !entries.first.isDirectory) {
      return _listCompoundTar(bin, archivePath, password: password);
    }

    return entries;
  }

  /// Returns true if [output] (stderr/stdout) indicates a password error.
  /// Covers the various messages 7zip emits across formats and versions.
  /// Returns true if [output] indicates a missing/incomplete split volume.
  /// Must be checked BEFORE [_isPasswordError] since 7zip reuses exit code 2
  /// for both missing volumes and wrong passwords.
  static bool _isVolumeError(String output) {
    final lower = output.toLowerCase();
    return lower.contains('volumes are absent') ||
        lower.contains('volume is absent') ||
        lower.contains('cannot find volume') ||
        lower.contains('cannot find next volume') ||
        lower.contains('no more volumes') ||
        lower.contains('there are no split') ||
        (lower.contains('volume') && lower.contains('missing'));
  }

  /// Returns true if [output] (stderr/stdout) indicates a password error.
  /// [_isVolumeError] is checked first so volume errors are never misclassified.
  static bool _isPasswordError(String output) {
    if (_isVolumeError(output)) return false;
    final lower = output.toLowerCase();
    return lower.contains('wrong password') ||
        lower.contains('incorrect password') ||
        lower.contains('password') && lower.contains('error') ||
        lower.contains('cannot open encrypted') ||
        lower.contains('can not open encrypted') ||
        lower.contains('data error in encrypted file');
  }

  /// Retourne le type 7zip de la couche externe d'une archive composée.
  @visibleForTesting
  static String? outerType(String archivePath) {
    final lower = archivePath.toLowerCase();
    if (lower.endsWith('.tar.gz')  || lower.endsWith('.tgz'))          return 'gzip';
    if (lower.endsWith('.tar.bz2') || lower.endsWith('.tbz2') || lower.endsWith('.tbz')) return 'bzip2';
    if (lower.endsWith('.tar.xz')  || lower.endsWith('.txz'))          return 'xz';
    if (lower.endsWith('.tar.zst'))                                     return 'zstd';
    return null;
  }

  /// Extrait UNIQUEMENT la couche externe (xz/gz/bz2) vers un dossier temp,
  /// liste le .tar résultant, puis nettoie.
  static Future<List<ArchiveEntry>> _listCompoundTar(
    String bin,
    String archivePath, {
    String? password,
  }) async {
    final tempDir = await Directory.systemTemp.createTemp('unzipper7_');
    try {
      final outerType = SevenZipService.outerType(archivePath);

      // Étape 1 : extraire SEULEMENT la couche externe → produit le .tar
      final extractArgs = [
        'e', archivePath,
        if (outerType != null) '-t$outerType', // force le type outer → pas de récursion tar
        '-o${tempDir.path}',
        '-y',
        if (password != null) '-p$password',
      ];
      final extractResult = await Process.run(bin, extractArgs);
      if (extractResult.exitCode != 0 && extractResult.exitCode != 1) {
        throw Exception('7zip error (compound extract): ${extractResult.stderr}');
      }

      // Étape 2 : trouver le .tar extrait
      final tarFiles = tempDir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.toLowerCase().endsWith('.tar'))
          .toList();
      if (tarFiles.isEmpty) return [];

      // Étape 3 : lister le .tar
      final listArgs = ['l', '-slt', '--', tarFiles.first.path];
      final listResult = await Process.run(bin, listArgs);
      return parseListOutput(listResult.stdout.toString());
    } finally {
      await tempDir.delete(recursive: true);
    }
  }

  /// Extracts a single [entryPath] from [archivePath] into [outputDir].
  ///
  /// [outputDir] must already exist and is managed by the caller
  /// (e.g. [TempPreviewManager]). The caller is responsible for cleanup.
  ///
  /// Works transparently with compound archives (.tar.xz, .tar.gz, etc.):
  /// the outer layer is decompressed first inside [outputDir], then the
  /// specific entry is extracted from the inner .tar.
  ///
  /// Returns the absolute path of the extracted file.
  static Future<String> extractSingleFile(
    String archivePath,
    String entryPath, {
    required Directory outputDir,
    String? password,
  }) async {
    final bin = await findBinary();
    if (bin == null) throw Exception('7zip binary not found.');

    final tempDir = outputDir;

    final outer = outerType(archivePath);

    if (outer != null) {
      // ── Compound archive (.tar.xz, .tar.gz, …) ────────────────────────────
      // Step 1: extract outer compression layer → obtain .tar in tempDir
      final outerArgs = [
        'e', archivePath,
        '-t$outer',
        '-o${tempDir.path}',
        '-y',
        '-p${password ?? ""}',
      ];
      final outerResult = await Process.run(bin, outerArgs);
      final outerStderr = outerResult.stderr.toString();
      if (outerResult.exitCode == 2 || _isPasswordError(outerStderr)) {
        throw Exception('Wrong password or corrupted archive.');
      }
      if (outerResult.exitCode != 0 && outerResult.exitCode != 1) {
        throw Exception('Outer extraction failed: $outerStderr');
      }

      // Step 2: find the .tar
      final tarFiles = tempDir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.toLowerCase().endsWith('.tar'))
          .toList();
      if (tarFiles.isEmpty) throw Exception('Inner .tar not found after outer extraction.');

      // Step 3: extract specific file from the .tar
      final innerArgs = [
        'e', tarFiles.first.path,
        '-o${tempDir.path}',
        '-y',
        entryPath,
      ];
      final innerResult = await Process.run(bin, innerArgs);
      if (innerResult.exitCode != 0 && innerResult.exitCode != 1) {
        throw Exception('Inner extraction failed: ${innerResult.stderr}');
      }

      // Clean up the intermediate .tar
      await tarFiles.first.delete();
    } else {
      // ── Simple archive ─────────────────────────────────────────────────────
      final args = [
        'e', archivePath,
        '-o${tempDir.path}',
        '-y',
        '-p${password ?? ""}',
        entryPath,
      ];
      final result = await Process.run(bin, args);
      final stderr = result.stderr.toString();
      if (result.exitCode == 2 || _isPasswordError(stderr)) {
        throw Exception('Wrong password or corrupted archive.');
      }
      if (result.exitCode != 0 && result.exitCode != 1) {
        throw Exception('Extraction failed: $stderr');
      }
    }

    // Find the extracted file (7z -e strips the directory structure)
    final filename = p.basename(entryPath.replaceAll('\\', '/'));
    final extracted = File(p.join(tempDir.path, filename));
    if (!extracted.existsSync()) {
      // Fallback: return the first non-.tar file found
      final found = tempDir
          .listSync()
          .whereType<File>()
          .where((f) => !f.path.toLowerCase().endsWith('.tar'))
          .toList();
      if (found.isEmpty) throw Exception('Extracted file not found in temp dir.');
      return found.first.path;
    }
    return extracted.path;
    // Caller (TempPreviewManager) is responsible for cleanup on both
    // success and failure.
  }

  /// Extracts an archive to [outputDir].
  static Stream<ExtractionProgress> extract(
    String archivePath,
    String outputDir, {
    String? password,
    void Function(String)? onLog,
  }) async* {
    final bin = await findBinary();
    if (bin == null) throw Exception('7zip binary not found.');

    final args = [
      'x',
      archivePath,
      '-o$outputDir',
      '-y',
      if (password != null) '-p$password',
      '--',
      archivePath,
    ];

    // Correct args: remove duplicate archivePath
    final extractArgs = [
      'x',
      archivePath,
      '-o$outputDir',
      '-y',
      if (password != null) '-p$password',
    ];

    final process = await Process.start(bin, extractArgs, runInShell: Platform.isWindows);

    // Collect stderr concurrently to avoid pipe-buffer deadlocks and to
    // detect password errors regardless of exit code.
    final stderrFuture = process.stderr.transform(utf8.decoder).join();

    int extracted = 0;

    await for (final line in process.stdout.transform(utf8.decoder).transform(const LineSplitter())) {
      onLog?.call(line);
      if (line.startsWith('Extracting') || line.contains('%')) {
        extracted++;
        // Parse percentage if present: "  5% - filename"
        final pct = RegExp(r'(\d+)%').firstMatch(line);
        if (pct != null) {
          yield ExtractionProgress(
            percent: int.parse(pct.group(1)!).toDouble(),
            currentFile: line.replaceAll(RegExp(r'^\s*\d+%\s*-?\s*'), '').trim(),
          );
        } else {
          final file = line.replaceFirst('Extracting  ', '').trim();
          if (file.isNotEmpty) {
            extracted++;
            yield ExtractionProgress(percent: -1, currentFile: file);
          }
        }
      }
    }

    final stderrContent = await stderrFuture;
    final exitCode = await process.exitCode;
    if (exitCode == 2 || (exitCode != 0 && _isPasswordError(stderrContent))) {
      if (_isVolumeError(stderrContent)) {
        throw Exception('Split archive incomplete: volumes are missing. Make sure all parts are in the same folder.');
      }
      throw Exception('Wrong password or corrupted archive.');
    }
    if (exitCode != 0) throw Exception('Extraction failed (code $exitCode).');
    yield ExtractionProgress(percent: 100, currentFile: '', done: true);
  }

  // ── Compress ─────────────────────────────────────────────────────────────────

  /// Creates an archive from [sourcePaths] at [outputPath].
  ///
  /// Yields [ExtractionProgress] events while the process runs.
  /// The last event always has [ExtractionProgress.done] == true.
  static Stream<ExtractionProgress> compress({
    required List<String> sourcePaths,
    required String outputPath,
    required ArchiveFormat format,
    required CompressionLevel level,
    String? password,
    SplitSize splitSize = SplitSize.none,
    void Function(String)? onLog,
  }) async* {
    final binary = await findBinary();
    if (binary == null) throw Exception('7zip binary not found. Please install 7-Zip.');

    final args = <String>[
      'a',
      if (format.typeFlag != null) format.typeFlag!,
      if (format.supportsLevel) '-mx=${level.value}',
      '-mmt=on', // multithreading
      if (password != null && password.isNotEmpty) ...[
        '-p$password',
        if (format == ArchiveFormat.sevenZip) '-mhe=on', // encrypt headers
      ],
      if (splitSize.flag != null) '-v${splitSize.flag}',
      outputPath,
      ...sourcePaths,
    ];

    final process = await Process.start(binary, args, runInShell: Platform.isWindows);
    final stderrFuture = process.stderr.transform(const Utf8Decoder(allowMalformed: true)).join();

    // 7zip progress lines look like:  "  5% - filename.txt"  or  "  5%"
    final percentRe = RegExp(r'^\s*(\d+)%(?:\s*-\s*(.*))?$');

    await for (final line in process.stdout
        .transform(const Utf8Decoder(allowMalformed: true))
        .transform(const LineSplitter())) {
      onLog?.call(line);
      final m = percentRe.firstMatch(line.trim());
      if (m != null) {
        final pct = double.tryParse(m.group(1)!) ?? -1;
        final file = m.group(2)?.trim() ?? '';
        yield ExtractionProgress(percent: pct, currentFile: file);
      }
    }

    final stderr = await stderrFuture;
    final exitCode = await process.exitCode;

    if (exitCode == 0 || exitCode == 1) {
      yield ExtractionProgress(percent: 100, currentFile: '', done: true);
    } else {
      final msg = stderr.isNotEmpty ? stderr : 'Compression failed (exit $exitCode)';
      throw Exception(msg);
    }
  }

  // ── Raw pass-through ────────────────────────────────────────────────────────

  /// The process currently running via [runRaw], if any.
  /// Used by [killRaw] to terminate it.
  static Process? _rawProcess;

  /// Runs 7zip with arbitrary [args] and streams each output line.
  ///
  /// The last yielded line is always `[Exit code: N]` so callers can
  /// detect completion and parse the exit code.
  static Stream<String> runRaw(List<String> args) async* {
    final binary = await findBinary();
    if (binary == null) {
      yield '7zip binary not found. Make sure 7zz is installed or bundled.';
      yield '[Exit code: 127]';
      return;
    }

    final Process process;
    try {
      process = await Process.start(binary, args);
    } catch (e) {
      yield 'Failed to start process: $e';
      yield '[Exit code: 1]';
      return;
    }

    _rawProcess = process;

    // Merge stdout and stderr into a single ordered stream.
    final controller = StreamController<String>();
    var remaining = 2;
    void onDone() { if (--remaining == 0) controller.close(); }

    process.stdout
        .transform(const Utf8Decoder(allowMalformed: true))
        .transform(const LineSplitter())
        .listen(controller.add, onDone: onDone, cancelOnError: false);

    process.stderr
        .transform(const Utf8Decoder(allowMalformed: true))
        .transform(const LineSplitter())
        .listen(controller.add, onDone: onDone, cancelOnError: false);

    await for (final line in controller.stream) {
      yield line;
    }

    final exitCode = await process.exitCode;
    _rawProcess = null;
    yield '[Exit code: $exitCode]';
  }

  /// Kills the process currently running via [runRaw], if any.
  static void killRaw() {
    _rawProcess?.kill(ProcessSignal.sigterm);
    _rawProcess = null;
  }

  // ── List / parse ─────────────────────────────────────────────────────────────

  @visibleForTesting
  static List<ArchiveEntry> parseListOutput(String output) {
    final entries = <ArchiveEntry>[];
    final blocks = output.split('----------');
    if (blocks.length < 2) return entries;

    final fileSection = blocks.last;
    final rawEntries = fileSection.split('\n\n');

    for (final block in rawEntries) {
      if (block.trim().isEmpty) continue;

      String? path;
      int size = 0;
      bool isDir = false;
      DateTime? modified;

      for (final line in block.split('\n')) {
        final trimmed = line.trim();
        if (trimmed.startsWith('Path = ')) {
          path = trimmed.substring(7).trim();
        } else if (trimmed.startsWith('Size = ')) {
          size = int.tryParse(trimmed.substring(7).trim()) ?? 0;
        } else if (trimmed.startsWith('Attributes = ')) {
          isDir = trimmed.contains('D');
        } else if (trimmed.startsWith('Modified = ')) {
          try {
            modified = DateTime.parse(trimmed.substring(11).trim().replaceFirst(' ', 'T'));
          } catch (_) {}
        }
      }

      if (path != null && path.isNotEmpty) {
        entries.add(ArchiveEntry(
          path: path,
          size: size,
          isDirectory: isDir,
          modified: modified,
        ));
      }
    }

    return entries;
  }
}

class ExtractionProgress {
  final double percent; // -1 = unknown
  final String currentFile;
  final bool done;

  const ExtractionProgress({
    required this.percent,
    required this.currentFile,
    this.done = false,
  });
}
