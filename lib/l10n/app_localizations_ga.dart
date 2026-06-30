// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Irish (`ga`).
class AppLocalizationsGa extends AppLocalizations {
  AppLocalizationsGa([String locale = 'ga']) : super(locale);

  @override
  String get dropZoneDrop => 'Scaoil faisnéis';

  @override
  String get dropZoneRelease => 'Scaoil chun oscailt';

  @override
  String get dropZoneSubtitle =>
      'nó cliceáil chun a roghnú\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count chomhad',
      one: '$count comhad',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Faisnéis dhlúthaithe';

  @override
  String get passwordDialogSubtitle => 'Iontráil an pasfhocal';

  @override
  String get passwordDialogHint => 'Pasfhocal…';

  @override
  String get cancel => 'Cealaigh';

  @override
  String get confirm => 'Dearbhú';

  @override
  String get logPanelTitle => 'Logchomhad';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count iontráil',
      one: '$count iontráil',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Gan gníomhaíocht';

  @override
  String get progressExtracting => 'Ag foluain…';

  @override
  String get progressDone => 'Foluain críochnaithe!';

  @override
  String get treeLoading => 'Faisnéis á léamh…';

  @override
  String get treeError => 'Earráid';

  @override
  String get treeEmpty => 'Gan faisnéis ualaithe';

  @override
  String get treeEmptyHint => 'Scaoil comhad chun a ábhar a fheiceáil';

  @override
  String get treeSearch => 'Cuardaigh…';

  @override
  String get treeColName => 'Ainm';

  @override
  String get treeColSize => 'Méid';

  @override
  String get treeColModified => 'Athraithe';

  @override
  String get treeOpenTooltip => 'Déchilc chun oscailt';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mhír',
      one: '$count mír',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Ceanncheathrú';

  @override
  String get sectionSecurity => 'Slándáil';

  @override
  String get destinationSameFolder => 'Bosca céanna leis an faisnéis';

  @override
  String get subfolderCreate => 'Foluain go bhosca fofhuigh';

  @override
  String get subfolderDefault => 'ainmnithe de réir an fhaisnéis';

  @override
  String get passwordNone => 'Gan pasfhocal';

  @override
  String get passwordSetLabel => 'Pasfhocal socraithe';

  @override
  String get passwordEdit => 'Cuir in eagar';

  @override
  String get passwordDefine => 'Socraigh';

  @override
  String get btnExtract => 'Foluain';

  @override
  String get btnExtracting => 'Foluain...';

  @override
  String get btnDone => 'Déanta ✓';

  @override
  String get btnReset => 'Athshocraigh';

