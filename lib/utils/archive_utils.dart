import 'package:path/path.dart' as p;

/// Supported single-part extensions.
const kSingleExtensions = [
  'zip', '7z', 'rar', 'tar', 'gz', 'bz2', 'xz',
  'txz', 'tgz', 'tbz', 'tbz2', 'lzma', 'zst', 'cab', 'iso',
];

/// Compound archive extensions (must be checked before single-extension).
const kCompoundExtensions = [
  '.tar.xz', '.tar.gz', '.tar.bz2', '.tar.zst', '.tar.lzma',
];

/// Returns true when [path] has a recognised archive extension.
/// Also handles split volumes like `archive.7z.001`, `archive.zip.002`.
bool isArchive(String path) {
  final lower = path.toLowerCase();
  if (kCompoundExtensions.any((e) => lower.endsWith(e))) return true;
  if (_isSplitVolume(lower)) return true;
  final ext = lower.split('.').last;
  return kSingleExtensions.contains(ext);
}

/// Returns true for split volume files like `archive.7z.001`, `archive.zip.002`.
/// Matches any file whose last component is purely numeric and whose
/// penultimate extension is a known archive type.
bool _isSplitVolume(String lowerPath) {
  final parts = lowerPath.split('.');
  if (parts.length < 3) return false;
  final last = parts.last;
  if (!RegExp(r'^\d+$').hasMatch(last)) return false;
  final penultimate = parts[parts.length - 2];
  return kSingleExtensions.contains(penultimate);
}

/// Returns the archive name without its extension(s).
/// Handles compound extensions like `.tar.xz`, `.tar.gz`, etc.
///
/// Examples:
///   `archiveBaseName('archive.tar.xz')` → `'archive'`
///   `archiveBaseName('release.zip')`    → `'release'`
///   `archiveBaseName('a/b/file.7z')`    → `'file'`
String archiveBaseName(String path) {
  final name = p.basename(path);
  final lower = name.toLowerCase();

  // Compound extensions: .tar.xz, .tar.gz, etc.
  for (final ext in kCompoundExtensions) {
    if (lower.endsWith(ext)) {
      return name.substring(0, name.length - ext.length);
    }
  }

  // Split volume: archive.7z.001 → archive
  final parts = name.split('.');
  if (parts.length >= 3) {
    final last = parts.last;
    if (RegExp(r'^\d+$').hasMatch(last)) {
      final penultimate = parts[parts.length - 2].toLowerCase();
      if (kSingleExtensions.contains(penultimate)) {
        return parts.sublist(0, parts.length - 2).join('.');
      }
    }
  }

  return p.basenameWithoutExtension(name);
}
