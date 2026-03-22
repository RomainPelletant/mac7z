// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get dropZoneDrop => 'Slip et arkiv';

  @override
  String get dropZoneRelease => 'Slip for at åbne';

  @override
  String get dropZoneSubtitle =>
      'eller klik for at vælge\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '$count fil',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Beskyttet arkiv';

  @override
  String get passwordDialogSubtitle => 'Indtast adgangskoden';

  @override
  String get passwordDialogHint => 'Adgangskode…';

  @override
  String get cancel => 'Annuller';

  @override
  String get confirm => 'Bekræft';

  @override
  String get logPanelTitle => 'Log';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count indgange',
      one: '$count indgang',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Ingen aktivitet';

  @override
  String get progressExtracting => 'Udpakker…';

  @override
  String get progressDone => 'Udpakning udført!';

  @override
  String get treeLoading => 'Læser arkiv…';

  @override
  String get treeError => 'Fejl';

  @override
  String get treeEmpty => 'Intet arkiv indlæst';

  @override
  String get treeEmptyHint => 'Slip en fil for at se dens indhold';

  @override
  String get treeSearch => 'Søg…';

  @override
  String get treeColName => 'Navn';

  @override
  String get treeColSize => 'Størrelse';

  @override
  String get treeColModified => 'Ændret';

  @override
  String get treeOpenTooltip => 'Dobbeltklik for at åbne';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementer',
      one: '$count element',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destination';

  @override
  String get sectionSecurity => 'Sikkerhed';

  @override
  String get destinationSameFolder => 'Samme mappe som arkivet';

  @override
  String get subfolderCreate => 'Udpak til en undermappe';

  @override
  String get subfolderDefault => 'navngivet efter arkivet';

  @override
  String get passwordNone => 'Ingen adgangskode';

  @override
  String get passwordSetLabel => 'Adgangskode er angivet';

  @override
  String get passwordEdit => 'Rediger';

  @override
  String get passwordDefine => 'Angiv';

  @override
  String get btnExtract => 'Udpak';

  @override
  String get btnExtracting => 'Udpakker...';

  @override
  String get btnDone => 'Udført ✓';

  @override
  String get btnReset => 'Nulstil';

  @override
  String binaryWarning(String cmd) {
    return '7zip ikke fundet. Installer det: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Åbn et arkiv';

  @override
  String get pickOutputDialogTitle => 'Vælg destinationsmappe';

  @override
  String logBinaryFound(String path) {
    return '7zip fundet: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip ikke fundet. Installér via Homebrew (macOS) eller 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized => 'Intet genkendt arkiv i slupne filer.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Format, der ikke understøttes: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Læser arkiv: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count indgange fundet i arkiv.',
      one: '1 indgang fundet i arkiv.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Krypteret arkiv — adgangskode krævet.';

  @override
  String get logFilePasswordRequired => 'Krypteret fil — adgangskode krævet.';

  @override
  String get logPasswordDefined => 'Adgangskode angivet.';

  @override
  String get logCancelled => 'Annulleret.';

  @override
  String logDestination(String path) {
    return 'Destination: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Udpakker til: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Udpakning fuldført i: $path';
  }

  @override
  String get logReset => 'Nulstillet.';

  @override
  String logOpening(String name) {
    return 'Åbner $name…';
  }

  @override
  String logOpened(String name) {
    return 'Åbnet: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Fejl ved åbning: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Udpakningsfejl: $error';
  }

  @override
  String logError(String error) {
    return 'Fejl: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Ufuldstændigt opdelt arkiv — manglende dele. Kan ikke vise indhold.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Ufuldstændigt opdelt arkiv — manglende dele. Vist indhold kan være ufuldstændigt.';

  @override
  String get logExtractionSplitError =>
      'Udpakning mislykkedes: manglende dele.';

  @override
  String get errorSplitArchive =>
      '⚠️ Ufuldstændigt opdelt arkiv — sørg for, at alle dele er i samme mappe.';

  @override
  String get tabDecompression => 'Dekomprimering';

  @override
  String get tabCompression => 'Komprimering';

  @override
  String get tabConsoleApi => 'Konsol-API';

  @override
  String get tabComingSoon => 'Kommer snart';

  @override
  String get compLabelArchiveName => 'Arkivnavn';

  @override
  String get compLabelDestination => 'Destination';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Kompressionsniveau';

  @override
  String get compLabelSecurity => 'Sikkerhed';

  @override
  String get compLabelSplit => 'Del';

  @override
  String get compSizeFolder => 'mappe';

  @override
  String get compDestSameFolder => 'Samme mappe som filerne';

  @override
  String compLevelNotApplicable(String format) {
    return 'Ikke gørligt for .$format';
  }

  @override
  String get compHeaderEncryption => 'Header-kryptering aktiveret';

  @override
  String get compSplitNone => 'Ingen';

  @override
  String get compBtnCompress => 'Komprimer';

  @override
  String get compBtnCompressing => 'Komprimerer…';

  @override
  String get compAddFiles => 'Tilføj filer';

  @override
  String get compAddFolder => 'Tilføj mappe';

  @override
  String get compDropToAdd => 'Slip for at tilføje';

  @override
  String get compDropHint => 'Slip filer eller mapper her';

  @override
  String get compDropSubtitle => 'Filer tilføjes til arkivet';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementer',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Komprimerer → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arkiv oprettet: $path';
  }
}
