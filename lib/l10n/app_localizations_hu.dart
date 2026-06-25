// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get dropZoneDrop => 'Húzza ide az archívumot';

  @override
  String get dropZoneRelease => 'Engedje el a megnyitáshoz';

  @override
  String get dropZoneSubtitle =>
      'vagy kattintson a kiválasztáshoz\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fájl',
      one: '$count fájl',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Védett archívum';

  @override
  String get passwordDialogSubtitle => 'Adja meg a jelszót';

  @override
  String get passwordDialogHint => 'Jelszó…';

  @override
  String get cancel => 'Mégse';

  @override
  String get confirm => 'Megerősítés';

  @override
  String get logPanelTitle => 'Napló';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bejegyzés',
      one: '$count bejegyzés',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Nincs tevékenység';

  @override
  String get progressExtracting => 'Kicsomagolás…';

  @override
  String get progressDone => 'Kicsomagolás befejezve!';

  @override
  String get treeLoading => 'Archívum olvasása…';

  @override
  String get treeError => 'Hiba';

  @override
  String get treeEmpty => 'Nincs archívum betöltve';

  @override
  String get treeEmptyHint => 'Húzza ide a fájlt a tartalmának megtekintéséhez';

  @override
  String get treeSearch => 'Keresés…';

  @override
  String get treeColName => 'Név';

  @override
  String get treeColSize => 'Méret';

  @override
  String get treeColModified => 'Módosítva';

  @override
  String get treeOpenTooltip => 'Dupla kattintás a megnyitáshoz';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elem',
      one: '$count elem',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Cél';

  @override
  String get sectionSecurity => 'Biztonság';

  @override
  String get destinationSameFolder => 'Az archívummal azonos mappában';

  @override
  String get subfolderCreate => 'Kicsomagolás alkönyvtárba';

  @override
  String get subfolderDefault => 'az archívum nevéről';

  @override
  String get passwordNone => 'Nincs jelszó';

  @override
  String get passwordSetLabel => 'Jelszó beállítva';

  @override
  String get passwordEdit => 'Szerkesztés';

  @override
  String get passwordDefine => 'Beállítás';

  @override
  String get btnExtract => 'Kicsomagolás';

  @override
  String get btnExtracting => 'Kicsomagolás...';

  @override
  String get btnDone => 'Kész ✓';

  @override
  String get btnReset => 'Alaphelyzetbe';

  @override
  String binaryWarning(String cmd) {
    return '7zip nem található. Telepítse: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Archívum megnyitása';

  @override
  String get pickOutputDialogTitle => 'Válassza ki a célmappát';

  @override
  String logBinaryFound(String path) {
    return '7zip megtalálva: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip nem található. Telepítse a Homebrew (macOS) vagy a 7-zip.org (Windows) segítségével.';

  @override
  String get logNoArchiveRecognized =>
      'Nincs felismert archívum az ejtett fájlok között.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Nem támogatott formátum: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Archívum olvasása: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bejegyzés található az archívumban.',
      one: '1 bejegyzés található az archívumban.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Titkosított archívum — jelszó szükséges.';

  @override
  String get logFilePasswordRequired => 'Titkosított fájl — jelszó szükséges.';

  @override
  String get logPasswordDefined => 'Jelszó beállítva.';

  @override
  String get logCancelled => 'Visszavonva.';

  @override
  String logDestination(String path) {
    return 'Cél: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Kicsomagolás erre: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Kicsomagolás befejeződött itt: $path';
  }

  @override
  String get logReset => 'Alaphelyzetbe állítva.';

  @override
  String logOpening(String name) {
    return '$name megnyitása…';
  }

  @override
  String logOpened(String name) {
    return 'Megnyitva: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Hiba a megnyitásakor: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Kicsomagolási hiba: $error';
  }

  @override
  String logError(String error) {
    return 'Hiba: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Hiányos felosztott archívum — hiányzó részek. Nem lehet megjeleníteni a tartalmat.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Hiányos felosztott archívum — hiányzó részek. A megjelenített tartalom lehet hiányos.';

  @override
  String get logExtractionSplitError =>
      'A kicsomagolás sikertelen: hiányzó részek.';

  @override
  String get errorSplitArchive =>
      '⚠️ Hiányos felosztott archívum — győződjön meg róla, hogy az összes rész ugyanabban a mappában van.';

  @override
  String get tabDecompression => 'Kicsomagolás';

  @override
  String get tabCompression => 'Tömörítés';

  @override
  String get tabConsoleApi => 'Konzol API';

  @override
  String get tabComingSoon => 'Hamarosan';

  @override
  String get compLabelArchiveName => 'Archívum neve';

  @override
  String get compLabelDestination => 'Cél';

  @override
  String get compLabelFormat => 'Formátum';

  @override
  String get compLabelCompression => 'Tömörítési szint';

  @override
  String get compLabelSecurity => 'Biztonság';

  @override
  String get compLabelAdvanced => 'Speciális beállítások';

  @override
  String get compLabelSplit => 'Felosztás';

  @override
  String get compSizeFolder => 'mappa';

  @override
  String get compDestSameFolder => 'A fájlokkal azonos mappa';

  @override
  String compLevelNotApplicable(String format) {
    return 'Nem alkalmazható .$format fájlokra';
  }

  @override
  String get compHeaderEncryption => 'Fejléc titkosítás engedélyezve';

  @override
  String get compSplitNone => 'Nincs';

  @override
  String get compBtnCompress => 'Tömörítés';

  @override
  String get compBtnCompressing => 'Tömörítés…';

  @override
  String get compAddFiles => 'Fájlok hozzáadása';

  @override
  String get compAddFolder => 'Mappa hozzáadása';

  @override
  String get compDropToAdd => 'Húzza a hozzáadáshoz';

  @override
  String get compDropHint => 'Húzzon ide fájlokat vagy mappákat';

  @override
  String get compDropSubtitle => 'A fájlok hozzáadódnak az archívumhoz';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elem',
      one: '1 elem',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Tömörítés → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archívum létrehozva: $path';
  }

  @override
  String get consoleSectionConfig => 'BEÁLLÍTÁS';

  @override
  String get consoleSectionCommands => 'FŐ PARANCSOK';

  @override
  String get consoleSectionOptions => 'GYAKORI OPCIÓK';

  @override
  String get consoleSectionExamples => 'HALADÓ PÉLDÁK';

  @override
  String get consoleHeroSubtitle =>
      'A mac7z minden argumentumot közvetlenül a beépített 7zip binárisnak ad át. Használja a Terminálból pontosan úgy, ahogy a 7zz-t használná.';

  @override
  String get consoleSetupIntro =>
      'Hozzon létre egy aliast a shelljében, hogy a mac7z-t normál parancsként használhassa a Terminálban:';

  @override
  String get consoleSetupOutroMac =>
      'Adja hozzá ezt a sort a ~/.zshrc vagy ~/.bash_profile fájlhoz, hogy állandó maradjon. Beállítás után az összes szokásos 7zip parancs működik, ha a 7zz helyett a mac7z-t használja.';

  @override
  String get consoleSetupOutroLinux =>
      'Adja hozzá ezt a sort a ~/.bashrc vagy ~/.zshrc fájlhoz, hogy állandó maradjon. Beállítás után az összes szokásos 7zip parancs működik, ha a 7zz helyett a mac7z-t használja.';

  @override
  String get consoleCmdList => 'Archívum tartalmának listázása';

  @override
  String get consoleCmdExtractFull => 'Kibontás teljes elérési útvonalakkal';

  @override
  String get consoleCmdExtractToDir => 'Kibontás egy megadott mappába';

  @override
  String get consoleCmdExtractFlat => 'Kibontás almappák nélkül';

  @override
  String get consoleCmdCreateUpdate => 'Archívum létrehozása vagy frissítése';

  @override
  String get consoleCmdCreateZip => 'ZIP archívum létrehozása';

  @override
  String get consoleCmdTest => 'Az archívum épségének ellenőrzése';

  @override
  String get consoleCmdDelete => 'Fájl törlése az archívumból';

  @override
  String get consoleCmdInfo => 'Információk megjelenítése a 7zipről';

  @override
  String get consoleOptPassword => 'Az archívum védelme jelszóval';

  @override
  String get consoleOptEncryptHeaders => 'A fájlnevek titkosítása is (csak 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Tömörítési szint (0 = nincs, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Többszálú tömörítés engedélyezése';

  @override
  String get consoleOptSplitVolumes =>
      'Felosztás kötetekre (pl. -v100m = 100 MB)';

  @override
  String get consoleOptRecursive => 'Almappák rekurzív feldolgozása';

  @override
  String get consoleOptYesAll => 'Minden megerősítésre „igen” válasz';

  @override
  String get consoleOptOutputDir => 'Kimeneti mappa a kibontáshoz';

  @override
  String get consoleOptExclude => 'Fájlok kizárása (pl. -x!*.log)';

  @override
  String get consoleExEncrypted => 'Titkosított archívum rejtett nevekkel';

  @override
  String get consoleExVolumes => '50 MB-os kötetekre bontott archívum';

  @override
  String get consoleExUltra => 'Ultra tömörítés (lassú, legkisebb fájl)';

  @override
  String get consoleExSingleFile => 'Egyetlen fájl kibontása';

  @override
  String get consoleExTechnical => 'Listázás technikai részletekkel';

  @override
  String get consoleCopy => 'Másolás';

  @override
  String get consoleCopied => 'Másolva!';

  @override
  String get consoleInfoNote =>
      'A mac7z saját 7zz binárissal érkezik. Az argumentumok módosítás nélkül, pontosan úgy kerülnek továbbításra, ahogy meg vannak adva. Minden, a 7zz-hez érvényes parancs ugyanúgy működik a mac7z-zel is.';
}
