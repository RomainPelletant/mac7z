// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get dropZoneDrop => 'Ispustite arhiv';

  @override
  String get dropZoneRelease => 'Ispustite za otvaranje';

  @override
  String get dropZoneSubtitle =>
      'ili klikните da biste odabrali\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count datoteke',
      one: '$count datoteka',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Zaštićeni arhiv';

  @override
  String get passwordDialogSubtitle => 'Unesite lozinku';

  @override
  String get passwordDialogHint => 'Lozinka…';

  @override
  String get cancel => 'Otkaži';

  @override
  String get confirm => 'Potvrdi';

  @override
  String get logPanelTitle => 'Dnevnik';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stavke',
      one: '$count stavka',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Nema aktivnosti';

  @override
  String get progressExtracting => 'Ekstraktovanje…';

  @override
  String get progressDone => 'Ekstraktovanje završeno!';

  @override
  String get treeLoading => 'Čitanje arhiva…';

  @override
  String get treeError => 'Greška';

  @override
  String get treeEmpty => 'Nema učitanog arhiva';

  @override
  String get treeEmptyHint => 'Ispustite datoteku da vidite njen sadržaj';

  @override
  String get treeSearch => 'Pretraživanje…';

  @override
  String get treeColName => 'Naziv';

  @override
  String get treeColSize => 'Veličina';

  @override
  String get treeColModified => 'Promenjeno';

  @override
  String get treeOpenTooltip => 'Dvoklik za otvaranje';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stavke',
      one: '$count stavka',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Odredište';

  @override
  String get sectionSecurity => 'Sigurnost';

  @override
  String get destinationSameFolder => 'Ista mapa kao arhiv';

  @override
  String get subfolderCreate => 'Ekstraktuj u podmapi';

  @override
  String get subfolderDefault => 'nazvan po arhivu';

  @override
  String get passwordNone => 'Bez lozinke';

  @override
  String get passwordSetLabel => 'Lozinka je postavljena';

  @override
  String get passwordEdit => 'Uredi';

  @override
  String get passwordDefine => 'Postavi';

  @override
  String get btnExtract => 'Ekstraktuj';

  @override
  String get btnExtracting => 'Ekstraktovanje...';

  @override
  String get btnDone => 'Gotovo ✓';

  @override
  String get btnReset => 'Resetuj';

  @override
  String binaryWarning(String cmd) {
    return '7zip nije pronađen. Instalirajte ga: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Otvori arhiv';

  @override
  String get pickOutputDialogTitle => 'Izaberite odredišnu mapu';

  @override
  String logBinaryFound(String path) {
    return '7zip pronađen: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip nije pronađen. Instalirajte preko Homebrew (macOS) ili 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Nema prepoznatih arhiva u ispuštenim datotekama.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Format koji se ne podržava: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Čitanje arhiva: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stavke pronađene u arhivu.',
      one: '1 stavka pronađena u arhivu.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Šifrovan arhiv — lozinka obavezna.';

  @override
  String get logFilePasswordRequired =>
      'Šifrirana datoteka — lozinka obavezna.';

  @override
  String get logPasswordDefined => 'Lozinka je postavljena.';

  @override
  String get logCancelled => 'Otkazano.';

  @override
  String logDestination(String path) {
    return 'Odredište: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Ekstraktovanje u: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Ekstraktovanje završeno u: $path';
  }

  @override
  String get logReset => 'Resetovano.';

  @override
  String logOpening(String name) {
    return 'Otvaranje $name…';
  }

  @override
  String logOpened(String name) {
    return 'Otvoreno: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Greška pri otvaranju: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Greška pri ekstraktovanju: $error';
  }

  @override
  String logError(String error) {
    return 'Greška: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Nepotpun podeljeni arhiv — nedostaju delovi. Nije moguće prikazati sadržaj.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Nepotpun podeljeni arhiv — nedostaju delovi. Prikazani sadržaj može biti nepotpun.';

  @override
  String get logExtractionSplitError =>
      'Ekstraktovanje neuspešno: nedostaju delovi.';

  @override
  String get errorSplitArchive =>
      '⚠️ Nepotpun podeljeni arhiv — pazite da su svi delovi u istoj mapi.';

  @override
  String get tabDecompression => 'Dekompresija';

  @override
  String get tabCompression => 'Kompresija';

  @override
  String get tabConsoleApi => 'Konzola API';

  @override
  String get tabComingSoon => 'Uskoro';

  @override
  String get compLabelArchiveName => 'Naziv arhiva';

  @override
  String get compLabelDestination => 'Odredište';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Razina kompresije';

  @override
  String get compLabelSecurity => 'Sigurnost';

  @override
  String get compLabelSplit => 'Podeli';

  @override
  String get compSizeFolder => 'mapa';

  @override
  String get compDestSameFolder => 'Ista mapa kao datoteke';

  @override
  String compLevelNotApplicable(String format) {
    return 'Nije primjenjivo za .$format';
  }

  @override
  String get compHeaderEncryption => 'Šifriranje zaglavlja omogućeno';

  @override
  String get compSplitNone => 'Nijedno';

  @override
  String get compBtnCompress => 'Kompresiraj';

  @override
  String get compBtnCompressing => 'Kompresiranje…';

  @override
  String get compAddFiles => 'Dodaj datoteke';

  @override
  String get compAddFolder => 'Dodaj mapu';

  @override
  String get compDropToAdd => 'Ispusti za dodavanje';

  @override
  String get compDropHint => 'Ispusti datoteke ili mape ovdje';

  @override
  String get compDropSubtitle => 'Datoteke će biti dodane u arhiv';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count stavke',
      one: '1 stavka',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Kompresiranje → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arhiv kreiran: $path';
  }
}
