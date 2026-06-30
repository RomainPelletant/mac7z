// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get dropZoneDrop => 'Lohistage arhiiv';

  @override
  String get dropZoneRelease => 'Lahti laskmine avamiseks';

  @override
  String get dropZoneSubtitle =>
      'või klõpsake valimiseks\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count faili',
      one: '$count fail',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Kaitstud arhiiv';

  @override
  String get passwordDialogSubtitle => 'Sisestage parool';

  @override
  String get passwordDialogHint => 'Parool…';

  @override
  String get cancel => 'Tühista';

  @override
  String get confirm => 'Kinnita';

  @override
  String get logPanelTitle => 'Logi';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kirjet',
      one: '$count kirje',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Tegevust pole';

  @override
  String get progressExtracting => 'Pakitakse lahti…';

  @override
  String get progressDone => 'Lahtipakkimine lõpule viidud!';

  @override
  String get treeLoading => 'Arhiivi lugemine…';

  @override
  String get treeError => 'Viga';

  @override
  String get treeEmpty => 'Archiiviid pole laaditud';

  @override
  String get treeEmptyHint => 'Lohistage fail selle sisu nägemiseks';

  @override
  String get treeSearch => 'Otsing…';

  @override
  String get treeColName => 'Nimi';

  @override
  String get treeColSize => 'Suurus';

  @override
  String get treeColModified => 'Muudetud';

  @override
  String get treeOpenTooltip => 'Avamiseks topeltklõps';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '$count element',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Sihtkoht';

  @override
  String get sectionSecurity => 'Turvalisus';

  @override
  String get destinationSameFolder => 'Sama kaust kui arhiiv';

  @override
  String get subfolderCreate => 'Paki lahti alamkausta';

  @override
  String get subfolderDefault => 'arhiivi nimega';

  @override
  String get passwordNone => 'Parooliga pole';

  @override
  String get passwordSetLabel => 'Parool on määratud';

  @override
  String get passwordEdit => 'Redigeeri';

  @override
  String get passwordDefine => 'Määra';

  @override
  String get btnExtract => 'Paki lahti';

  @override
  String get btnExtracting => 'Pakitakse lahti...';

  @override
  String get btnDone => 'Valmis ✓';

  @override
  String get btnReset => 'Lähtesta';

  @override
  String binaryWarning(String cmd) {
    return '7zip ei leitud. Installige see: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Avage arhiiv';

  @override
  String get pickOutputDialogTitle => 'Valige sihtkausta';

  @override
  String logBinaryFound(String path) {
    return '7zip leitud: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip ei leitud. Installige Homebrew (macOS) või 7-zip.org (Windows) kaudu.';

  @override
  String get logNoArchiveRecognized =>
      'Lohistatud failide seas ei ole tunnistatud arhiiviid.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Toetamata vorming: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Arhiivi lugemine: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kirjet leitud arhiivist.',
      one: '1 kirje leitud arhiivist.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Krüptitud arhiiv — parool nõutav.';

  @override
  String get logFilePasswordRequired => 'Krüptitud fail — parool nõutav.';

  @override
  String get logPasswordDefined => 'Parool on määratud.';

  @override
  String get logCancelled => 'Tühistatud.';

  @override
  String logDestination(String path) {
    return 'Sihtkoht: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Pakitakse lahti: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Lahtipakkimine lõpule viidud: $path';
  }

  @override
  String get logReset => 'Lähtestatud.';

  @override
  String logOpening(String name) {
    return 'Avanud $name…';
  }

  @override
  String logOpened(String name) {
    return 'Avatud: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Viga avamisel: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Lahtipakkimise viga: $error';
  }

  @override
  String logError(String error) {
    return 'Viga: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Mittetäielik jagatud arhiiv — puuduvad osad. Sisu ei ole võimalik kuvada.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Mittetäielik jagatud arhiiv — puuduvad osad. Kuvatav sisu võib olla mittetäielik.';

  @override
  String get logExtractionSplitError =>
      'Lahtipakkimine ebaõnnestus: puuduvad osad.';

  @override
  String get errorSplitArchive =>
      '⚠️ Mittetäielik jagatud arhiiv — veenduge, et kõik osad on samas kaustas.';

  @override
  String get tabDecompression => 'Lahtipakkimine';

  @override
  String get tabCompression => 'Pakkimine';

  @override
  String get tabConsoleApi => 'Konsool API';

  @override
  String get tabComingSoon => 'Peagi saadaval';

  @override
  String get compLabelArchiveName => 'Arhiivi nimi';

  @override
  String get compLabelDestination => 'Sihtkoht';

  @override
  String get compLabelFormat => 'Vorming';

  @override
  String get compLabelCompression => 'Tihenduse tase';

  @override
  String get compLabelSecurity => 'Turvalisus';

  @override
  String get compLabelAdvanced => 'Advanced options';

  @override
  String get compLabelSplit => 'Jaga';

  @override
  String get compSizeFolder => 'kaust';

  @override
  String get compDestSameFolder => 'Sama kaust kui failid';

  @override
  String compLevelNotApplicable(String format) {
    return 'Pole kehtiv .${format}ile';
  }

  @override
  String get compHeaderEncryption => 'Päise krüptimine lubatud';

  @override
  String get compSplitNone => 'Puudub';

  @override
  String get compBtnCompress => 'Pakka';

  @override
  String get compBtnCompressing => 'Pakitakse…';

  @override
  String get compAddFiles => 'Lisage failid';

  @override
  String get compAddFolder => 'Lisage kaust';

  @override
  String get compDropToAdd => 'Lohistage lisamiseks';

  @override
  String get compDropHint => 'Lohistage failid või kaustid siia';

  @override
  String get compDropSubtitle => 'Failid lisatakse arhiivile';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Pakitakse → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arhiiv loodud: $path';
  }

  @override
  String get consoleSectionConfig => 'SEADISTUS';

  @override
  String get consoleSectionCommands => 'PÕHIKÄSUD';

  @override
  String get consoleSectionOptions => 'LEVINUD VALIKUD';

  @override
  String get consoleSectionExamples => 'TÄPSEMAD NÄITED';

  @override
  String get consoleHeroSubtitle =>
      'mac7z edastab kõik argumendid otse kaasasolevale 7zip binaarfailile. Kasuta seda Terminalis täpselt nii, nagu kasutaksid 7zz-i.';

  @override
  String get consoleSetupIntro =>
      'Loo oma shellis alias, et kasutada mac7z-i tavalise käsuna Terminalis:';

  @override
  String get consoleSetupOutroMac =>
      'Lisa see rida faili ~/.zshrc või ~/.bash_profile, et see jääks püsivaks. Pärast seadistamist töötavad kõik tavalised 7zip käsud, kui asendad 7zz mac7z-iga.';

  @override
  String get consoleSetupOutroLinux =>
      'Lisa see rida faili ~/.bashrc või ~/.zshrc, et see jääks püsivaks. Pärast seadistamist töötavad kõik tavalised 7zip käsud, kui asendad 7zz mac7z-iga.';

  @override
  String get consoleCmdList => 'Arhiivi sisu loetlemine';

  @override
  String get consoleCmdExtractFull => 'Lahtipakkimine täielike teedega';

  @override
  String get consoleCmdExtractToDir => 'Lahtipakkimine kindlasse kausta';

  @override
  String get consoleCmdExtractFlat => 'Lahtipakkimine ilma alamkaustadeta';

  @override
  String get consoleCmdCreateUpdate => 'Arhiivi loomine või uuendamine';

  @override
  String get consoleCmdCreateZip => 'ZIP-arhiivi loomine';

  @override
  String get consoleCmdTest => 'Arhiivi tervikluse kontroll';

  @override
  String get consoleCmdDelete => 'Faili kustutamine arhiivist';

  @override
  String get consoleCmdInfo => '7zipi teabe kuvamine';

  @override
  String get consoleOptPassword => 'Arhiivi kaitsmine parooliga';

  @override
  String get consoleOptEncryptHeaders => 'Krüpti ka failinimed (ainult 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Pakkimistaseme valik (0 = puudub, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Mitmelõimelise pakkimise lubamine';

  @override
  String get consoleOptSplitVolumes => 'Jaga osadeks (nt -v100m 100 MB jaoks)';

  @override
  String get consoleOptRecursive => 'Töötle alamkaustu rekursiivselt';

  @override
  String get consoleOptYesAll => 'Vasta kõigile kinnitustele \"jah\"';

  @override
  String get consoleOptOutputDir => 'Sihtkaust lahtipakkimiseks';

  @override
  String get consoleOptExclude => 'Välista failid (nt -x!*.log)';

  @override
  String get consoleExEncrypted => 'Krüpteeritud arhiiv peidetud nimedega';

  @override
  String get consoleExVolumes => 'Arhiiv jagatud 50 MB osadeks';

  @override
  String get consoleExUltra => 'Ülipakkimine (aeglane, väikseim fail)';

  @override
  String get consoleExSingleFile => 'Ühe faili lahtipakkimine';

  @override
  String get consoleExTechnical => 'Loetelu tehniliste detailidega';

  @override
  String get consoleCopy => 'Kopeeri';

  @override
  String get consoleCopied => 'Kopeeritud!';

  @override
  String get consoleInfoNote =>
      'mac7z sisaldab oma 7zz binaarfaili. Argumendid edastatakse täpselt muutmata kujul. Kõik 7zz jaoks kehtivad käsud töötavad samamoodi ka mac7z-iga.';

  @override
  String get updateAvailableTitle => 'Uuendus on saadaval';

  @override
  String updateAvailableMessage(String version) {
    return 'Versioon $version on saadaval. Kas soovite selle kohe installida?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Praegune versioon: $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Uus versioon: $version';
  }

  @override
  String updateFile(String name) {
    return 'Fail: $name';
  }

  @override
  String updateSize(String size) {
    return 'Suurus: $size';
  }

  @override
  String get updateInstall => 'Installi';

  @override
  String get updateLater => 'Hiljem';

  @override
  String get updateSkipVersion => 'Jäta see versioon vahele';

  @override
  String get updateDownloading => 'Allalaadimine...';

  @override
  String updateDownloadingAsset(String name) {
    return '$name allalaadimine...';
  }

  @override
  String get updateOpeningInstaller => 'Installeri avamine...';

  @override
  String get updateNoCompatibleAsset =>
      'Selles väljalaskes ei leitud ühtegi ühilduvat faili.';
}
