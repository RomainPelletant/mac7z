// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get dropZoneDrop => 'Sleep een archief';

  @override
  String get dropZoneRelease => 'Loslaten om te openen';

  @override
  String get dropZoneSubtitle =>
      'of klik om te selecteren\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bestanden',
      one: '$count bestand',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Beveiligd archief';

  @override
  String get passwordDialogSubtitle => 'Voer het wachtwoord in';

  @override
  String get passwordDialogHint => 'Wachtwoord…';

  @override
  String get cancel => 'Annuleren';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get logPanelTitle => 'Logboek';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Geen activiteit';

  @override
  String get progressExtracting => 'Extracting…';

  @override
  String get progressDone => 'Extractie voltooid!';

  @override
  String get treeLoading => 'Archief lezen…';

  @override
  String get treeError => 'Fout';

  @override
  String get treeEmpty => 'Geen archief geladen';

  @override
  String get treeEmptyHint => 'Sleep een bestand om de inhoud te zien';

  @override
  String get treeSearch => 'Zoeken…';

  @override
  String get treeColName => 'Naam';

  @override
  String get treeColSize => 'Grootte';

  @override
  String get treeColModified => 'Gewijzigd';

  @override
  String get treeOpenTooltip => 'Dubbelklik om te openen';

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
  String get sectionDestination => 'Bestemming';

  @override
  String get sectionSecurity => 'Beveiliging';

  @override
  String get destinationSameFolder => 'Dezelfde map als het archief';

  @override
  String get subfolderCreate => 'Uitpakken in een submap';

  @override
  String get subfolderDefault => 'genoemd naar het archief';

  @override
  String get passwordNone => 'Geen wachtwoord';

  @override
  String get passwordSetLabel => 'Wachtwoord ingesteld';

  @override
  String get passwordEdit => 'Bewerken';

  @override
  String get passwordDefine => 'Instellen';

  @override
  String get btnExtract => 'Uitpakken';

  @override
  String get btnExtracting => 'Uitpakken...';

  @override
  String get btnDone => 'Klaar ✓';

  @override
  String get btnReset => 'Resetten';

  @override
  String binaryWarning(String cmd) {
    return '7zip niet gevonden. Installeer het: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Archief openen';

  @override
  String get pickOutputDialogTitle => 'Kies doelmap';

  @override
  String logBinaryFound(String path) {
    return '7zip gevonden: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip niet gevonden. Installeer via Homebrew (macOS) of 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Geen herkend archief in de verplaatste bestanden.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Niet-ondersteund formaat: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Archief lezen: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items gevonden in archief.',
      one: '1 item gevonden in archief.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Versleuteld archief — wachtwoord vereist.';

  @override
  String get logFilePasswordRequired =>
      'Versleuteld bestand — wachtwoord vereist.';

  @override
  String get logPasswordDefined => 'Wachtwoord ingesteld.';

  @override
  String get logCancelled => 'Geannuleerd.';

  @override
  String logDestination(String path) {
    return 'Bestemming: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Uitpakken naar: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extractie voltooid in: $path';
  }

  @override
  String get logReset => 'Gereset.';

  @override
  String logOpening(String name) {
    return 'Opening $name…';
  }

  @override
  String logOpened(String name) {
    return 'Geopend: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Fout bij openen: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Extractiefout: $error';
  }

  @override
  String logError(String error) {
    return 'Fout: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Onvolledig split-archief — ontbrekende onderdelen. Kan inhoud niet weergeven.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Onvolledig split-archief — ontbrekende onderdelen. Weergegeven inhoud is mogelijk onvolledig.';

  @override
  String get logExtractionSplitError =>
      'Extractie mislukt: ontbrekende onderdelen.';

  @override
  String get errorSplitArchive =>
      '⚠️ Onvolledig split-archief — zorg ervoor dat alle onderdelen in dezelfde map staan.';

  @override
  String get tabDecompression => 'Decompressie';

  @override
  String get tabCompression => 'Compressie';

  @override
  String get tabConsoleApi => 'Console API';

  @override
  String get tabComingSoon => 'Binnenkort';

  @override
  String get compLabelArchiveName => 'Archiefnaam';

  @override
  String get compLabelDestination => 'Bestemming';

  @override
  String get compLabelFormat => 'Formaat';

  @override
  String get compLabelCompression => 'Compressieniveau';

  @override
  String get compLabelSecurity => 'Beveiliging';

  @override
  String get compLabelSplit => 'Splitsen';

  @override
  String get compSizeFolder => 'map';

  @override
  String get compDestSameFolder => 'Dezelfde map als bestanden';

  @override
  String compLevelNotApplicable(String format) {
    return 'Niet van toepassing voor .$format';
  }

  @override
  String get compHeaderEncryption => 'Header-versleuteling ingeschakeld';

  @override
  String get compSplitNone => 'Geen';

  @override
  String get compBtnCompress => 'Comprimeren';

  @override
  String get compBtnCompressing => 'Comprimeren…';

  @override
  String get compAddFiles => 'Bestanden toevoegen';

  @override
  String get compAddFolder => 'Map toevoegen';

  @override
  String get compDropToAdd => 'Slepen om toe te voegen';

  @override
  String get compDropHint => 'Sleep bestanden of mappen hier';

  @override
  String get compDropSubtitle => 'Bestanden worden aan het archief toegevoegd';

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
    return 'Comprimeren → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archief gemaakt: $path';
  }
}
