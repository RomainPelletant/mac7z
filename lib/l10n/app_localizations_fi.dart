// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get dropZoneDrop => 'Pudota arkisto';

  @override
  String get dropZoneRelease => 'Vapauta avataksesi';

  @override
  String get dropZoneSubtitle =>
      'tai napsauta valitaksesi\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tiedostoa',
      one: '$count tiedosto',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Suojattu arkisto';

  @override
  String get passwordDialogSubtitle => 'Syötä salasana';

  @override
  String get passwordDialogHint => 'Salasana…';

  @override
  String get cancel => 'Peruuta';

  @override
  String get confirm => 'Vahvista';

  @override
  String get logPanelTitle => 'Loki';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count merkintää',
      one: '$count merkintä',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Ei aktiviteettia';

  @override
  String get progressExtracting => 'Puretaan…';

  @override
  String get progressDone => 'Purku valmis!';

  @override
  String get treeLoading => 'Luetaan arkistoa…';

  @override
  String get treeError => 'Virhe';

  @override
  String get treeEmpty => 'Arkistoa ei ole ladattu';

  @override
  String get treeEmptyHint => 'Pudota tiedosto nähdäksesi sen sisällön';

  @override
  String get treeSearch => 'Etsi…';

  @override
  String get treeColName => 'Nimi';

  @override
  String get treeColSize => 'Koko';

  @override
  String get treeColModified => 'Muokattu';

  @override
  String get treeOpenTooltip => 'Avaa kaksoisnapsautuksella';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kohdetta',
      one: '$count kohde',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Kohde';

  @override
  String get sectionSecurity => 'Turvallisuus';

  @override
  String get destinationSameFolder => 'Sama kansio kuin arkisto';

  @override
  String get subfolderCreate => 'Pura alikansiooon';

  @override
  String get subfolderDefault => 'arkiston nimellä';

  @override
  String get passwordNone => 'Ei salasanaa';

  @override
  String get passwordSetLabel => 'Salasana asetettu';

  @override
  String get passwordEdit => 'Muokkaa';

  @override
  String get passwordDefine => 'Aseta';

  @override
  String get btnExtract => 'Pura';

  @override
  String get btnExtracting => 'Puretaan...';

  @override
  String get btnDone => 'Valmis ✓';

  @override
  String get btnReset => 'Nollaa';

  @override
  String binaryWarning(String cmd) {
    return '7zip ei löytynyt. Asenna se: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Avaa arkisto';

  @override
  String get pickOutputDialogTitle => 'Valitse kohdekansiо';

  @override
  String logBinaryFound(String path) {
    return '7zip löytyi: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip ei löytynyt. Asenna Homebrewin (macOS) tai 7-zip.org:n (Windows) kautta.';

  @override
  String get logNoArchiveRecognized =>
      'Ei tunnistettu arkistoja pudotetuissa tiedostoissa.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Ei-tuettu muoto: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Luetaan arkistoa: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count merkintää löytyi arkistosta.',
      one: '1 merkintä löytyi arkistosta.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Salattu arkisto — salasana vaaditaan.';

  @override
  String get logFilePasswordRequired =>
      'Salattu tiedosto — salasana vaaditaan.';

  @override
  String get logPasswordDefined => 'Salasana asetettu.';

  @override
  String get logCancelled => 'Peruutettu.';

  @override
  String logDestination(String path) {
    return 'Kohde: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Puretaan: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Purku valmis: $path';
  }

  @override
  String get logReset => 'Nollattu.';

  @override
  String logOpening(String name) {
    return 'Avataan $name…';
  }

  @override
  String logOpened(String name) {
    return 'Avattu: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Virhe avattaessa: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Purku virhe: $error';
  }

  @override
  String logError(String error) {
    return 'Virhe: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Epätäydellinen jaettu arkisto — puuttuvat osat. Sisältöä ei voida näyttää.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Epätäydellinen jaettu arkisto — puuttuvat osat. Näytetty sisältö voi olla puutteellinen.';

  @override
  String get logExtractionSplitError => 'Purku epäonnistui: puuttuvat osat.';

  @override
  String get errorSplitArchive =>
      '⚠️ Epätäydellinen jaettu arkisto — varmista, että kaikki osat ovat samassa kansiossa.';

  @override
  String get tabDecompression => 'Purkaminen';

  @override
  String get tabCompression => 'Pakkaaminen';

  @override
  String get tabConsoleApi => 'Konsoli-API';

  @override
  String get tabComingSoon => 'Tulossa pian';

  @override
  String get compLabelArchiveName => 'Arkiston nimi';

  @override
  String get compLabelDestination => 'Kohde';

  @override
  String get compLabelFormat => 'Muoto';

  @override
  String get compLabelCompression => 'Pakkauksen taso';

  @override
  String get compLabelSecurity => 'Turvallisuus';

  @override
  String get compLabelAdvanced => 'Lisäasetukset';

  @override
  String get compLabelSplit => 'Jaa';

  @override
  String get compSizeFolder => 'kansio';

  @override
  String get compDestSameFolder => 'Sama kansio kuin tiedostot';

  @override
  String compLevelNotApplicable(String format) {
    return 'Ei ole käytettävissä .$format:ille';
  }

  @override
  String get compHeaderEncryption => 'Otsikon salaus käytössä';

  @override
  String get compSplitNone => 'Ei mitään';

  @override
  String get compBtnCompress => 'Pakkaa';

  @override
  String get compBtnCompressing => 'Pakkaaminen…';

  @override
  String get compAddFiles => 'Lisää tiedostoja';

  @override
  String get compAddFolder => 'Lisää kansio';

  @override
  String get compDropToAdd => 'Pudota lisätäksesi';

  @override
  String get compDropHint => 'Pudota tiedostot tai kansiot tähän';

  @override
  String get compDropSubtitle => 'Tiedostot lisätään arkistoon';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kohdetta',
      one: '1 kohde',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Pakkaaminen → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arkisto luotu: $path';
  }

  @override
  String get consoleSectionConfig => 'MÄÄRITYKSET';

  @override
  String get consoleSectionCommands => 'PÄÄKOMENNOT';

  @override
  String get consoleSectionOptions => 'YLEISET ASETUKSET';

  @override
  String get consoleSectionExamples => 'EDISTYNEET ESIMERKIT';

  @override
  String get consoleHeroSubtitle =>
      'mac7z välittää kaikki argumentit suoraan mukana tulevalle 7zip-binäärille. Käytä sitä Terminalissa aivan kuten käyttäisit 7zz:ää.';

  @override
  String get consoleSetupIntro =>
      'Luo shelliisi alias, jotta voit käyttää mac7z:ää tavallisena komentona Terminalissa:';

  @override
  String get consoleSetupOutroMac =>
      'Lisää tämä rivi tiedostoon ~/.zshrc tai ~/.bash_profile, jotta asetus pysyy voimassa. Kun se on määritetty, kaikki tavalliset 7zip-komennot toimivat korvaamalla 7zz:n komennolla mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Lisää tämä rivi tiedostoon ~/.bashrc tai ~/.zshrc, jotta asetus pysyy voimassa. Kun se on määritetty, kaikki tavalliset 7zip-komennot toimivat korvaamalla 7zz:n komennolla mac7z.';

  @override
  String get consoleCmdList => 'Listaa arkiston sisältö';

  @override
  String get consoleCmdExtractFull => 'Pura täydet polut säilyttäen';

  @override
  String get consoleCmdExtractToDir => 'Pura tiettyyn kansioon';

  @override
  String get consoleCmdExtractFlat => 'Pura ilman alikansioita';

  @override
  String get consoleCmdCreateUpdate => 'Luo tai päivitä arkisto';

  @override
  String get consoleCmdCreateZip => 'Luo ZIP-arkisto';

  @override
  String get consoleCmdTest => 'Testaa arkiston eheys';

  @override
  String get consoleCmdDelete => 'Poista tiedosto arkistosta';

  @override
  String get consoleCmdInfo => 'Näytä tietoja 7zipistä';

  @override
  String get consoleOptPassword => 'Suojaa arkisto salasanalla';

  @override
  String get consoleOptEncryptHeaders => 'Salaa myös tiedostonimet (vain 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Pakkaustaso (0 = ei pakkausta, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Ota monisäikeinen pakkaus käyttöön';

  @override
  String get consoleOptSplitVolumes => 'Jaa osiin (esim. -v100m = 100 Mt)';

  @override
  String get consoleOptRecursive => 'Käsittele alikansiot rekursiivisesti';

  @override
  String get consoleOptYesAll => 'Vastaa \"kyllä\" kaikkiin vahvistuksiin';

  @override
  String get consoleOptOutputDir => 'Purkamisen kohdekansio';

  @override
  String get consoleOptExclude => 'Sulje tiedostoja pois (esim. -x!*.log)';

  @override
  String get consoleExEncrypted => 'Salattu arkisto piilotetuilla nimillä';

  @override
  String get consoleExVolumes => 'Arkisto jaettu 50 Mt:n osiin';

  @override
  String get consoleExUltra => 'Ultra-pakkaus (hidas, pienin tiedosto)';

  @override
  String get consoleExSingleFile => 'Pura yksi tiedosto';

  @override
  String get consoleExTechnical => 'Listaa tekniset tiedot';

  @override
  String get consoleCopy => 'Kopioi';

  @override
  String get consoleCopied => 'Kopioitu!';

  @override
  String get consoleInfoNote =>
      'mac7z sisältää oman 7zz-binäärinsä. Argumentit välitetään sellaisinaan ilman muutoksia. Kaikki 7zz:lle kelvolliset komennot toimivat samalla tavalla myös mac7z:n kanssa.';

  @override
  String get updateAvailableTitle => 'Päivitys saatavilla';

  @override
  String updateAvailableMessage(String version) {
    return 'Versio $version on saatavilla. Haluatko asentaa sen nyt?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Nykyinen versio: $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Uusi versio: $version';
  }

  @override
  String updateFile(String name) {
    return 'Tiedosto: $name';
  }

  @override
  String updateSize(String size) {
    return 'Koko: $size';
  }

  @override
  String get updateInstall => 'Asenna';

  @override
  String get updateLater => 'Myöhemmin';

  @override
  String get updateSkipVersion => 'Ohita tämä versio';

  @override
  String get updateDownloading => 'Ladataan...';

  @override
  String updateDownloadingAsset(String name) {
    return 'Ladataan $name...';
  }

  @override
  String get updateOpeningInstaller => 'Avataan asennusohjelmaa...';

  @override
  String get updateNoCompatibleAsset =>
      'Tälle julkaisulle ei löytynyt yhteensopivaa tiedostoa.';
}
