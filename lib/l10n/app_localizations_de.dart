// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get dropZoneDrop => 'Archiv ablegen';

  @override
  String get dropZoneRelease => 'Zum Öffnen loslassen';

  @override
  String get dropZoneSubtitle =>
      'oder klicken zum Auswählen\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Dateien',
      one: '$count Datei',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Geschütztes Archiv';

  @override
  String get passwordDialogSubtitle => 'Geben Sie das Passwort ein';

  @override
  String get passwordDialogHint => 'Passwort…';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get logPanelTitle => 'Protokoll';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge',
      one: '$count Eintrag',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Keine Aktivität';

  @override
  String get progressExtracting => 'Wird extrahiert…';

  @override
  String get progressDone => 'Extraktion abgeschlossen!';

  @override
  String get treeLoading => 'Lese Archiv…';

  @override
  String get treeError => 'Fehler';

  @override
  String get treeEmpty => 'Kein Archiv geladen';

  @override
  String get treeEmptyHint => 'Datei ablegen, um ihren Inhalt zu sehen';

  @override
  String get treeSearch => 'Suchen…';

  @override
  String get treeColName => 'Name';

  @override
  String get treeColSize => 'Größe';

  @override
  String get treeColModified => 'Geändert';

  @override
  String get treeOpenTooltip => 'Doppelklick zum Öffnen';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente',
      one: '$count Element',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Ziel';

  @override
  String get sectionSecurity => 'Sicherheit';

  @override
  String get destinationSameFolder => 'Gleicher Ordner wie das Archiv';

  @override
  String get subfolderCreate => 'In einen Unterordner extrahieren';

  @override
  String get subfolderDefault => 'benannt nach dem Archiv';

  @override
  String get passwordNone => 'Kein Passwort';

  @override
  String get passwordSetLabel => 'Passwort gesetzt';

  @override
  String get passwordEdit => 'Bearbeiten';

  @override
  String get passwordDefine => 'Festlegen';

  @override
  String get btnExtract => 'Extrahieren';

  @override
  String get btnExtracting => 'Wird extrahiert...';

  @override
  String get btnDone => 'Fertig ✓';

  @override
  String get btnReset => 'Zurücksetzen';

  @override
  String binaryWarning(String cmd) {
    return '7zip nicht gefunden. Installieren Sie es: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Archiv öffnen';

  @override
  String get pickOutputDialogTitle => 'Zielordner auswählen';

  @override
  String logBinaryFound(String path) {
    return '7zip gefunden: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip nicht gefunden. Installieren Sie es über Homebrew (macOS) oder 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Kein erkanntes Archiv in den abgelegten Dateien.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Nicht unterstütztes Format: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Lese Archiv: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge im Archiv gefunden.',
      one: '1 Eintrag im Archiv gefunden.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired =>
      'Verschlüsseltes Archiv — Passwort erforderlich.';

  @override
  String get logFilePasswordRequired =>
      'Verschlüsselte Datei — Passwort erforderlich.';

  @override
  String get logPasswordDefined => 'Passwort gesetzt.';

  @override
  String get logCancelled => 'Abgebrochen.';

  @override
  String logDestination(String path) {
    return 'Ziel: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Extrahiere zu: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extraktion abgeschlossen in: $path';
  }

  @override
  String get logReset => 'Zurückgesetzt.';

  @override
  String logOpening(String name) {
    return 'Öffne $name…';
  }

  @override
  String logOpened(String name) {
    return 'Geöffnet: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Fehler beim Öffnen: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Extraktionsfehler: $error';
  }

  @override
  String logError(String error) {
    return 'Fehler: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Unvollständiges Splittarchiv — fehlende Teile. Inhalt kann nicht angezeigt werden.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Unvollständiges Splittarchiv — fehlende Teile. Der angezeigte Inhalt kann unvollständig sein.';

  @override
  String get logExtractionSplitError =>
      'Extraktion fehlgeschlagen: fehlende Teile.';

  @override
  String get errorSplitArchive =>
      '⚠️ Unvollständiges Splittarchiv — stellen Sie sicher, dass alle Teile im selben Ordner sind.';

  @override
  String get tabDecompression => 'Entpacken';

  @override
  String get tabCompression => 'Packen';

  @override
  String get tabConsoleApi => 'Konsolen-API';

  @override
  String get tabComingSoon => 'Demnächst verfügbar';

  @override
  String get compLabelArchiveName => 'Archivname';

  @override
  String get compLabelDestination => 'Ziel';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Kompressionsstufe';

  @override
  String get compLabelSecurity => 'Sicherheit';

  @override
  String get compLabelAdvanced => 'Erweiterte Optionen';

  @override
  String get compLabelSplit => 'Splitten';

  @override
  String get compSizeFolder => 'Ordner';

  @override
  String get compDestSameFolder => 'Gleicher Ordner wie die Dateien';

  @override
  String compLevelNotApplicable(String format) {
    return 'Nicht anwendbar für .$format';
  }

  @override
  String get compHeaderEncryption => 'Header-Verschlüsselung aktiviert';

  @override
  String get compSplitNone => 'Keine';

  @override
  String get compBtnCompress => 'Komprimieren';

  @override
  String get compBtnCompressing => 'Wird komprimiert…';

  @override
  String get compAddFiles => 'Dateien hinzufügen';

  @override
  String get compAddFolder => 'Ordner hinzufügen';

  @override
  String get compDropToAdd => 'Ablegen zum Hinzufügen';

  @override
  String get compDropHint => 'Dateien oder Ordner hier ablegen';

  @override
  String get compDropSubtitle => 'Dateien werden zum Archiv hinzugefügt';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Elemente',
      one: '1 Element',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Wird komprimiert → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archiv erstellt: $path';
  }

  @override
  String get consoleSectionConfig => 'KONFIGURATION';

  @override
  String get consoleSectionCommands => 'WICHTIGE BEFEHLE';

  @override
  String get consoleSectionOptions => 'HÄUFIGE OPTIONEN';

  @override
  String get consoleSectionExamples => 'ERWEITERTE BEISPIELE';

  @override
  String get consoleHeroSubtitle =>
      'mac7z übergibt alle Argumente direkt an die integrierte 7zip-Binärdatei. Verwenden Sie es im Terminal genau so, wie Sie 7zz verwenden würden.';

  @override
  String get consoleSetupIntro =>
      'Erstellen Sie in Ihrer Shell einen Alias, um mac7z als normalen Befehl im Terminal zu verwenden:';

  @override
  String get consoleSetupOutroMac =>
      'Fügen Sie diese Zeile zu Ihrer ~/.zshrc oder ~/.bash_profile hinzu, damit sie dauerhaft bleibt. Nach der Einrichtung funktionieren alle üblichen 7zip-Befehle, indem Sie 7zz durch mac7z ersetzen.';

  @override
  String get consoleSetupOutroLinux =>
      'Fügen Sie diese Zeile zu Ihrer ~/.bashrc oder ~/.zshrc hinzu, damit sie dauerhaft bleibt. Nach der Einrichtung funktionieren alle üblichen 7zip-Befehle, indem Sie 7zz durch mac7z ersetzen.';

  @override
  String get consoleCmdList => 'Inhalt eines Archivs auflisten';

  @override
  String get consoleCmdExtractFull => 'Mit vollständigen Pfaden entpacken';

  @override
  String get consoleCmdExtractToDir => 'In einen bestimmten Ordner entpacken';

  @override
  String get consoleCmdExtractFlat => 'Flach entpacken ohne Unterordner';

  @override
  String get consoleCmdCreateUpdate => 'Archiv erstellen oder aktualisieren';

  @override
  String get consoleCmdCreateZip => 'ZIP-Archiv erstellen';

  @override
  String get consoleCmdTest => 'Integrität des Archivs prüfen';

  @override
  String get consoleCmdDelete => 'Datei aus einem Archiv löschen';

  @override
  String get consoleCmdInfo => 'Informationen über 7zip anzeigen';

  @override
  String get consoleOptPassword => 'Archiv mit Passwort schützen';

  @override
  String get consoleOptEncryptHeaders =>
      'Auch Dateinamen verschlüsseln (nur 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Komprimierungsstufe (0 = keine, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Mehrthread-Komprimierung aktivieren';

  @override
  String get consoleOptSplitVolumes =>
      'In Volumes aufteilen (z. B. -v100m für 100 MB)';

  @override
  String get consoleOptRecursive => 'Unterordner rekursiv verarbeiten';

  @override
  String get consoleOptYesAll => 'Alle Bestätigungen mit \"Ja\" beantworten';

  @override
  String get consoleOptOutputDir => 'Zielordner für das Entpacken';

  @override
  String get consoleOptExclude => 'Dateien ausschließen (z. B. -x!*.log)';

  @override
  String get consoleExEncrypted =>
      'Verschlüsseltes Archiv mit ausgeblendeten Namen';

  @override
  String get consoleExVolumes => 'Archiv in 50-MB-Volumes aufgeteilt';

  @override
  String get consoleExUltra => 'Ultra-Komprimierung (langsam, kleinste Datei)';

  @override
  String get consoleExSingleFile => 'Eine einzelne Datei entpacken';

  @override
  String get consoleExTechnical => 'Mit technischen Details auflisten';

  @override
  String get consoleCopy => 'Kopieren';

  @override
  String get consoleCopied => 'Kopiert!';

  @override
  String get consoleInfoNote =>
      'mac7z bringt seine eigene 7zz-Binärdatei mit. Die Argumente werden unverändert weitergegeben. Jeder für 7zz gültige Befehl funktioniert mit mac7z identisch.';
}
