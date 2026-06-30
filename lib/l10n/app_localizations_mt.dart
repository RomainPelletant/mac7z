// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Maltese (`mt`).
class AppLocalizationsMt extends AppLocalizations {
  AppLocalizationsMt([String locale = 'mt']) : super(locale);

  @override
  String get dropZoneDrop => 'Oqgħod arkivju';

  @override
  String get dropZoneRelease => 'Ħalli biex tiftaħ';

  @override
  String get dropZoneSubtitle =>
      'jew ikklikkja biex tagħżel\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fajls',
      one: '$count fajl',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Arkivju protett';

  @override
  String get passwordDialogSubtitle => 'Daħħal il-password';

  @override
  String get passwordDialogHint => 'Password…';

  @override
  String get cancel => 'Ikkanċella';

  @override
  String get confirm => 'Ikkonfirma';

  @override
  String get logPanelTitle => 'Log';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrati',
      one: '$count entrata',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'L-ebda attività';

  @override
  String get progressExtracting => 'Qed nħeġġa…';

  @override
  String get progressDone => 'Heħ kompleta!';

  @override
  String get treeLoading => 'Qed naqra l-arkivju…';

  @override
  String get treeError => 'Żball';

  @override
  String get treeEmpty => 'L-ebda arkivju mitmut';

  @override
  String get treeEmptyHint => 'Oqgħod fajl biex taraw il-kontenut tiegħu';

  @override
  String get treeSearch => 'Fittex…';

  @override
  String get treeColName => 'Isem';

  @override
  String get treeColSize => 'Daqs';

  @override
  String get treeColModified => 'Ibdel';

  @override
  String get treeOpenTooltip => 'Dubpikk biex tiftaħ';

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
  String get sectionDestination => 'Destinazzjoni';

  @override
  String get sectionSecurity => 'Sigurtà';

  @override
  String get destinationSameFolder => 'Istess folder bħal l-arkivju';

  @override
  String get subfolderCreate => 'Extrawwi lejn subfolder';

  @override
  String get subfolderDefault => 'imsemmija skond l-isem tal-arkivju';

  @override
  String get passwordNone => 'Ebda password';

  @override
  String get passwordSetLabel => 'Password impost';

  @override
  String get passwordEdit => 'Irrevedi';

  @override
  String get passwordDefine => 'Ippost';

  @override
  String get btnExtract => 'Heħ';

  @override
  String get btnExtracting => 'Qed nheħ...';

  @override
  String get btnDone => 'Lest ✓';

  @override
  String get btnReset => 'Irrisettja';

