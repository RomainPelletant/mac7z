// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get dropZoneDrop => 'Glisați un arhiv';

  @override
  String get dropZoneRelease => 'Eliberați pentru a deschide';

  @override
  String get dropZoneSubtitle =>
      'sau faceți clic pentru a selecta\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de fișiere',
      few: '$count fișiere',
      one: '$count fișier',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Arhiv protejat';

  @override
  String get passwordDialogSubtitle => 'Introduceți parola';

  @override
  String get passwordDialogHint => 'Parola…';

  @override
  String get cancel => 'Anulare';

  @override
  String get confirm => 'Confirmă';

  @override
  String get logPanelTitle => 'Jurnal';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de intrări',
      few: '$count intrări',
      one: '$count intrare',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Nicio activitate';

  @override
  String get progressExtracting => 'Se extrage…';

  @override
  String get progressDone => 'Extragere completă!';

  @override
  String get treeLoading => 'Se citește arhivul…';

  @override
  String get treeError => 'Eroare';

  @override
  String get treeEmpty => 'Niciun arhiv încărcat';

  @override
  String get treeEmptyHint => 'Glisați un fișier pentru a-i vedea conținutul';

  @override
  String get treeSearch => 'Căutare…';

  @override
  String get treeColName => 'Nume';

  @override
  String get treeColSize => 'Dimensiune';

  @override
  String get treeColModified => 'Modificat';

  @override
  String get treeOpenTooltip => 'Faceți dublu clic pentru a deschide';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de elemente',
      few: '$count elemente',
      one: '$count element',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destinație';

  @override
  String get sectionSecurity => 'Securitate';

  @override
  String get destinationSameFolder => 'Același dosar cu arhivul';

  @override
  String get subfolderCreate => 'Extragere într-un subdosar';

  @override
  String get subfolderDefault => 'numit după arhiv';

  @override
  String get passwordNone => 'Nicio parolă';

  @override
  String get passwordSetLabel => 'Parolă stabilită';

  @override
  String get passwordEdit => 'Editare';

  @override
  String get passwordDefine => 'Setare';

  @override
  String get btnExtract => 'Extragere';

  @override
  String get btnExtracting => 'Se extrage...';

  @override
  String get btnDone => 'Gata ✓';

  @override
  String get btnReset => 'Resetare';

  @override
  String binaryWarning(String cmd) {
    return '7zip nu a fost găsit. Instalați-l: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Deschideți un arhiv';

  @override
  String get pickOutputDialogTitle => 'Alegeți dosarul de destinație';

  @override
  String logBinaryFound(String path) {
    return '7zip găsit: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip nu a fost găsit. Instalați prin Homebrew (macOS) sau 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Niciun arhiv recunoscut în fișierele glisate.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Format nesuportat: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Se citește arhivul: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de intrări găsite în arhiv.',
      few: '$count intrări găsite în arhiv.',
      one: '1 intrare găsită în arhiv.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Arhiv criptat — parolă necesară.';

  @override
  String get logFilePasswordRequired => 'Fișier criptat — parolă necesară.';

  @override
  String get logPasswordDefined => 'Parolă stabilită.';

  @override
  String get logCancelled => 'Anulat.';

  @override
  String logDestination(String path) {
    return 'Destinație: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Se extrage în: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extragere completă în: $path';
  }

  @override
  String get logReset => 'Resetare.';

  @override
  String logOpening(String name) {
    return 'Se deschide $name…';
  }

  @override
  String logOpened(String name) {
    return 'Deschis: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Eroare la deschidere: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Eroare de extragere: $error';
  }

  @override
  String logError(String error) {
    return 'Eroare: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Arhiv divizat incomplet — piese lipsă. Nu se poate afișa conținutul.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Arhiv divizat incomplet — piese lipsă. Conținutul afișat poate fi incomplet.';

  @override
  String get logExtractionSplitError => 'Extragere eșuată: piese lipsă.';

  @override
  String get errorSplitArchive =>
      '⚠️ Arhiv divizat incomplet — asigurați-vă că toate piesele se află în același dosar.';

  @override
  String get tabDecompression => 'Decomprimare';

  @override
  String get tabCompression => 'Comprimare';

  @override
  String get tabConsoleApi => 'Consolă API';

  @override
  String get tabComingSoon => 'În curând';

  @override
  String get compLabelArchiveName => 'Numele arhivului';

  @override
  String get compLabelDestination => 'Destinație';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Nivel de compresie';

  @override
  String get compLabelSecurity => 'Securitate';

  @override
  String get compLabelAdvanced => 'Opțiuni avansate';

  @override
  String get compLabelSplit => 'Divide';

  @override
  String get compSizeFolder => 'dosar';

  @override
  String get compDestSameFolder => 'Același dosar ca și fișierele';

  @override
  String compLevelNotApplicable(String format) {
    return 'Nu se aplică pentru .$format';
  }

  @override
  String get compHeaderEncryption => 'Criptare antet activată';

  @override
  String get compSplitNone => 'Niciunul';

  @override
  String get compBtnCompress => 'Comprimă';

  @override
  String get compBtnCompressing => 'Se comprimă…';

  @override
  String get compAddFiles => 'Adaugă fișiere';

  @override
  String get compAddFolder => 'Adaugă dosar';

  @override
  String get compDropToAdd => 'Glisați pentru a adăuga';

  @override
  String get compDropHint => 'Glisați fișierele sau dosarele aici';

  @override
  String get compDropSubtitle => 'Fișierele vor fi adăugate la arhiv';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de elemente',
      few: '$count elemente',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Se comprimă → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arhiv creat: $path';
  }
}