  @override
  String binaryWarning(String cmd) {
    return '7zip gan fhail. Feidhmigh: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Oscail faisnéis';

  @override
  String get pickOutputDialogTitle => 'Roghnaigh bosca ceanncheathrú';

  @override
  String logBinaryFound(String path) {
    return '7zip faighte: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip gan fhail. Feidhmigh trí Homebrew (macOS) nó 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Gan faisnéis aithnighthe i gcomhaid scaoilte.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Formáid gan thaca: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Faisnéis á léamh: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count iontráil aimsithe sa fhaisnéis.',
      one: '1 iontráil aimsithe sa fhaisnéis.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired =>
      'Faisnéis dhlúthaithe — pasfhocal de dhíth.';

  @override
  String get logFilePasswordRequired =>
      'Comhad dlúthaithe — pasfhocal de dhíth.';

  @override
  String get logPasswordDefined => 'Pasfhocal socraithe.';

  @override
  String get logCancelled => 'Cealaithea.';

  @override
  String logDestination(String path) {
    return 'Ceanncheathrú: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Ag foluain go: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Foluain críochnaithe i: $path';
  }

  @override
  String get logReset => 'Athshocraithea.';

  @override
  String logOpening(String name) {
    return 'Ag oscailt $name…';
  }

  @override
  String logOpened(String name) {
    return 'Oscailte: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Earráid ag oscailt: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Earráid foluain: $error';
  }

  @override
  String logError(String error) {
    return 'Earráid: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Faisnéis roinnte neamhiomlán — páirt ar iarraidh. Ní féidir ábhar a thaispeáint.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Faisnéis roinnte neamhiomlán — páirt ar iarraidh. Seans go mbeidh ábhar taispeáinte neamhiomlán.';

  @override
  String get logExtractionSplitError => 'Flouain theip: páirt ar iarraidh.';

  @override
  String get errorSplitArchive =>
      '⚠️ Faisnéis roinnte neamhiomlán — déan cinnte go bhfuil gach páirt san fhosca céanna.';

  @override
  String get tabDecompression => 'Díchomhbhrú';

  @override
  String get tabCompression => 'Comhbhrú';

  @override
  String get tabConsoleApi => 'Comhéadan API';

  @override
  String get tabComingSoon => 'Go luath';

  @override
  String get compLabelArchiveName => 'Ainm an fhaisnéis';

  @override
  String get compLabelDestination => 'Ceanncheathrú';

  @override
  String get compLabelFormat => 'Formáid';

  @override
  String get compLabelCompression => 'Leibhéal comhbhrúite';

  @override
  String get compLabelSecurity => 'Slándáil';

  @override
  String get compLabelAdvanced => 'Advanced options';

  @override
  String get compLabelSplit => 'Roinnt';

  @override
  String get compSizeFolder => 'bosca';

  @override
  String get compDestSameFolder => 'Bosca céanna le na comhaid';

  @override
  String compLevelNotApplicable(String format) {
    return 'Gan bhrí do .$format';
  }

  @override
  String get compHeaderEncryption => 'Criptiú ceanntásc cumasaithe';

  @override
  String get compSplitNone => 'Níl';

  @override
  String get compBtnCompress => 'Comhbhrú';

  @override
  String get compBtnCompressing => 'Ag comhbhrú…';

  @override
  String get compAddFiles => 'Cuir comhaid leis';

  @override
  String get compAddFolder => 'Cuir bosca leis';

  @override
  String get compDropToAdd => 'Scaoil chun a chur leis';

  @override
  String get compDropHint => 'Scaoil comhaid nó boscaí anseo';

  @override
  String get compDropSubtitle => 'Cuirfear comhaid leis an fhaisnéis';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mhír',
      one: '$count mír',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Ag comhbhrú → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Faisnéis cruthaithe: $path';
  }

  @override
  String get consoleSectionConfig => 'CUMRAÍOCHT';

  @override
  String get consoleSectionCommands => 'PRÍOMHORDUITHE';

  @override
  String get consoleSectionOptions => 'ROGHANNA COITIANTA';

  @override
  String get consoleSectionExamples => 'SAMPLAÍ CUIDEACHTA';

  @override
  String get consoleHeroSubtitle =>
      'Cuireann mac7z gach argóint ar aghaidh go díreach chuig an dénártha 7zip atá san áireamh. Úsáid é ón Terminal díreach mar a d’úsáidfeá 7zz.';

  @override
  String get consoleSetupIntro =>
      'Cruthaigh ailias i do shell chun mac7z a úsáid mar ghnáthordú sa Terminal:';

  @override
  String get consoleSetupOutroMac =>
      'Cuir an líne seo le do ~/.zshrc nó ~/.bash_profile chun í a dhéanamh buan. Nuair a bheidh sé socraithe, oibreoidh gach gnáthordú 7zip trí mac7z a chur in áit 7zz.';

  @override
  String get consoleSetupOutroLinux =>
      'Cuir an líne seo le do ~/.bashrc nó ~/.zshrc chun í a dhéanamh buan. Nuair a bheidh sé socraithe, oibreoidh gach gnáthordú 7zip trí mac7z a chur in áit 7zz.';

  @override
  String get consoleCmdList => 'Liostaigh ábhar cartlainne';

  @override
  String get consoleCmdExtractFull => 'Bain amach le cosáin iomlána';

  @override
  String get consoleCmdExtractToDir => 'Bain amach chuig fillteán sonrach';

  @override
  String get consoleCmdExtractFlat => 'Bain amach gan fofhillteáin';

  @override
  String get consoleCmdCreateUpdate => 'Cruthaigh nó nuashonraigh cartlann';

  @override
  String get consoleCmdCreateZip => 'Cruthaigh cartlann ZIP';

  @override
  String get consoleCmdTest => 'Tástáil sláine na cartlainne';

  @override
  String get consoleCmdDelete => 'Scrios comhad ó chartlann';

  @override
  String get consoleCmdInfo => 'Taispeáin eolas faoi 7zip';

  @override
  String get consoleOptPassword => 'Cosain an chartlann le focal faire';

  @override
  String get consoleOptEncryptHeaders =>
      'Criptigh ainmneacha comhad freisin (7z amháin)';

  @override
  String get consoleOptCompressionLevel =>
      'Leibhéal comhbhrúite (0 = gan aon, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Cumasaigh comhbhrú ilshnáithe';

  @override
  String get consoleOptSplitVolumes =>
      'Roinn ina imleabhair (m.sh. -v100m do 100 MB)';

  @override
  String get consoleOptRecursive => 'Próiseáil fofhillteáin go hathchúrsach';

  @override
  String get consoleOptYesAll => 'Freagair \"tá\" do gach dearbhú';

  @override
  String get consoleOptOutputDir => 'Fillteán sprice don eastóscadh';

  @override
  String get consoleOptExclude => 'Fág comhaid ar lár (m.sh. -x!*.log)';

  @override
  String get consoleExEncrypted => 'Cartlann chriptithe le hainmneacha ceilte';

  @override
  String get consoleExVolumes => 'Cartlann roinnte ina himleabhair 50 MB';

  @override
  String get consoleExUltra => 'Sár-chomhbhrú (mall, an comhad is lú)';

  @override
  String get consoleExSingleFile => 'Bain amach comhad amháin';

  @override
  String get consoleExTechnical => 'Liostaigh le sonraí teicniúla';

  @override
  String get consoleCopy => 'Cóipeáil';

  @override
  String get consoleCopied => 'Cóipeáilte!';

  @override
  String get consoleInfoNote =>
      'Tagann mac7z lena dhénártha 7zz féin. Cuirtear na hargóintí ar aghaidh díreach mar atá siad, gan athrú. Oibríonn aon ordú bailí do 7zz ar an mbealach céanna le mac7z.';

  @override
  String get updateAvailableTitle => 'Nuashonrú ar fáil';

  @override
  String updateAvailableMessage(String version) {
    return 'Tá leagan $version ar fáil. Ar mhaith leat é a shuiteáil anois?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Leagan reatha: $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Leagan nua: $version';
  }

  @override
  String updateFile(String name) {
    return 'Comhad: $name';
  }

  @override
  String updateSize(String size) {
    return 'Méid: $size';
  }

  @override
  String get updateInstall => 'Suiteáil';

  @override
  String get updateLater => 'Níos déanaí';

  @override
  String get updateSkipVersion => 'Scipeáil an leagan seo';

  @override
  String get updateDownloading => 'Á íoslódáil...';

  @override
  String updateDownloadingAsset(String name) {
    return 'Á íoslódáil $name...';
  }

  @override
  String get updateOpeningInstaller => 'Suiteálaí á oscailt...';

  @override
  String get updateNoCompatibleAsset =>
      'Níor aimsíodh comhad comhoiriúnach sa leagan seo.';
}
