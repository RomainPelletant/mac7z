import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:path/path.dart' as p;
import '../models/archive_entry.dart';
import 'archive_backend.dart';
import 'archive_types.dart';

export 'archive_types.dart';

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

// ── SevenZipService ───────────────────────────────────────────────────────────

/// Concrete [ArchiveBackend] backed by the 7zz binary (bundled or system).
///
/// [preferSystem] controls binary resolution priority:
///   - false (default / bundled): bundled binary first, system fallback.
///   - true (system): skip bundled binary, use system-installed 7z/7zz only.
class SevenZipService implements ArchiveBackend {
  SevenZipService({this.preferSystem = false});

  final bool preferSystem;

  /// Cached resolved binary path for this instance.
  String? _binaryPath;

  @override
  BackendType get type =>
      preferSystem ? BackendType.system : BackendType.bundled;

  // ── Binary resolution ───────────────────────────────────────────────────────

  /// Returns the path of the 7zz binary bundled inside the app bundle.
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

  @override
  Future<String?> findBinary() async {
    if (_binaryPath != null) return _binaryPath;

    if (!preferSystem) {
      // 1. Try bundled binary first
      final bundled = await _bundledBinaryPath();
      if (bundled != null) {
        try {
          final result = await Process.run(bundled, ['i']);
          if (result.exitCode == 0 ||
              result.stdout.toString().contains('7-Zip')) {
            _binaryPath = bundled;
            return _binaryPath;
          }
        } catch (_) {}
      }
    }

    // 2. System-installed binaries
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
        if (result.exitCode == 0 ||
            result.stdout.toString().contains('7-Zip')) {
          _binaryPath = c;
          return c;
        }
      } catch (_) {}
    }
    return null;
  }

  // ── List ────────────────────────────────────────────────────────────────────

  @override
  Future<List<ArchiveEntry>> listContents(
    String archivePath, {
    String? password,
  }) async {
    final bin = await findBinary();
    if (bin == null)
      throw Exception('7zip binary not found. Please install 7-Zip.');

    final args = ['l', '-slt', '-p${password ?? ""}', '--', archivePath];
    final result = await Process.run(bin, args, runInShell: Platform.isWindows);

    final stderr = result.stderr.toString();
    final stdout = result.stdout.toString();
    final allOutput = stdout + stderr;

    if (_isVolumeError(allOutput)) {
      throw SplitVolumeException(parseListOutput(stdout));
    }
    if (result.exitCode == 2 || _isPasswordError(allOutput)) {
      throw Exception('Wrong password or corrupted archive.');
    }
    if (result.exitCode != 0 && result.exitCode != 1) {
      throw Exception('7zip error: $stderr');
    }

    final entries = parseListOutput(stdout);

    if (entries.length == 1 &&
        entries.first.extension == 'tar' &&
        !entries.first.isDirectory) {
      return _listCompoundTar(bin, archivePath, password: password);
    }

    return entries;
  }

  // ── Extract single file ─────────────────────────────────────────────────────

  @override
  Future<String> extractSingleFile(
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
      final outerArgs = [
        'e', archivePath, '-t$outer',
        '-o${tempDir.path}', '-y', '-p${password ?? ""}',
      ];
      final outerResult = await Process.run(bin, outerArgs);
      final outerStderr = outerResult.stderr.toString();
      if (outerResult.exitCode == 2 || _isPasswordError(outerStderr)) {
        throw Exception('Wrong password or corrupted archive.');
      }
      if (outerResult.exitCode != 0 && outerResult.exitCode != 1) {
        throw Exception('Outer extraction failed: $outerStderr');
      }

      final tarFiles = tempDir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.toLowerCase().endsWith('.tar'))
          .toList();
      if (tarFiles.isEmpty)
        throw Exception('Inner .tar not found after outer extraction.');

      final innerArgs = [
        'e', tarFiles.first.path, '-o${tempDir.path}', '-y', entryPath,
      ];
      final innerResult = await Process.run(bin, innerArgs);
      if (innerResult.exitCode != 0 && innerResult.exitCode != 1) {
        throw Exception('Inner extraction failed: ${innerResult.stderr}');
      }

      await tarFiles.first.delete();
    } else {
      final args = [
        'e', archivePath, '-o${tempDir.path}', '-y',
        '-p${password ?? ""}', entryPath,
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

    final filename = p.basename(entryPath.replaceAll('\\', '/'));
    final extracted = File(p.join(tempDir.path, filename));
    if (!extracted.existsSync()) {
      final found = tempDir
          .listSync()
          .whereType<File>()
          .where((f) => !f.path.toLowerCase().endsWith('.tar'))
          .toList();
      if (found.isEmpty)
        throw Exception('Extracted file not found in temp dir.');
      return found.first.path;
    }
    return extracted.path;
  }

  // ── Extract ─────────────────────────────────────────────────────────────────

  @override
  Stream<ExtractionProgress> extract(
    String archivePath,
    String outputDir, {
    String? password,
    void Function(String)? onLog,
  }) async* {
    final bin = await findBinary();
    if (bin == null) throw Exception('7zip binary not found.');

    final extractArgs = [
      'x', archivePath, '-o$outputDir', '-y',
      if (password != null) '-p$password',
    ];

    final process =
        await Process.start(bin, extractArgs, runInShell: Platform.isWindows);

    final stderrFuture = process.stderr.transform(utf8.decoder).join();

    int extracted = 0;
    await for (final line in process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())) {
      onLog?.call(line);
      if (line.startsWith('Extracting') || line.contains('%')) {
        extracted++;
        final pct = RegExp(r'(\d+)%').firstMatch(line);
        if (pct != null) {
          yield ExtractionProgress(
            percent: int.parse(pct.group(1)!).toDouble(),
            currentFile:
                line.replaceAll(RegExp(r'^\s*\d+%\s*-?\s*'), '').trim(),
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
        throw Exception(
            'Split archive incomplete: volumes are missing. Make sure all parts are in the same folder.');
      }
      throw Exception('Wrong password or corrupted archive.');
    }
    if (exitCode != 0) throw Exception('Extraction failed (code $exitCode).');
    yield ExtractionProgress(percent: 100, currentFile: '', done: true);
  }

  // ── Compress ─────────────────────────────────────────────────────────────────

  @override
  Stream<ExtractionProgress> compress({
    required List<String> sourcePaths,
    required String outputPath,
    required ArchiveFormat format,
    required CompressionLevel level,
    String? password,
    SplitSize splitSize = SplitSize.none,
    void Function(String)? onLog,
  }) async* {
    final binary = await findBinary();
    if (binary == null)
      throw Exception('7zip binary not found. Please install 7-Zip.');

    final args = <String>[
      'a',
      if (format.typeFlag != null) format.typeFlag!,
      if (format.supportsLevel) '-mx=${level.value}',
      '-mmt=on',
      if (password != null && password.isNotEmpty) ...[
        '-p$password',
        if (format == ArchiveFormat.sevenZip) '-mhe=on',
      ],
      if (splitSize.flag != null) '-v${splitSize.flag}',
      outputPath,
      ...sourcePaths,
    ];

    final process =
        await Process.start(binary, args, runInShell: Platform.isWindows);
    final stderrFuture = process.stderr
        .transform(const Utf8Decoder(allowMalformed: true))
        .join();

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
      final msg =
          stderr.isNotEmpty ? stderr : 'Compression failed (exit $exitCode)';
      throw Exception(msg);
    }
  }

  // ── Raw pass-through ────────────────────────────────────────────────────────

  Process? _rawProcess;

  @override
  Stream<String> runRaw(List<String> args) async* {
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

    final controller = StreamController<String>();
    var remaining = 2;
    void onDone() {
      if (--remaining == 0) controller.close();
    }

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

  @override
  void killRaw() {
    _rawProcess?.kill(ProcessSignal.sigterm);
    _rawProcess = null;
  }

  // ── Helpers ─────────────────────────────────────────────────────────────────

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

  @visibleForTesting
  static String? outerType(String archivePath) {
    final lower = archivePath.toLowerCase();
    if (lower.endsWith('.tar.gz') || lower.endsWith('.tgz')) return 'gzip';
    if (lower.endsWith('.tar.bz2') ||
        lower.endsWith('.tbz2') ||
        lower.endsWith('.tbz')) return 'bzip2';
    if (lower.endsWith('.tar.xz') || lower.endsWith('.txz')) return 'xz';
    if (lower.endsWith('.tar.zst')) return 'zstd';
    return null;
  }

  static Future<List<ArchiveEntry>> _listCompoundTar(
    String bin,
    String archivePath, {
    String? password,
  }) async {
    final tempDir = await Directory.systemTemp.createTemp('unzipper7_');
    try {
      final outer = SevenZipService.outerType(archivePath);

      final extractArgs = [
        'e', archivePath,
        if (outer != null) '-t$outer',
        '-o${tempDir.path}', '-y',
        if (password != null) '-p$password',
      ];
      final extractResult = await Process.run(bin, extractArgs);
      if (extractResult.exitCode != 0 && extractResult.exitCode != 1) {
        throw Exception(
            '7zip error (compound extract): ${extractResult.stderr}');
      }

      final tarFiles = tempDir
          .listSync()
          .whereType<File>()
          .where((f) => f.path.toLowerCase().endsWith('.tar'))
          .toList();
      if (tarFiles.isEmpty) return [];

      final listArgs = ['l', '-slt', '--', tarFiles.first.path];
      final listResult = await Process.run(bin, listArgs);
      return parseListOutput(listResult.stdout.toString());
    } finally {
      await tempDir.delete(recursive: true);
    }
  }

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
            modified = DateTime.parse(
                trimmed.substring(11).trim().replaceFirst(' ', 'T'));
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

