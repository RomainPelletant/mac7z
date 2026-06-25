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
  String get compLabelAdvanced => 'Opzioni avanzate';

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

  @override
  String get consoleSectionConfig => 'CONFIGURAZIONE';

  @override
  String get consoleSectionCommands => 'COMANDI PRINCIPALI';

  @override
  String get consoleSectionOptions => 'OPZIONI COMUNI';

  @override
  String get consoleSectionExamples => 'ESEMPI AVANZATI';

  @override
  String get consoleHeroSubtitle =>
      'mac7z passa tutti gli argomenti direttamente al binario 7zip incluso. Usalo dal Terminale esattamente come useresti 7zz.';

  @override
  String get consoleSetupIntro =>
      'Crea un alias nella tua shell per usare mac7z come comando standard nel Terminale:';

  @override
  String get consoleSetupOutroMac =>
      'Aggiungi questa riga al tuo ~/.zshrc o ~/.bash_profile per renderla permanente. Una volta configurato, tutti i comandi standard di 7zip funzioneranno sostituendo 7zz con mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Aggiungi questa riga al tuo ~/.bashrc o ~/.zshrc per renderla permanente. Una volta configurato, tutti i comandi standard di 7zip funzioneranno sostituendo 7zz con mac7z.';

  @override
  String get consoleCmdList => 'Elencare il contenuto di un archivio';

  @override
  String get consoleCmdExtractFull => 'Estrarre con i percorsi completi';

  @override
  String get consoleCmdExtractToDir => 'Estrarre in una cartella specifica';

  @override
  String get consoleCmdExtractFlat => 'Estrarre senza sottocartelle';

  @override
  String get consoleCmdCreateUpdate => 'Creare o aggiornare un archivio';

  @override
  String get consoleCmdCreateZip => 'Creare un archivio ZIP';

  @override
  String get consoleCmdTest => 'Testare l\'integrità dell\'archivio';

  @override
  String get consoleCmdDelete => 'Eliminare un file da un archivio';

  @override
  String get consoleCmdInfo => 'Mostrare informazioni su 7zip';

  @override
  String get consoleOptPassword => 'Proteggere l\'archivio con una password';

  @override
  String get consoleOptEncryptHeaders =>
      'Cifrare anche i nomi dei file (solo 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Livello di compressione (0 = nessuno, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Abilitare la compressione multi-thread';

  @override
  String get consoleOptSplitVolumes =>
      'Dividere in volumi (es. -v100m per 100 MB)';

  @override
  String get consoleOptRecursive => 'Elaborare ricorsivamente le sottocartelle';

  @override
  String get consoleOptYesAll => 'Rispondere \"sì\" a tutte le conferme';

  @override
  String get consoleOptOutputDir =>
      'Cartella di destinazione per l\'estrazione';

  @override
  String get consoleOptExclude => 'Escludere file (es. -x!*.log)';

  @override
  String get consoleExEncrypted => 'Archivio cifrato con nomi nascosti';

  @override
  String get consoleExVolumes => 'Archivio suddiviso in volumi da 50 MB';

  @override
  String get consoleExUltra => 'Compressione ultra (lenta, file minimo)';

  @override
  String get consoleExSingleFile => 'Estrarre un solo file';

  @override
  String get consoleExTechnical => 'Elencare con dettagli tecnici';

  @override
  String get consoleCopy => 'Copia';

  @override
  String get consoleCopied => 'Copiato!';

  @override
  String get consoleInfoNote =>
      'mac7z include il proprio binario 7zz. Gli argomenti vengono passati esattamente così come sono, senza modifiche. Qualsiasi comando valido per 7zz funziona allo stesso modo anche con mac7z.';
}
