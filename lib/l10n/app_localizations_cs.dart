// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get dropZoneDrop => 'Přetáhněte archiv';

  @override
  String get dropZoneRelease => 'Uvolněte pro otevření';

  @override
  String get dropZoneSubtitle =>
      'nebo klikněte pro výběr\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count souboru',
      many: '$count souborů',
      few: '$count soubory',
      one: '$count soubor',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Chráněný archiv';

  @override
  String get passwordDialogSubtitle => 'Zadejte heslo';

  @override
  String get passwordDialogHint => 'Heslo…';

  @override
  String get cancel => 'Zrušit';

  @override
  String get confirm => 'Potvrdit';

  @override
  String get logPanelTitle => 'Protokol';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count položky',
      many: '$count položek',
      few: '$count položky',
      one: '$count položka',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Žádná aktivita';

  @override
  String get progressExtracting => 'Rozpakování…';

  @override
  String get progressDone => 'Rozpakování dokončeno!';

  @override
  String get treeLoading => 'Čtení archivu…';

  @override
  String get treeError => 'Chyba';

  @override
  String get treeEmpty => 'Žádný archiv načten';

  @override
  String get treeEmptyHint => 'Přetáhněte soubor pro zobrazení obsahu';

  @override
  String get treeSearch => 'Hledat…';

  @override
  String get treeColName => 'Název';

  @override
  String get treeColSize => 'Velikost';

  @override
  String get treeColModified => 'Změněno';

  @override
  String get treeOpenTooltip => 'Dvojklikněte pro otevření';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prvku',
      many: '$count prvků',
      few: '$count prvky',
      one: '$count prvek',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Cíl';

  @override
  String get sectionSecurity => 'Bezpečnost';

  @override
  String get destinationSameFolder => 'Stejná složka jako archiv';

  @override
  String get subfolderCreate => 'Rozbalit do podsložky';

  @override
  String get subfolderDefault => 'pojmenované podle archivu';

  @override
  String get passwordNone => 'Bez hesla';

  @override
  String get passwordSetLabel => 'Heslo nastaveno';

  @override
  String get passwordEdit => 'Upravit';

  @override
  String get passwordDefine => 'Nastavit';

  @override
  String get btnExtract => 'Rozbalit';

  @override
  String get btnExtracting => 'Rozpakování...';

  @override
  String get btnDone => 'Hotovo ✓';

  @override
  String get btnReset => 'Obnovit';

  @override
  String binaryWarning(String cmd) {
    return '7zip nenalezen. Nainstalujte jej: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Otevřít archiv';

  @override
  String get pickOutputDialogTitle => 'Zvolte cílovou složku';

  @override
  String logBinaryFound(String path) {
    return '7zip nalezen: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip nenalezen. Nainstalujte přes Homebrew (macOS) nebo 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'V přetažených souborech není rozpoznán žádný archiv.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Nepodporovaný formát: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Čtení archivu: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'V archivu nalezena $count položka.',
      many: 'V archivu nalezeno $count položek.',
      few: 'V archivu nalezeny $count položky.',
      one: 'V archivu nalezena 1 položka.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Šifrovaný archiv — vyžadováno heslo.';

  @override
  String get logFilePasswordRequired => 'Šifrovaný soubor — vyžadováno heslo.';

  @override
  String get logPasswordDefined => 'Heslo nastaveno.';

  @override
  String get logCancelled => 'Zrušeno.';

  @override
  String logDestination(String path) {
    return 'Cíl: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Rozpakování do: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Rozpakování dokončeno v: $path';
  }

  @override
  String get logReset => 'Obnoveno.';

  @override
  String logOpening(String name) {
    return 'Otevírání $name…';
  }

  @override
  String logOpened(String name) {
    return 'Otevřeno: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Chyba při otevírání: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Chyba rozpakování: $error';
  }

  @override
  String logError(String error) {
    return 'Chyba: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Neúplný rozdělený archiv — chybějící části. Nelze zobrazit obsah.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Neúplný rozdělený archiv — chybějící části. Zobrazený obsah může být neúplný.';

  @override
  String get logExtractionSplitError => 'Rozpakování selhalo: chybějící části.';

  @override
  String get errorSplitArchive =>
      '⚠️ Neúplný rozdělený archiv — ujistěte se, že všechny části jsou ve stejné složce.';

  @override
  String get tabDecompression => 'Dekomprimace';

  @override
  String get tabCompression => 'Komprimace';

  @override
  String get tabConsoleApi => 'Konzole API';

  @override
  String get tabComingSoon => 'Připravujeme';

  @override
  String get compLabelArchiveName => 'Název archivu';

  @override
  String get compLabelDestination => 'Cíl';

  @override
  String get compLabelFormat => 'Formát';

  @override
  String get compLabelCompression => 'Úroveň komprese';

  @override
  String get compLabelSecurity => 'Bezpečnost';

  @override
  String get compLabelAdvanced => 'Pokročilé možnosti';

  @override
  String get compLabelSplit => 'Rozdělit';

  @override
  String get compSizeFolder => 'složka';

  @override
  String get compDestSameFolder => 'Stejná složka jako soubory';

  @override
  String compLevelNotApplicable(String format) {
    return 'Nepoužívá se pro .$format';
  }

  @override
  String get compHeaderEncryption => 'Šifrování záhlaví povoleno';

  @override
  String get compSplitNone => 'Žádné';

  @override
  String get compBtnCompress => 'Komprimovat';

  @override
  String get compBtnCompressing => 'Komprimace…';

  @override
  String get compAddFiles => 'Přidat soubory';

  @override
  String get compAddFolder => 'Přidat složku';

  @override
  String get compDropToAdd => 'Přetáhněte pro přidání';

  @override
  String get compDropHint => 'Přetáhněte sem soubory nebo složky';

  @override
  String get compDropSubtitle => 'Soubory budou přidány do archivu';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prvku',
      many: '$count prvků',
      few: '$count prvky',
      one: '1 prvek',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Komprimace → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archiv vytvořen: $path';
  }
}
