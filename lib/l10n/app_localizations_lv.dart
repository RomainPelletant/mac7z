// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get dropZoneDrop => 'Velciet arhīvu';

  @override
  String get dropZoneRelease => 'Atlaidiet, lai atvērtu';

  @override
  String get dropZoneSubtitle =>
      'vai noklikšķiniet, lai atlasītu\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count faili',
      one: '$count fails',
      zero: '$count faili',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Aizsargātais arhīvs';

  @override
  String get passwordDialogSubtitle => 'Ievadiet paroli';

  @override
  String get passwordDialogHint => 'Parole…';

  @override
  String get cancel => 'Atcelt';

  @override
  String get confirm => 'Apstiprināt';

  @override
  String get logPanelTitle => 'Žurnāls';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ieraksti',
      one: '$count ieraksts',
      zero: '$count ieraksti',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Nav aktivitātes';

  @override
  String get progressExtracting => 'Izpakošana…';

  @override
  String get progressDone => 'Izpakoš complēts!';

  @override
  String get treeLoading => 'Arhīva nolasīšana…';

  @override
  String get treeError => 'Kļūda';

  @override
  String get treeEmpty => 'Neviens arhīvs nav ielādēts';

  @override
  String get treeEmptyHint => 'Velciet failu, lai redzētu tā saturu';

  @override
  String get treeSearch => 'Meklēt…';

  @override
  String get treeColName => 'Nosaukums';

  @override
  String get treeColSize => 'Izmērs';

  @override
  String get treeColModified => 'Modificēts';

  @override
  String get treeOpenTooltip => 'Dubultkliks, lai atvērtu';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vienības',
      one: '$count vienība',
      zero: '$count vienības',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Galapunkts';

  @override
  String get sectionSecurity => 'Drošība';

  @override
  String get destinationSameFolder => 'Tā pati mape kā arhīvs';

  @override
  String get subfolderCreate => 'Izpakot apakšmapē';

  @override
  String get subfolderDefault => 'nosaukts pēc arhīva';

  @override
  String get passwordNone => 'Bez paroles';

  @override
  String get passwordSetLabel => 'Parole ir iestatīta';

  @override
  String get passwordEdit => 'Rediģēt';

  @override
  String get passwordDefine => 'Iestatīt';

  @override
  String get btnExtract => 'Izpakot';

  @override
  String get btnExtracting => 'Izpakošana...';

  @override
  String get btnDone => 'Gatavs ✓';

  @override
  String get btnReset => 'Atiestatīt';

  @override
  String binaryWarning(String cmd) {
    return '7zip netika atrasts. Instalējiet to: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Atveriet arhīvu';

  @override
  String get pickOutputDialogTitle => 'Atlasiet galapunkta mapi';

  @override
  String logBinaryFound(String path) {
    return '7zip atrasts: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip netika atrasts. Instalējiet caur Homebrew (macOS) vai 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized => 'Velto failus neatpazīti arhīvi.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Neatbalstīts formāts: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Arhīva nolasīšana: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ieraksti atrasti arhīvā.',
      one: '1 ieraksts atrasts arhīvā.',
      zero: '$count ieraksti atrasti arhīvā.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Šifrēts arhīvs — parole ir obligāta.';

  @override
  String get logFilePasswordRequired => 'Šifrēts fails — parole ir obligāta.';

  @override
  String get logPasswordDefined => 'Parole ir iestatīta.';

  @override
  String get logCancelled => 'Atcelts.';

  @override
  String logDestination(String path) {
    return 'Galapunkts: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Izpakošana uz: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Izpakošana pabeigta: $path';
  }

  @override
  String get logReset => 'Atiestatīts.';

  @override
  String logOpening(String name) {
    return 'Atver $name…';
  }

  @override
  String logOpened(String name) {
    return 'Atvērts: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Kļūda, atverot: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Izpakoš kļūda: $error';
  }

  @override
  String logError(String error) {
    return 'Kļūda: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Nepilnīgs sadalīts arhīvs — trūkst daļu. Nevar parādīt saturu.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Nepilnīgs sadalīts arhīvs — trūkst daļu. Parādītais saturs var būt nepilnīgs.';

  @override
  String get logExtractionSplitError => 'Izpakošana neizdevās: trūkst daļu.';

  @override
  String get errorSplitArchive =>
      '⚠️ Nepilnīgs sadalīts arhīvs — pārliecinieties, ka visas daļas atrodas vienā mapē.';

  @override
  String get tabDecompression => 'Dekompresija';

  @override
  String get tabCompression => 'Kompresija';

  @override
  String get tabConsoleApi => 'Konsoles API';

  @override
  String get tabComingSoon => 'Drīzumā';

  @override
  String get compLabelArchiveName => 'Arhīva nosaukums';

  @override
  String get compLabelDestination => 'Galapunkts';

  @override
  String get compLabelFormat => 'Formāts';

  @override
  String get compLabelCompression => 'Saspiešanas līmenis';

  @override
  String get compLabelSecurity => 'Drošība';

  @override
  String get compLabelAdvanced => 'Advanced options';

  @override
  String get compLabelSplit => 'Dalīt';

  @override
  String get compSizeFolder => 'mape';

  @override
  String get compDestSameFolder => 'Tā pati mape kā faili';

  @override
  String compLevelNotApplicable(String format) {
    return 'Nav piemērojams .$format';
  }

  @override
  String get compHeaderEncryption => 'Galvenes šifrēšana iespējota';

  @override
  String get compSplitNone => 'Nē';

  @override
  String get compBtnCompress => 'Saspiest';

  @override
  String get compBtnCompressing => 'Saspiesšana…';

  @override
  String get compAddFiles => 'Pievienot failus';

  @override
  String get compAddFolder => 'Pievienot mapi';

  @override
  String get compDropToAdd => 'Velciet, lai pievienotu';

  @override
  String get compDropHint => 'Velciet failus vai mapes šeit';

  @override
  String get compDropSubtitle => 'Faili tiks pievienoti arhīvam';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count vienības',
      one: '$count vienība',
      zero: '$count vienības',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Saspiesšana → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arhīvs izveidots: $path';
  }

  @override
  String get consoleSectionConfig => 'KONFIGURĀCIJA';

  @override
  String get consoleSectionCommands => 'GALVENĀS KOMANDAS';

  @override
  String get consoleSectionOptions => 'BIEŽĀKĀS OPCIJAS';

  @override
  String get consoleSectionExamples => 'PAPLAŠINĀTI PIEMĒRI';

  @override
  String get consoleHeroSubtitle =>
      'mac7z nodod visus argumentus tieši iebūvētajam 7zip binārajam failam. Izmantojiet to Terminal tieši tāpat kā 7zz.';

  @override
  String get consoleSetupIntro =>
      'Izveidojiet alias savā shell vidē, lai lietotu mac7z kā parastu Terminal komandu:';

  @override
  String get consoleSetupOutroMac =>
      'Pievienojiet šo rindu savam ~/.zshrc vai ~/.bash_profile, lai tā būtu pastāvīga. Pēc iestatīšanas visas parastās 7zip komandas darbosies, aizstājot 7zz ar mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Pievienojiet šo rindu savam ~/.bashrc vai ~/.zshrc, lai tā būtu pastāvīga. Pēc iestatīšanas visas parastās 7zip komandas darbosies, aizstājot 7zz ar mac7z.';

  @override
  String get consoleCmdList => 'Parādīt arhīva saturu';

  @override
  String get consoleCmdExtractFull => 'Izvilkt ar pilniem ceļiem';

  @override
  String get consoleCmdExtractToDir => 'Izvilkt noteiktā mapē';

  @override
  String get consoleCmdExtractFlat => 'Izvilkt bez apakšmapēm';

  @override
  String get consoleCmdCreateUpdate => 'Izveidot vai atjaunināt arhīvu';

  @override
  String get consoleCmdCreateZip => 'Izveidot ZIP arhīvu';

  @override
  String get consoleCmdTest => 'Pārbaudīt arhīva integritāti';

  @override
  String get consoleCmdDelete => 'Dzēst failu no arhīva';

  @override
  String get consoleCmdInfo => 'Parādīt informāciju par 7zip';

  @override
  String get consoleOptPassword => 'Aizsargāt arhīvu ar paroli';

  @override
  String get consoleOptEncryptHeaders =>
      'Šifrēt arī failu nosaukumus (tikai 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Saspiešanas līmenis (0 = nav, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Iespējot daudzpavedienu saspiešanu';

  @override
  String get consoleOptSplitVolumes => 'Sadalīt apjomos (piem., -v100m 100 MB)';

  @override
  String get consoleOptRecursive => 'Rekursīvi apstrādāt apakšmapes';

  @override
  String get consoleOptYesAll => 'Atbildēt \"jā\" uz visiem apstiprinājumiem';

  @override
  String get consoleOptOutputDir => 'Izvilkšanas mērķa mape';

  @override
  String get consoleOptExclude => 'Izslēgt failus (piem., -x!*.log)';

  @override
  String get consoleExEncrypted => 'Šifrēts arhīvs ar slēptiem nosaukumiem';

  @override
  String get consoleExVolumes => 'Arhīvs sadalīts 50 MB daļās';

  @override
  String get consoleExUltra => 'Ultra saspiešana (lēna, mazākais fails)';

  @override
  String get consoleExSingleFile => 'Izvilkt vienu failu';

  @override
  String get consoleExTechnical => 'Parādīt ar tehniskām detaļām';

  @override
  String get consoleCopy => 'Kopēt';

  @override
  String get consoleCopied => 'Nokopēts!';

  @override
  String get consoleInfoNote =>
      'mac7z ietver savu 7zz bināro failu. Argumenti tiek nodoti tieši tādi, kādi tie ir, bez izmaiņām. Jebkura komanda, kas der 7zz, darbosies tāpat arī ar mac7z.';
}
