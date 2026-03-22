// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get dropZoneDrop => 'Drop an archive';

  @override
  String get dropZoneRelease => 'Release to open';

  @override
  String get dropZoneSubtitle => 'or click to select\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count files',
      one: '$count file',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Protected archive';

  @override
  String get passwordDialogSubtitle => 'Enter the password';

  @override
  String get passwordDialogHint => 'Password…';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get logPanelTitle => 'Log';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries',
      one: '$count entry',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'No activity';

  @override
  String get progressExtracting => 'Extracting…';

  @override
  String get progressDone => 'Extraction complete!';

  @override
  String get treeLoading => 'Reading archive…';

  @override
  String get treeError => 'Error';

  @override
  String get treeEmpty => 'No archive loaded';

  @override
  String get treeEmptyHint => 'Drop a file to see its contents';

  @override
  String get treeSearch => 'Search…';

  @override
  String get treeColName => 'Name';

  @override
  String get treeColSize => 'Size';

  @override
  String get treeColModified => 'Modified';

  @override
  String get treeOpenTooltip => 'Double-click to open';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destination';

  @override
  String get sectionSecurity => 'Security';

  @override
  String get destinationSameFolder => 'Same folder as archive';

  @override
  String get subfolderCreate => 'Extract to a subfolder';

  @override
  String get subfolderDefault => 'named after the archive';

  @override
  String get passwordNone => 'No password';

  @override
  String get passwordSetLabel => 'Password set';

  @override
  String get passwordEdit => 'Edit';

  @override
  String get passwordDefine => 'Set';

  @override
  String get btnExtract => 'Extract';

  @override
  String get btnExtracting => 'Extracting...';

  @override
  String get btnDone => 'Done ✓';

  @override
  String get btnReset => 'Reset';

  @override
  String binaryWarning(String cmd) {
    return '7zip not found. Install it: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Open an archive';

  @override
  String get pickOutputDialogTitle => 'Choose destination folder';

  @override
  String logBinaryFound(String path) {
    return '7zip found: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip not found. Install it via Homebrew (macOS) or 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'No recognized archive in dropped files.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Unsupported format: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Reading archive: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entries found in archive.',
      one: '1 entry found in archive.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Encrypted archive — password required.';

  @override
  String get logFilePasswordRequired => 'Encrypted file — password required.';

  @override
  String get logPasswordDefined => 'Password set.';

  @override
  String get logCancelled => 'Cancelled.';

  @override
  String logDestination(String path) {
    return 'Destination: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Extracting to: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extraction complete in: $path';
  }

  @override
  String get logReset => 'Reset.';

  @override
  String logOpening(String name) {
    return 'Opening $name…';
  }

  @override
  String logOpened(String name) {
    return 'Opened: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Error opening: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Extraction error: $error';
  }

  @override
  String logError(String error) {
    return 'Error: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Incomplete split archive — missing parts. Cannot display contents.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Incomplete split archive — missing parts. Displayed content may be partial.';

  @override
  String get logExtractionSplitError => 'Extraction failed: missing parts.';

  @override
  String get errorSplitArchive =>
      '⚠️ Incomplete split archive — make sure all parts are in the same folder.';

  @override
  String get tabDecompression => 'Decompression';

  @override
  String get tabCompression => 'Compression';

  @override
  String get tabConsoleApi => 'Console API';

  @override
  String get tabComingSoon => 'Coming soon';

  @override
  String get compLabelArchiveName => 'Archive name';

  @override
  String get compLabelDestination => 'Destination';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Compression level';

  @override
  String get compLabelSecurity => 'Security';

  @override
  String get compLabelAdvanced => 'Advanced options';

  @override
  String get compLabelSplit => 'Split';

  @override
  String get compSizeFolder => 'folder';

  @override
  String get compDestSameFolder => 'Same folder as files';

  @override
  String compLevelNotApplicable(String format) {
    return 'Not applicable for .$format';
  }

  @override
  String get compHeaderEncryption => 'Header encryption enabled';

  @override
  String get compSplitNone => 'None';

  @override
  String get compBtnCompress => 'Compress';

  @override
  String get compBtnCompressing => 'Compressing…';

  @override
  String get compAddFiles => 'Add files';

  @override
  String get compAddFolder => 'Add folder';

  @override
  String get compDropToAdd => 'Drop to add';

  @override
  String get compDropHint => 'Drop files or folders here';

  @override
  String get compDropSubtitle => 'Files will be added to the archive';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Compressing → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archive created: $path';
  }
}
