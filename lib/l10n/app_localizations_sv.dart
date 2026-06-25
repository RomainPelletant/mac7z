// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get dropZoneDrop => 'Släpp ett arkiv';

  @override
  String get dropZoneRelease => 'Släpp för att öppna';

  @override
  String get dropZoneSubtitle =>
      'eller klicka för att välja\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count filer',
      one: '$count fil',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Skyddat arkiv';

  @override
  String get passwordDialogSubtitle => 'Ange lösenordet';

  @override
  String get passwordDialogHint => 'Lösenord…';

  @override
  String get cancel => 'Avbryt';

  @override
  String get confirm => 'Bekräfta';

  @override
  String get logPanelTitle => 'Logg';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poster',
      one: '$count post',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Ingen aktivitet';

  @override
  String get progressExtracting => 'Extraherar…';

  @override
  String get progressDone => 'Extrahering slutförd!';

  @override
  String get treeLoading => 'Läser arkiv…';

  @override
  String get treeError => 'Fel';

  @override
  String get treeEmpty => 'Inget arkiv laddat';

  @override
  String get treeEmptyHint => 'Släpp en fil för att se dess innehål';

  @override
  String get treeSearch => 'Sök…';

  @override
  String get treeColName => 'Namn';

  @override
  String get treeColSize => 'Storlek';

  @override
  String get treeColModified => 'Ändrad';

  @override
  String get treeOpenTooltip => 'Dubbelklicka för att öppna';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objekt',
      one: '$count objekt',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destination';

  @override
  String get sectionSecurity => 'Säkerhet';

  @override
  String get destinationSameFolder => 'Samma mapp som arkivet';

  @override
  String get subfolderCreate => 'Extrahera till en undermapp';

  @override
  String get subfolderDefault => 'namngivet enligt arkivet';

  @override
  String get passwordNone => 'Inget lösenord';

  @override
  String get passwordSetLabel => 'Lösenord inställt';

  @override
  String get passwordEdit => 'Redigera';

  @override
  String get passwordDefine => 'Ange';

  @override
  String get btnExtract => 'Extrahera';

  @override
  String get btnExtracting => 'Extraherar...';

  @override
  String get btnDone => 'Klar ✓';

  @override
  String get btnReset => 'Återställ';

  @override
  String binaryWarning(String cmd) {
    return '7zip inte hittat. Installera det: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Öppna ett arkiv';

  @override
  String get pickOutputDialogTitle => 'Välj målmapp';

  @override
  String logBinaryFound(String path) {
    return '7zip hittat: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip inte hittat. Installera via Homebrew (macOS) eller 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized => 'Inget känt arkiv i de släppta filerna.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Format som inte stöds: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Läser arkiv: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count poster hittade i arkivet.',
      one: '1 post hittad i arkivet.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Krypterat arkiv — lösenord krävs.';

  @override
  String get logFilePasswordRequired => 'Krypterad fil — lösenord krävs.';

  @override
  String get logPasswordDefined => 'Lösenord inställt.';

  @override
  String get logCancelled => 'Avbruten.';

  @override
  String logDestination(String path) {
    return 'Destination: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Extraherar till: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extrahering slutförd i: $path';
  }

  @override
  String get logReset => 'Återställd.';

  @override
  String logOpening(String name) {
    return 'Öppnar $name…';
  }

  @override
  String logOpened(String name) {
    return 'Öppnad: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Fel vid öppning: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Extraheringsfel: $error';
  }

  @override
  String logError(String error) {
    return 'Fel: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Ofullständigt delat arkiv — saknade delar. Kan inte visa innehål.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Ofullständigt delat arkiv — saknade delar. Visas innehål kan vara ofullständigt.';

  @override
  String get logExtractionSplitError =>
      'Extrahering misslyckades: saknade delar.';

  @override
  String get errorSplitArchive =>
      '⚠️ Ofullständigt delat arkiv — se till att alla delar finns i samma mapp.';

  @override
  String get tabDecompression => 'Dekomprimering';

  @override
  String get tabCompression => 'Komprimering';

  @override
  String get tabConsoleApi => 'Konsol-API';

  @override
  String get tabComingSoon => 'Kommer snart';

  @override
  String get compLabelArchiveName => 'Arkivnamn';

  @override
  String get compLabelDestination => 'Destination';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Kompressionsnivå';

  @override
  String get compLabelSecurity => 'Säkerhet';

  @override
  String get compLabelAdvanced => 'Avancerade alternativ';

  @override
  String get compLabelSplit => 'Dela';

  @override
  String get compSizeFolder => 'mapp';

  @override
  String get compDestSameFolder => 'Samma mapp som filerna';

  @override
  String compLevelNotApplicable(String format) {
    return 'Inte tillämpligt för .$format';
  }

  @override
  String get compHeaderEncryption => 'Header-kryptering aktiverad';

  @override
  String get compSplitNone => 'Ingen';

  @override
  String get compBtnCompress => 'Komprimera';

  @override
  String get compBtnCompressing => 'Komprimerar…';

  @override
  String get compAddFiles => 'Lägg till filer';

  @override
  String get compAddFolder => 'Lägg till mapp';

  @override
  String get compDropToAdd => 'Släpp för att lägga till';

  @override
  String get compDropHint => 'Släpp filer eller mappar här';

  @override
  String get compDropSubtitle => 'Filerna läggs till i arkivet';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count objekt',
      one: '1 objekt',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Komprimerar → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arkiv skapat: $path';
  }

  @override
  String get consoleSectionConfig => 'KONFIGURATION';

  @override
  String get consoleSectionCommands => 'HUVUDKOMMANDON';

  @override
  String get consoleSectionOptions => 'VANLIGA ALTERNATIV';

  @override
  String get consoleSectionExamples => 'AVANCERADE EXEMPEL';

  @override
  String get consoleHeroSubtitle =>
      'mac7z skickar alla argument direkt till den inbyggda 7zip-binären. Använd det från Terminal precis som du skulle använda 7zz.';

  @override
  String get consoleSetupIntro =>
      'Skapa ett alias i ditt shell för att använda mac7z som ett vanligt kommando i Terminal:';

  @override
  String get consoleSetupOutroMac =>
      'Lägg till den här raden i ~/.zshrc eller ~/.bash_profile för att göra den permanent. När det är klart fungerar alla vanliga 7zip-kommandon genom att ersätta 7zz med mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Lägg till den här raden i ~/.bashrc eller ~/.zshrc för att göra den permanent. När det är klart fungerar alla vanliga 7zip-kommandon genom att ersätta 7zz med mac7z.';

  @override
  String get consoleCmdList => 'Visa innehållet i ett arkiv';

  @override
  String get consoleCmdExtractFull => 'Extrahera med fullständiga sökvägar';

  @override
  String get consoleCmdExtractToDir => 'Extrahera till en viss mapp';

  @override
  String get consoleCmdExtractFlat => 'Extrahera utan undermappar';

  @override
  String get consoleCmdCreateUpdate => 'Skapa eller uppdatera ett arkiv';

  @override
  String get consoleCmdCreateZip => 'Skapa ett ZIP-arkiv';

  @override
  String get consoleCmdTest => 'Testa arkivets integritet';

  @override
  String get consoleCmdDelete => 'Ta bort en fil från ett arkiv';

  @override
  String get consoleCmdInfo => 'Visa information om 7zip';

  @override
  String get consoleOptPassword => 'Skydda arkivet med ett lösenord';

  @override
  String get consoleOptEncryptHeaders => 'Kryptera även filnamn (endast 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Komprimeringsnivå (0 = ingen, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Aktivera flertrådad komprimering';

  @override
  String get consoleOptSplitVolumes =>
      'Dela upp i volymer (t.ex. -v100m för 100 MB)';

  @override
  String get consoleOptRecursive => 'Bearbeta undermappar rekursivt';

  @override
  String get consoleOptYesAll => 'Svara \"ja\" på alla bekräftelser';

  @override
  String get consoleOptOutputDir => 'Målmapp för extrahering';

  @override
  String get consoleOptExclude => 'Uteslut filer (t.ex. -x!*.log)';

  @override
  String get consoleExEncrypted => 'Krypterat arkiv med dolda namn';

  @override
  String get consoleExVolumes => 'Arkiv uppdelat i volymer på 50 MB';

  @override
  String get consoleExUltra => 'Ultra-komprimering (långsam, minsta fil)';

  @override
  String get consoleExSingleFile => 'Extrahera en enda fil';

  @override
  String get consoleExTechnical => 'Lista med tekniska detaljer';

  @override
  String get consoleCopy => 'Kopiera';

  @override
  String get consoleCopied => 'Kopierat!';

  @override
  String get consoleInfoNote =>
      'mac7z levereras med sin egen 7zz-binär. Argument skickas vidare exakt som de är, utan ändringar. Alla kommandon som är giltiga för 7zz fungerar på samma sätt med mac7z.';
}
