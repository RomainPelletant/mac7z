// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get dropZoneDrop => 'Presuňte archív';

  @override
  String get dropZoneRelease => 'Uvoľnite na otvorenie';

  @override
  String get dropZoneSubtitle =>
      'alebo kliknutím vyberte\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count súboru',
      many: '$count súborov',
      few: '$count súbory',
      one: '$count súbor',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Chránený archív';

  @override
  String get passwordDialogSubtitle => 'Zadajte heslo';

  @override
  String get passwordDialogHint => 'Heslo…';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get confirm => 'Potvrdiť';

  @override
  String get logPanelTitle => 'Protokol';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count položky',
      many: '$count položiek',
      few: '$count položky',
      one: '$count položka',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Žiadna aktivita';

  @override
  String get progressExtracting => 'Rozbaľovanie…';

  @override
  String get progressDone => 'Rozbaľovanie hotové!';

  @override
  String get treeLoading => 'Čítanie archívu…';

  @override
  String get treeError => 'Chyba';

  @override
  String get treeEmpty => 'Žiadny archív nenačítaný';

  @override
  String get treeEmptyHint => 'Presuňte súbor, aby ste videli jeho obsah';

  @override
  String get treeSearch => 'Hľadať…';

  @override
  String get treeColName => 'Názov';

  @override
  String get treeColSize => 'Veľkosť';

  @override
  String get treeColModified => 'Zmenené';

  @override
  String get treeOpenTooltip => 'Dvojitým kliknutím otvorte';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prvku',
      many: '$count prvkov',
      few: '$count prvky',
      one: '$count prvok',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Cieľ';

  @override
  String get sectionSecurity => 'Bezpečnosť';

  @override
  String get destinationSameFolder => 'Rovnaký priečinok ako archív';

  @override
  String get subfolderCreate => 'Rozbaliť do podpriečinku';

  @override
  String get subfolderDefault => 'pomenovaný podľa archívu';

  @override
  String get passwordNone => 'Bez hesla';

  @override
  String get passwordSetLabel => 'Heslo je nastavené';

  @override
  String get passwordEdit => 'Upraviť';

  @override
  String get passwordDefine => 'Nastaviť';

  @override
  String get btnExtract => 'Rozbaliť';

  @override
  String get btnExtracting => 'Rozbaľovanie...';

  @override
  String get btnDone => 'Hotovo ✓';

  @override
  String get btnReset => 'Obnoviť';

  @override
  String binaryWarning(String cmd) {
    return '7zip nenájdený. Nainštalujte ho: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Otvoriť archív';

  @override
  String get pickOutputDialogTitle => 'Vyberte cieľový priečinok';

  @override
  String logBinaryFound(String path) {
    return '7zip nájdený: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip nenájdený. Nainštalujte cez Homebrew (macOS) alebo 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'V presunutých súboroch nie je rozpoznaný žiadny archív.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Nepodporovaný formát: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Čítanie archívu: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'V archíve nájdená $count položka.',
      many: 'V archíve nájdených $count položiek.',
      few: 'V archíve nájdené $count položky.',
      one: 'V archíve nájdená 1 položka.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Šifrovaný archív — vyžaduje sa heslo.';

  @override
  String get logFilePasswordRequired => 'Šifrovaný súbor — vyžaduje sa heslo.';

  @override
  String get logPasswordDefined => 'Heslo je nastavené.';

  @override
  String get logCancelled => 'Zrušené.';

  @override
  String logDestination(String path) {
    return 'Cieľ: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Rozbaľovanie do: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Rozbaľovanie hotové v: $path';
  }

  @override
  String get logReset => 'Obnovené.';

  @override
  String logOpening(String name) {
    return 'Otvorenie $name…';
  }

  @override
  String logOpened(String name) {
    return 'Otvorené: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Chyba pri otváraní: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Chyba pri rozbaľovaní: $error';
  }

  @override
  String logError(String error) {
    return 'Chyba: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Nekompletný rozdelený archív — chýbajúce časti. Nie je možné zobraziť obsah.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Nekompletný rozdelený archív — chýbajúce časti. Zobrazený obsah môže byť nekompletný.';

  @override
  String get logExtractionSplitError =>
      'Rozbaľovanie zlyhalo: chýbajúce časti.';

  @override
  String get errorSplitArchive =>
      '⚠️ Nekompletný rozdelený archív — uistite sa, že všetky časti sú v rovnakom priečinku.';

  @override
  String get tabDecompression => 'Dekomprimácia';

  @override
  String get tabCompression => 'Komprimácia';

  @override
  String get tabConsoleApi => 'Konzola API';

  @override
  String get tabComingSoon => 'Čoskoro';

  @override
  String get compLabelArchiveName => 'Názov archívu';

  @override
  String get compLabelDestination => 'Cieľ';

  @override
  String get compLabelFormat => 'Formát';

  @override
  String get compLabelCompression => 'Úroveň kompresie';

  @override
  String get compLabelSecurity => 'Bezpečnosť';

  @override
  String get compLabelAdvanced => 'Pokročilé možnosti';

  @override
  String get compLabelSplit => 'Rozdeliť';

  @override
  String get compSizeFolder => 'priečinok';

  @override
  String get compDestSameFolder => 'Rovnaký priečinok ako súbory';

  @override
  String compLevelNotApplicable(String format) {
    return 'Nepoužiteľné pre .$format';
  }

  @override
  String get compHeaderEncryption => 'Šifrovanie hlavičky je povolené';

  @override
  String get compSplitNone => 'Žiadne';

  @override
  String get compBtnCompress => 'Komprimovať';

  @override
  String get compBtnCompressing => 'Kompresia…';

  @override
  String get compAddFiles => 'Pridať súbory';

  @override
  String get compAddFolder => 'Pridať priečinok';

  @override
  String get compDropToAdd => 'Presuňte na pridanie';

  @override
  String get compDropHint => 'Presuňte sem súbory alebo priečinky';

  @override
  String get compDropSubtitle => 'Súbory budú pridané do archívu';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count prvku',
      many: '$count prvkov',
      few: '$count prvky',
      one: '1 prvok',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Kompresia → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archív vytvorený: $path';
  }

  @override
  String get consoleSectionConfig => 'KONFIGURÁCIA';

  @override
  String get consoleSectionCommands => 'HLAVNÉ PRÍKAZY';

  @override
  String get consoleSectionOptions => 'BEŽNÉ MOŽNOSTI';

  @override
  String get consoleSectionExamples => 'POKROČILÉ PRÍKLADY';

  @override
  String get consoleHeroSubtitle =>
      'mac7z odovzdáva všetky argumenty priamo vstavanému binárnemu súboru 7zip. Používajte ho v Terminali presne tak, ako by ste používali 7zz.';

  @override
  String get consoleSetupIntro =>
      'Vytvorte si vo svojom shelli alias, aby ste mohli používať mac7z ako bežný príkaz v Terminali:';

  @override
  String get consoleSetupOutroMac =>
      'Pridajte tento riadok do ~/.zshrc alebo ~/.bash_profile, aby zostal trvalý. Po nastavení budú všetky štandardné príkazy 7zip fungovať nahradením 7zz za mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Pridajte tento riadok do ~/.bashrc alebo ~/.zshrc, aby zostal trvalý. Po nastavení budú všetky štandardné príkazy 7zip fungovať nahradením 7zz za mac7z.';

  @override
  String get consoleCmdList => 'Zobraziť obsah archívu';

  @override
  String get consoleCmdExtractFull => 'Extrahovať s úplnými cestami';

  @override
  String get consoleCmdExtractToDir => 'Extrahovať do konkrétneho priečinka';

  @override
  String get consoleCmdExtractFlat => 'Extrahovať bez podpriečinkov';

  @override
  String get consoleCmdCreateUpdate => 'Vytvoriť alebo aktualizovať archív';

  @override
  String get consoleCmdCreateZip => 'Vytvoriť ZIP archív';

  @override
  String get consoleCmdTest => 'Otestovať integritu archívu';

  @override
  String get consoleCmdDelete => 'Odstrániť súbor z archívu';

  @override
  String get consoleCmdInfo => 'Zobraziť informácie o 7zip';

  @override
  String get consoleOptPassword => 'Chrániť archív heslom';

  @override
  String get consoleOptEncryptHeaders => 'Šifrovať aj názvy súborov (len 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Úroveň kompresie (0 = žiadna, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Povoliť viacvláknovú kompresiu';

  @override
  String get consoleOptSplitVolumes =>
      'Rozdeliť do zväzkov (napr. -v100m pre 100 MB)';

  @override
  String get consoleOptRecursive => 'Rekurzívne spracovať podpriečinky';

  @override
  String get consoleOptYesAll => 'Odpovedať „áno“ na všetky potvrdenia';

  @override
  String get consoleOptOutputDir => 'Cieľový priečinok pre extrakciu';

  @override
  String get consoleOptExclude => 'Vylúčiť súbory (napr. -x!*.log)';

  @override
  String get consoleExEncrypted => 'Šifrovaný archív so skrytými názvami';

  @override
  String get consoleExVolumes => 'Archív rozdelený na zväzky po 50 MB';

  @override
  String get consoleExUltra => 'Ultra kompresia (pomalá, najmenší súbor)';

  @override
  String get consoleExSingleFile => 'Extrahovať jeden súbor';

  @override
  String get consoleExTechnical => 'Zobraziť s technickými detailmi';

  @override
  String get consoleCopy => 'Kopírovať';

  @override
  String get consoleCopied => 'Skopírované!';

  @override
  String get consoleInfoNote =>
      'mac7z obsahuje vlastný binárny súbor 7zz. Argumenty sa odovzdávajú presne tak, ako sú, bez úprav. Každý príkaz platný pre 7zz funguje rovnako aj s mac7z.';

  @override
  String get updateAvailableTitle => 'Dostupná aktualizácia';

  @override
  String updateAvailableMessage(String version) {
    return 'Verzia $version je dostupná. Chcete ju teraz nainštalovať?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Aktuálna verzia: $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Nová verzia: $version';
  }

  @override
  String updateFile(String name) {
    return 'Súbor: $name';
  }

  @override
  String updateSize(String size) {
    return 'Veľkosť: $size';
  }

  @override
  String get updateInstall => 'Inštalovať';

  @override
  String get updateLater => 'Neskôr';

  @override
  String get updateSkipVersion => 'Preskočiť túto verziu';

  @override
  String get updateDownloading => 'Sťahovanie...';

  @override
  String updateDownloadingAsset(String name) {
    return 'Sťahovanie $name...';
  }

  @override
  String get updateOpeningInstaller => 'Otvára sa inštalátor...';

  @override
  String get updateNoCompatibleAsset =>
      'V tomto vydaní sa nenašiel kompatibilný súbor.';
}
