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
}
