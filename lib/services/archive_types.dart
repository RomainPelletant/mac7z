// ── Shared types used by ArchiveBackend and SevenZipService ──────────────────
//
// Kept in a separate file to avoid circular imports between
// archive_backend.dart and seven_zip_service.dart.

// ── Compression enums ─────────────────────────────────────────────────────────

enum ArchiveFormat {
  sevenZip('7z', '-t7z', true, true),
  zip('zip', '-tzip', true, false),
  tar('tar', '-ttar', false, false),
  tarGz('tar.gz', null, true, false),
  tarBz2('tar.bz2', null, true, false),
  tarXz('tar.xz', null, true, false);

  final String label;
  final String? typeFlag;
  final bool supportsLevel;
  final bool supportsEncryption;

  const ArchiveFormat(
      this.label, this.typeFlag, this.supportsLevel, this.supportsEncryption);
}

enum CompressionLevel {
  store('Store', 0),
  fastest('Fastest', 1),
  fast('Fast', 3),
  normal('Normal', 5),
  maximum('Maximum', 7),
  ultra('Ultra', 9);

  final String label;
  final int value;
  const CompressionLevel(this.label, this.value);
}

enum SplitSize {
  none('No split', null),
  mb10('10 MB', '10m'),
  mb100('100 MB', '100m'),
  mb700('700 MB (CD)', '700m'),
  gb1('1 GB', '1g'),
  gb4('4 GB (FAT32)', '4g');

  final String label;
  final String? flag;
  const SplitSize(this.label, this.flag);
}

// ── Progress ──────────────────────────────────────────────────────────────────

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