  @override
  String binaryWarning(String cmd) {
    return '7zip ma nstab. Instal li: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Iftaħ arkivju';

  @override
  String get pickOutputDialogTitle => 'Agħżel folder tal-destinazzjoni';

  @override
  String logBinaryFound(String path) {
    return '7zip misjub: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip ma nstab. Instal permezz ta Homebrew (macOS) jew 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'L-ebda arkivju rikonoxxut fil-fajls oqgħodin.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Format mhux appoġġat: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Qed naqra l-arkivju: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrati misjubin fl-arkivju.',
      one: '1 entrata misjuba fl-arkivju.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Arkivju encrypted — password meħtieġa.';

  @override
  String get logFilePasswordRequired => 'Fajl encrypted — password meħtieġa.';

  @override
  String get logPasswordDefined => 'Password impost.';

  @override
  String get logCancelled => 'Ikkancella.';

  @override
  String logDestination(String path) {
    return 'Destinazzjoni: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Qed nheħ lejn: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Heħ kompleta fi: $path';
  }

  @override
  String get logReset => 'Irrisettjat.';

  @override
  String logOpening(String name) {
    return 'Qed niftaħ $name…';
  }

  @override
  String logOpened(String name) {
    return 'Iftaħ: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Żball fl-iftaħ: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Żball taħ-heħ: $error';
  }

  @override
  String logError(String error) {
    return 'Żball: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Arkivju mqassam mhux kampitura — partijiet nieqsa. Ma jistax jintwera l-kontenut.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Arkivju mqassam mhux kampitura — partijiet nieqsa. Il-kontenut imtella jista jkun mhux kampitur.';

  @override
  String get logExtractionSplitError => 'Heħ falliet: partijiet nieqsa.';

  @override
  String get errorSplitArchive =>
      '⚠️ Arkivju mqassam mhux kampitura — immiegħed li l-partijiet kollha huma fl-istess folder.';

  @override
  String get tabDecompression => 'Dekompriment';

  @override
  String get tabCompression => 'Kompriment';

  @override
  String get tabConsoleApi => 'Konsol API';

  @override
  String get tabComingSoon => 'Breve';

  @override
  String get compLabelArchiveName => 'Isem tal-arkivju';

  @override
  String get compLabelDestination => 'Destinazzjoni';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Livell ta\' kompressjoni';

  @override
  String get compLabelSecurity => 'Sigurtà';

  @override
  String get compLabelAdvanced => 'Għażliet avvanzati';

  @override
  String get compLabelSplit => 'Aqsam';

  @override
  String get compSizeFolder => 'folder';

  @override
  String get compDestSameFolder => 'Istess folder bħal il-fajls';

  @override
  String compLevelNotApplicable(String format) {
    return 'Mhux applikabbli għal .$format';
  }

  @override
  String get compHeaderEncryption => 'L-encryption tal-header ħaġġa';

  @override
  String get compSplitNone => 'Ebda ħadd';

  @override
  String get compBtnCompress => 'Komprimu';

  @override
  String get compBtnCompressing => 'Qed nikkomprimu…';

  @override
  String get compAddFiles => 'Żid fajls';

  @override
  String get compAddFolder => 'Żid folder';

  @override
  String get compDropToAdd => 'Oqgħod biex iżżid';

  @override
  String get compDropHint => 'Oqgħod fajls jew folders hawn';

  @override
  String get compDropSubtitle => 'Il-fajls se jiżdiedu mal-arkivju';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementi',
      one: '$count element',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Qed nikkomprimu → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arkivju mħoloq: $path';
  }

  @override
  String get consoleSectionConfig => 'KONFIGURAZZJONI';

  @override
  String get consoleSectionCommands => 'KMANDI EWLENIN';

  @override
  String get consoleSectionOptions => 'GĦAŻLIET KOMUNI';

  @override
  String get consoleSectionExamples => 'EŻEMPJI AVVANZATI';

  @override
  String get consoleHeroSubtitle =>
      'mac7z jgħaddi l-argumenti kollha direttament lill-binarju 7zip inkorporat. Użah minn Terminal eżatt kif tuża 7zz.';

  @override
  String get consoleSetupIntro =>
      'Oħloq alias fis-shell tiegħek biex tuża mac7z bħala kmand normali fit-Terminal:';

  @override
  String get consoleSetupOutroMac =>
      'Żid din il-linja fil-~/.zshrc jew fil-~/.bash_profile biex tibqa’ permanenti. Ladarba jiġi kkonfigurat, il-kmandi standard kollha ta’ 7zip jaħdmu billi tissostitwixxi 7zz b’mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Żid din il-linja fil-~/.bashrc jew fil-~/.zshrc biex tibqa’ permanenti. Ladarba jiġi kkonfigurat, il-kmandi standard kollha ta’ 7zip jaħdmu billi tissostitwixxi 7zz b’mac7z.';

  @override
  String get consoleCmdList => 'Uri l-kontenut ta’ arkivju';

  @override
  String get consoleCmdExtractFull => 'Estrai bil-passaġġi sħaħ';

  @override
  String get consoleCmdExtractToDir => 'Estrai għal folder speċifiku';

  @override
  String get consoleCmdExtractFlat => 'Estrai mingħajr subfolders';

  @override
  String get consoleCmdCreateUpdate => 'Oħloq jew aġġorna arkivju';

  @override
  String get consoleCmdCreateZip => 'Oħloq arkivju ZIP';

  @override
  String get consoleCmdTest => 'Ittestja l-integrità tal-arkivju';

  @override
  String get consoleCmdDelete => 'Ħassar fajl minn arkivju';

  @override
  String get consoleCmdInfo => 'Uri informazzjoni dwar 7zip';

  @override
  String get consoleOptPassword => 'Ipproteġi l-arkivju b’password';

  @override
  String get consoleOptEncryptHeaders =>
      'Ikkripta wkoll l-ismijiet tal-fajls (7z biss)';

  @override
  String get consoleOptCompressionLevel =>
      'Livell ta’ kompressjoni (0 = xejn, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Ixgħel il-kompressjoni multi-thread';

  @override
  String get consoleOptSplitVolumes =>
      'Aqsam f’volumi (eż. -v100m għal 100 MB)';

  @override
  String get consoleOptRecursive => 'Ipproċessa s-subfolders b’mod rikursiv';

  @override
  String get consoleOptYesAll => 'Wieġeb \"iva\" għall-konfermi kollha';

  @override
  String get consoleOptOutputDir =>
      'Folder tad-destinazzjoni għall-estrazzjoni';

  @override
  String get consoleOptExclude => 'Eskludi fajls (eż. -x!*.log)';

  @override
  String get consoleExEncrypted => 'Arkivju kkodifikat b’ismijiet moħbija';

  @override
  String get consoleExVolumes => 'Arkivju maqsum f’volumi ta’ 50 MB';

  @override
  String get consoleExUltra => 'Kompressjoni ultra (bil-mod, l-iżgħar fajl)';

  @override
  String get consoleExSingleFile => 'Estrai fajl wieħed';

  @override
  String get consoleExTechnical => 'Uri b’dettalji tekniċi';

  @override
  String get consoleCopy => 'Ikkopja';

  @override
  String get consoleCopied => 'Ikkopjat!';

  @override
  String get consoleInfoNote =>
      'mac7z jiġi bil-binarju 7zz tiegħu stess. L-argumenti jgħaddu eżatt kif inhuma, mingħajr tibdil. Kull kmand validu għal 7zz jaħdem bl-istess mod ma’ mac7z.';

  @override
  String get updateAvailableTitle => 'Aġġornament disponibbli';

  @override
  String updateAvailableMessage(String version) {
    return 'Il-verżjoni $version hija disponibbli. Trid tinstallaha issa?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Verżjoni kurrenti: $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Verżjoni ġdida: $version';
  }

  @override
  String updateFile(String name) {
    return 'Fajl: $name';
  }

  @override
  String updateSize(String size) {
    return 'Daqs: $size';
  }

  @override
  String get updateInstall => 'Installa';

  @override
  String get updateLater => 'Aktar tard';

  @override
  String get updateSkipVersion => 'Aqbeż din il-verżjoni';

  @override
  String get updateDownloading => 'Qed jitniżżel...';

  @override
  String updateDownloadingAsset(String name) {
    return 'Qed jitniżżel $name...';
  }

  @override
  String get updateOpeningInstaller => 'Qed jinfetaħ l-installatur...';

  @override
  String get updateNoCompatibleAsset =>
      'Ma nstab l-ebda fajl kompatibbli f’dan ir-rilaxx.';
}
