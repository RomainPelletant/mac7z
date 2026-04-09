import 'dart:io';
import '../models/archive_entry.dart';
import 'archive_types.dart';

// ── Backend type ──────────────────────────────────────────────────────────────

enum BackendType {
  bundled('7-Zip (intégré)', 'Binaire 7zz embarqué dans l\'application'),
  system('7-Zip (système)', 'Utilise le 7z/7zz installé sur le système'),
  dartArchive('Dart Archive', 'Moteur pur Dart — sans binaire natif');

  final String label;
  final String description;
  const BackendType(this.label, this.description);
}

// ── Abstract backend ──────────────────────────────────────────────────────────

abstract class ArchiveBackend {
  BackendType get type;

  /// Returns the resolved binary path, or null if unavailable.
  Future<String?> findBinary();

  /// Lists archive contents without extracting.
  Future<List<ArchiveEntry>> listContents(
    String archivePath, {
    String? password,
  });

  /// Extracts a single entry to [outputDir]. Returns the extracted file path.
  Future<String> extractSingleFile(
    String archivePath,
    String entryPath, {
    required Directory outputDir,
    String? password,
  });

  /// Extracts the whole archive, streaming progress events.
  Stream<ExtractionProgress> extract(
    String archivePath,
    String outputDir, {
    String? password,
    void Function(String)? onLog,
  });

  /// Compresses [sourcePaths] into [outputPath], streaming progress events.
  Stream<ExtractionProgress> compress({
    required List<String> sourcePaths,
    required String outputPath,
    required ArchiveFormat format,
    required CompressionLevel level,
    String? password,
    SplitSize splitSize,
    void Function(String)? onLog,
  });

  /// Runs 7zip with arbitrary [args], streaming each output line.
  /// Last line is always `[Exit code: N]`.
  Stream<String> runRaw(List<String> args);

  /// Kills the process started by [runRaw], if any.
  void killRaw();
}
