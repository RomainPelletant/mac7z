import 'dart:async';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;
import '../models/archive_entry.dart';
import 'archive_backend.dart';
import 'archive_types.dart';

// ── DartArchiveBackend ────────────────────────────────────────────────────────
//
// Pure-Dart archive backend using the `archive` package.
// No native binary required — works out of the box on all platforms.
//
// Supported read:  zip, tar, tar.gz/tgz, tar.bz2/tbz2, tar.xz/txz
// Supported write: zip, tar, tar.gz, tar.bz2
// Not supported:   7z, rar, encrypted archives, split archives
//
// Note: tar.xz write is omitted — the archive package has no XZEncoder.
// For those formats, use the 7-Zip backend.

class DartArchiveBackend implements ArchiveBackend {
  @override
  BackendType get type => BackendType.dartArchive;

  // ── findBinary ──────────────────────────────────────────────────────────────

  /// Always available — no binary needed.
  @override
  Future<String?> findBinary() async => 'dart:archive';

  // ── listContents ────────────────────────────────────────────────────────────

  @override
  Future<List<ArchiveEntry>> listContents(
    String archivePath, {
    String? password,
  }) async {
    if (password != null && password.isNotEmpty) {
      throw Exception(
          'Le backend Dart Archive ne supporte pas les archives chiffrées.\n'
          'Utilisez le backend 7-Zip pour ce fichier.');
    }

    final archive = await _decodeArchive(archivePath);
    return _toEntries(archive);
  }

  // ── extractSingleFile ───────────────────────────────────────────────────────

  @override
  Future<String> extractSingleFile(
    String archivePath,
    String entryPath, {
    required Directory outputDir,
    String? password,
  }) async {
    if (password != null && password.isNotEmpty) {
      throw Exception(
          'Le backend Dart Archive ne supporte pas les archives chiffrées.');
    }

    final archive = await _decodeArchive(archivePath);
    final normalised = entryPath.replaceAll('\\', '/');

    final file = archive.files.firstWhere(
      (f) => f.name.replaceAll('\\', '/') == normalised,
      orElse: () =>
          throw Exception('Fichier introuvable dans l\'archive : $entryPath'),
    );

    final outPath = p.join(outputDir.path, p.basename(normalised));
    final outStream = OutputFileStream(outPath);
    try {
      file.writeContent(outStream);
    } finally {
      outStream.close();
    }
    return outPath;
  }

  // ── extract ─────────────────────────────────────────────────────────────────

  @override
  Stream<ExtractionProgress> extract(
    String archivePath,
    String outputDir, {
    String? password,
    void Function(String)? onLog,
  }) async* {
    if (password != null && password.isNotEmpty) {
      throw Exception(
          'Le backend Dart Archive ne supporte pas les archives chiffrées.\n'
          'Utilisez le backend 7-Zip pour ce fichier.');
    }

    final archive = await _decodeArchive(archivePath);
    final files = archive.files.where((f) => f.isFile).toList();
    final total = files.length;
    int done = 0;

    for (final file in files) {
      final relativePath = file.name.replaceAll('\\', '/');
      final outPath = p.join(outputDir, relativePath);

      // Ensure parent directories exist
      await Directory(p.dirname(outPath)).create(recursive: true);

      final outStream = OutputFileStream(outPath);
      try {
        file.writeContent(outStream);
      } finally {
        outStream.close();
      }

      done++;
      onLog?.call('Extracting  $relativePath');
      yield ExtractionProgress(
        percent: (done / total * 100).clamp(0, 99),
        currentFile: p.basename(relativePath),
      );
    }

    yield ExtractionProgress(percent: 100, currentFile: '', done: true);
  }

