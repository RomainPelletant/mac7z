// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get dropZoneDrop => 'Rilascia un archivio';

  @override
  String get dropZoneRelease => 'Rilascia per aprire';

  @override
  String get dropZoneSubtitle =>
      'o fai clic per selezionare\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '$count file',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Archivio protetto';

  @override
  String get passwordDialogSubtitle => 'Inserisci la password';

  @override
  String get passwordDialogHint => 'Password…';

  @override
  String get cancel => 'Annulla';

  @override
  String get confirm => 'Conferma';

  @override
  String get logPanelTitle => 'Log';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count voci',
      one: '$count voce',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Nessuna attività';

  @override
  String get progressExtracting => 'Estrazione in corso…';

  @override
  String get progressDone => 'Estrazione completata!';

  @override
  String get treeLoading => 'Lettura archivio…';

  @override
  String get treeError => 'Errore';

  @override
  String get treeEmpty => 'Nessun archivio caricato';

  @override
  String get treeEmptyHint => 'Rilascia un file per vederne il contenuto';

  @override
  String get treeSearch => 'Cerca…';

  @override
  String get treeColName => 'Nome';

  @override
  String get treeColSize => 'Dimensione';

  @override
  String get treeColModified => 'Modificato';

  @override
  String get treeOpenTooltip => 'Fai doppio clic per aprire';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '$count elemento',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destinazione';

  @override
  String get sectionSecurity => 'Sicurezza';

  @override
  String get destinationSameFolder => 'Stessa cartella dell\'archivio';

  @override
  String get subfolderCreate => 'Estrai in una sottocartella';

  @override
  String get subfolderDefault => 'dal nome dell\'archivio';

  @override
  String get passwordNone => 'Nessuna password';

  @override
  String get passwordSetLabel => 'Password impostata';

  @override
  String get passwordEdit => 'Modifica';

  @override
  String get passwordDefine => 'Imposta';

  @override
  String get btnExtract => 'Estrai';

  @override
  String get btnExtracting => 'Estrazione...';

  @override
  String get btnDone => 'Fatto ✓';

  @override
  String get btnReset => 'Ripristina';

  @override
  String binaryWarning(String cmd) {
    return '7zip non trovato. Installalo: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Apri un archivio';

  @override
  String get pickOutputDialogTitle => 'Scegli cartella di destinazione';

  @override
  String logBinaryFound(String path) {
    return '7zip trovato: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip non trovato. Installalo via Homebrew (macOS) o 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Nessun archivio riconosciuto nei file rilasciati.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Formato non supportato: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Lettura archivio: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count voci trovate nell\'archivio.',
      one: '1 voce trovata nell\'archivio.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired =>
      'Archivio crittografato — password richiesta.';

  @override
  String get logFilePasswordRequired =>
      'File crittografato — password richiesta.';

  @override
  String get logPasswordDefined => 'Password impostata.';

  @override
  String get logCancelled => 'Annullato.';

  @override
  String logDestination(String path) {
    return 'Destinazione: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Estrazione in: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Estrazione completata in: $path';
  }

  @override
  String get logReset => 'Ripristinato.';

  @override
  String logOpening(String name) {
    return 'Apertura $name…';
  }

  @override
  String logOpened(String name) {
    return 'Aperto: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Errore nell\'apertura: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Errore di estrazione: $error';
  }

  @override
  String logError(String error) {
    return 'Errore: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Archivio diviso incompleto — parti mancanti. Impossibile visualizzare il contenuto.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Archivio diviso incompleto — parti mancanti. Il contenuto visualizzato potrebbe essere incompleto.';

  @override
  String get logExtractionSplitError => 'Estrazione fallita: parti mancanti.';

  @override
  String get errorSplitArchive =>
      '⚠️ Archivio diviso incompleto — assicurati che tutte le parti siano nella stessa cartella.';

  @override
  String get tabDecompression => 'Decompressione';

  @override
  String get tabCompression => 'Compressione';

  @override
  String get tabConsoleApi => 'Console API';

  @override
  String get tabComingSoon => 'Prossimamente';

  @override
  String get compLabelArchiveName => 'Nome dell\'archivio';

  @override
  String get compLabelDestination => 'Destinazione';

  @override
  String get compLabelFormat => 'Formato';

  @override
  String get compLabelCompression => 'Livello di compressione';

  @override
  String get compLabelSecurity => 'Sicurezza';

  @override
  String get compLabelSplit => 'Dividi';

  @override
  String get compSizeFolder => 'cartella';

  @override
  String get compDestSameFolder => 'Stessa cartella dei file';

  @override
  String compLevelNotApplicable(String format) {
    return 'Non applicabile per .$format';
  }

  @override
  String get compHeaderEncryption =>
      'Crittografia dell\'intestazione abilitata';

  @override
  String get compSplitNone => 'Nessuno';

  @override
  String get compBtnCompress => 'Comprimi';

  @override
  String get compBtnCompressing => 'Compressione in corso…';

  @override
  String get compAddFiles => 'Aggiungi file';

  @override
  String get compAddFolder => 'Aggiungi cartella';

  @override
  String get compDropToAdd => 'Rilascia per aggiungere';

  @override
  String get compDropHint => 'Rilascia file o cartelle qui';

  @override
  String get compDropSubtitle => 'I file verranno aggiunti all\'archivio';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Compressione → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archivio creato: $path';
  }
}
