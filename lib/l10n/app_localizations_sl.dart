// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get dropZoneDrop => 'Spustite arhiv';

  @override
  String get dropZoneRelease => 'Spustite za odpiranje';

  @override
  String get dropZoneSubtitle =>
      'ali kliknite za izbiro\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count datotek',
      few: '$count datoteke',
      two: '$count datoteki',
      one: '$count datoteka',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Zaščiteni arhiv';

  @override
  String get passwordDialogSubtitle => 'Vnesite geslo';

  @override
  String get passwordDialogHint => 'Geslo…';

  @override
  String get cancel => 'Prekliči';

  @override
  String get confirm => 'Potrdi';

  @override
  String get logPanelTitle => 'Dnevnik';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vnosov',
      few: '$count vnosi',
      two: '$count vnosa',
      one: '$count vnos',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Brez dejavnosti';

  @override
  String get progressExtracting => 'Razpakiranje…';

  @override
  String get progressDone => 'Razpakiranje končano!';

  @override
  String get treeLoading => 'Branje arhiva…';

  @override
  String get treeError => 'Napaka';

  @override
  String get treeEmpty => 'Noben arhiv ni naložen';

  @override
  String get treeEmptyHint => 'Spustite datoteko, da vidite njeno vsebino';

  @override
  String get treeSearch => 'Iskanje…';

  @override
  String get treeColName => 'Ime';

  @override
  String get treeColSize => 'Velikost';

  @override
  String get treeColModified => 'Spremenjeno';

  @override
  String get treeOpenTooltip => 'Dvojni klik za odpiranje';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementov',
      few: '$count elementi',
      two: '$count elementa',
      one: '$count element',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Cilj';

  @override
  String get sectionSecurity => 'Varnost';

  @override
  String get destinationSameFolder => 'Ista mapa kot arhiv';

  @override
  String get subfolderCreate => 'Razpakuj v podmapo';

  @override
  String get subfolderDefault => 'poimenovan po arhivu';

  @override
  String get passwordNone => 'Brez gesla';

  @override
  String get passwordSetLabel => 'Geslo je nastavljeno';

  @override
  String get passwordEdit => 'Uredi';

  @override
  String get passwordDefine => 'Nastavi';

  @override
  String get btnExtract => 'Razpakuj';

  @override
  String get btnExtracting => 'Razpakiranje...';

  @override
  String get btnDone => 'Gotovo ✓';

  @override
  String get btnReset => 'Ponastavi';

  @override
  String binaryWarning(String cmd) {
    return '7zip ni najden. Instalirajte ga: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Odpri arhiv';

  @override
  String get pickOutputDialogTitle => 'Izberite ciljno mapo';

  @override
  String logBinaryFound(String path) {
    return '7zip najden: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip ni najden. Instalirajte ga prek Homebrew (macOS) ali 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'V spuščenih datotekah ni prepoznanega arhiva.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Nepodprta oblika: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Branje arhiva: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vnosov najdenih v arhivu.',
      few: '$count vnosi najdeni v arhivu.',
      two: '$count vnosa najdena v arhivu.',
      one: '1 vnos najden v arhivu.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Šifriran arhiv — geslo je obvezno.';

  @override
  String get logFilePasswordRequired =>
      'Šifrirana datoteka — geslo je obvezno.';

  @override
  String get logPasswordDefined => 'Geslo je nastavljeno.';

  @override
  String get logCancelled => 'Prekliknjena.';

  @override
  String logDestination(String path) {
    return 'Cilj: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Razpakiranje v: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Razpakiranje končano v: $path';
  }

  @override
  String get logReset => 'Ponastavljeno.';

  @override
  String logOpening(String name) {
    return 'Odpiranje $name…';
  }

  @override
  String logOpened(String name) {
    return 'Odprto: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Napaka pri odpiranju: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Napaka pri razpakiranju: $error';
  }

  @override
  String logError(String error) {
    return 'Napaka: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Nepopoln razdeljeni arhiv — manjkajoči deli. Vsebine ni mogoče prikazati.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Nepopoln razdeljeni arhiv — manjkajoči deli. Prikazana vsebina je lahko nepopolna.';

  @override
  String get logExtractionSplitError =>
      'Razpakiranje je neuspešno: manjkajoči deli.';

  @override
  String get errorSplitArchive =>
      '⚠️ Nepopoln razdeljeni arhiv — prepričajte se, da so vsi deli v isti mapi.';

  @override
  String get tabDecompression => 'Dekompresija';

  @override
  String get tabCompression => 'Kompresija';

  @override
  String get tabConsoleApi => 'Konzola API';

  @override
  String get tabComingSoon => 'Kmalu';

  @override
  String get compLabelArchiveName => 'Ime arhiva';

  @override
  String get compLabelDestination => 'Cilj';

  @override
  String get compLabelFormat => 'Oblika';

  @override
  String get compLabelCompression => 'Raven stiskanja';

  @override
  String get compLabelSecurity => 'Varnost';

  @override
  String get compLabelAdvanced => 'Advanced options';

  @override
  String get compLabelSplit => 'Deli';

  @override
  String get compSizeFolder => 'mapa';

  @override
  String get compDestSameFolder => 'Ista mapa kot datoteke';

  @override
  String compLevelNotApplicable(String format) {
    return 'Ne velja za .$format';
  }

  @override
  String get compHeaderEncryption => 'Šifriranje glave omogočeno';

  @override
  String get compSplitNone => 'Noben';

  @override
  String get compBtnCompress => 'Stisnit';

  @override
  String get compBtnCompressing => 'Stiskanje…';

  @override
  String get compAddFiles => 'Dodaj datoteke';

  @override
  String get compAddFolder => 'Dodaj mapo';

  @override
  String get compDropToAdd => 'Spusti za dodajanje';

  @override
  String get compDropHint => 'Spusti datoteke ali mape tukaj';

  @override
  String get compDropSubtitle => 'Datoteke bodo dodane v arhiv';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementov',
      few: '$count elementi',
      two: '$count elementa',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Stiskanje → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arhiv ustvarjen: $path';
  }
}