  // ── compress ─────────────────────────────────────────────────────────────────

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
    // Unsupported options
    if (password != null && password.isNotEmpty) {
      throw Exception(
          'Le backend Dart Archive ne supporte pas le chiffrement.\n'
          'Utilisez le backend 7-Zip pour créer des archives protégées.');
    }
    if (splitSize != SplitSize.none) {
      throw Exception(
          'Le backend Dart Archive ne supporte pas le découpage en volumes.\n'
          'Utilisez le backend 7-Zip pour cette option.');
    }
    if (format == ArchiveFormat.sevenZip) {
      throw Exception(
          'Le backend Dart Archive ne supporte pas le format 7z.\n'
          'Utilisez le backend 7-Zip pour créer des archives 7z.');
    }
    if (format == ArchiveFormat.tarXz) {
      throw Exception(
          'Le backend Dart Archive ne supporte pas l\'écriture tar.xz.\n'
          'Utilisez le backend 7-Zip pour ce format.');
    }

    // Collect all source files recursively
    final allFiles = <_SourceFile>[];
    for (final sourcePath in sourcePaths) {
      final type = await FileSystemEntity.type(sourcePath);
      if (type == FileSystemEntityType.file) {
        allFiles.add(_SourceFile(sourcePath, p.basename(sourcePath)));
      } else if (type == FileSystemEntityType.directory) {
        final baseName = p.basename(sourcePath);
        await _collectFiles(Directory(sourcePath), baseName, allFiles);
      }
    }

    final total = allFiles.length;
    final archive = Archive();
    int done = 0;

    // Add files to archive
    for (final src in allFiles) {
      final bytes = await File(src.absolutePath).readAsBytes();
      final stat = await File(src.absolutePath).stat();
      final entry = ArchiveFile.noCompress(
        src.archivePath,
        bytes.length,
        bytes,
      );
      entry.lastModTime =
          stat.modified.millisecondsSinceEpoch ~/ 1000;
      archive.addFile(entry);

      done++;
      onLog?.call('Adding  ${src.archivePath}');
      yield ExtractionProgress(
        percent: (done / total * 50).clamp(0, 49), // first 50% = adding files
        currentFile: p.basename(src.archivePath),
      );
    }

    // Encode to bytes
    yield ExtractionProgress(percent: 50, currentFile: 'Encoding…');
    final encoded = _encodeArchive(archive, format, level);

    // Write to disk
    yield ExtractionProgress(percent: 90, currentFile: 'Writing…');
    await File(outputPath).writeAsBytes(encoded);

    yield ExtractionProgress(percent: 100, currentFile: '', done: true);
  }

  // ── runRaw ──────────────────────────────────────────────────────────────────

  @override
  Stream<String> runRaw(List<String> args) async* {
    yield 'Le backend Dart Archive n\'a pas d\'interface console.';
    yield 'Sélectionnez le backend 7-Zip (intégré) dans les Préférences pour utiliser la Console API.';
    yield '[Exit code: 1]';
  }

  @override
  void killRaw() {
    // No-op: no process to kill
  }

  // ── Internal helpers ────────────────────────────────────────────────────────

  /// Decodes any supported archive format from [archivePath].
  Future<Archive> _decodeArchive(String archivePath) async {
    final lower = archivePath.toLowerCase();

    if (lower.endsWith('.zip')) {
      final stream = InputFileStream(archivePath);
      return ZipDecoder().decodeBuffer(stream);
    }

    if (lower.endsWith('.tar')) {
      final stream = InputFileStream(archivePath);
      return TarDecoder().decodeBuffer(stream);
    }

    if (lower.endsWith('.tar.gz') || lower.endsWith('.tgz')) {
      final bytes = await File(archivePath).readAsBytes();
      final tarBytes = GZipDecoder().decodeBytes(bytes);
      return TarDecoder().decodeBytes(tarBytes);
    }

    if (lower.endsWith('.tar.bz2') ||
        lower.endsWith('.tbz2') ||
        lower.endsWith('.tbz')) {
      final bytes = await File(archivePath).readAsBytes();
      final tarBytes = BZip2Decoder().decodeBytes(bytes);
      return TarDecoder().decodeBytes(tarBytes);
    }

    if (lower.endsWith('.tar.xz') || lower.endsWith('.txz')) {
      final bytes = await File(archivePath).readAsBytes();
      final tarBytes = XZDecoder().decodeBytes(bytes);
      return TarDecoder().decodeBytes(tarBytes);
    }

    if (lower.endsWith('.gz')) {
      // Single-file gzip: wrap in a one-entry archive
      final bytes = await File(archivePath).readAsBytes();
      final decompressed = GZipDecoder().decodeBytes(bytes);
      final archive = Archive();
      final name = p.basenameWithoutExtension(archivePath);
      archive.addFile(ArchiveFile(name, decompressed.length, decompressed));
      return archive;
    }

    if (lower.endsWith('.bz2')) {
      final bytes = await File(archivePath).readAsBytes();
      final decompressed = BZip2Decoder().decodeBytes(bytes);
      final archive = Archive();
      final name = p.basenameWithoutExtension(archivePath);
      archive.addFile(ArchiveFile(name, decompressed.length, decompressed));
      return archive;
    }

    if (lower.endsWith('.7z') || lower.endsWith('.rar')) {
      final ext = p.extension(archivePath).toUpperCase();
      throw Exception(
          'Le backend Dart Archive ne supporte pas le format $ext.\n'
          'Utilisez le backend 7-Zip pour ce fichier.');
    }

    throw Exception(
        'Format non reconnu : ${p.extension(archivePath)}\n'
        'Formats supportés par Dart Archive : zip, tar, tar.gz, tar.bz2, tar.xz');
  }

  /// Converts archive entries to [ArchiveEntry] model.
  List<ArchiveEntry> _toEntries(Archive archive) {
    return archive.files.map((f) {
      final isDir = !f.isFile;
      return ArchiveEntry(
        path: f.name.replaceAll('\\', '/'),
        size: f.size,
        isDirectory: isDir,
        modified: f.lastModTime != 0
            ? DateTime.fromMillisecondsSinceEpoch(f.lastModTime * 1000)
            : null,
      );
    }).toList();
  }

  /// Encodes [archive] to bytes for [format].
  List<int> _encodeArchive(
    Archive archive,
    ArchiveFormat format,
    CompressionLevel level,
  ) {
    // Map CompressionLevel to zip level (1–9)
    final zipLevel = level.value.clamp(1, 9);

    switch (format) {
      case ArchiveFormat.zip:
        return ZipEncoder().encode(archive, level: zipLevel)!;

      case ArchiveFormat.tar:
        return TarEncoder().encode(archive);

      case ArchiveFormat.tarGz:
        final tarBytes = TarEncoder().encode(archive);
        return GZipEncoder().encode(tarBytes, level: zipLevel)!;

      case ArchiveFormat.tarBz2:
        final tarBytes = TarEncoder().encode(archive);
        return BZip2Encoder().encode(tarBytes);

      // tarXz and sevenZip are filtered out before calling this method
      case ArchiveFormat.tarXz:
      case ArchiveFormat.sevenZip:
        throw Exception('Format non supporté par le backend Dart Archive.');
    }
  }

  /// Recursively collects files from [dir], prefixing with [archivePrefix].
  Future<void> _collectFiles(
    Directory dir,
    String archivePrefix,
    List<_SourceFile> out,
  ) async {
    await for (final entity in dir.list(recursive: false)) {
      final name = p.basename(entity.path);
      final arcPath = '$archivePrefix/$name';
      if (entity is File) {
        out.add(_SourceFile(entity.path, arcPath));
      } else if (entity is Directory) {
        await _collectFiles(entity, arcPath, out);
      }
    }
  }
}

// ── Helper types ──────────────────────────────────────────────────────────────

class _SourceFile {
  final String absolutePath;
  final String archivePath;
  const _SourceFile(this.absolutePath, this.archivePath);
}
