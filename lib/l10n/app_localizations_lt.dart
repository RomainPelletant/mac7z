// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get dropZoneDrop => 'Paleiskite archyvą';

  @override
  String get dropZoneRelease => 'Atlaisvinkite, kad atidaryti';

  @override
  String get dropZoneSubtitle =>
      'arba spustelėkite, kad pasirinkti\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count failo',
      many: '$count failų',
      few: '$count failai',
      one: '$count failas',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Apsaugota archyva';

  @override
  String get passwordDialogSubtitle => 'Įveskite slaptažodį';

  @override
  String get passwordDialogHint => 'Slaptažodis…';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get confirm => 'Patvirtinti';

  @override
  String get logPanelTitle => 'Žurnalas';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašo',
      many: '$count įrašų',
      few: '$count įrašai',
      one: '$count įrašas',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Nėra veiklos';

  @override
  String get progressExtracting => 'Išpakuojama…';

  @override
  String get progressDone => 'Išpakavimas baigtas!';

  @override
  String get treeLoading => 'Skaitoma archyva…';

  @override
  String get treeError => 'Klaida';

  @override
  String get treeEmpty => 'Nėra įkeltos archyvos';

  @override
  String get treeEmptyHint => 'Paleiskite failą, norint matyti jo turinį';

  @override
  String get treeSearch => 'Paieška…';

  @override
  String get treeColName => 'Vardas';

  @override
  String get treeColSize => 'Dydis';

  @override
  String get treeColModified => 'Pakeista';

  @override
  String get treeOpenTooltip => 'Dvigubai spustelėkite, norint atidaryti';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elemento',
      many: '$count elementų',
      few: '$count elementai',
      one: '$count elementas',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Vieta';

  @override
  String get sectionSecurity => 'Saugumas';

  @override
  String get destinationSameFolder => 'Tame pačiame aplanke kaip archyva';

  @override
  String get subfolderCreate => 'Išpakuoti į potlanką';

  @override
  String get subfolderDefault => 'pavadintą pagal archyvą';

  @override
  String get passwordNone => 'Be slaptažodžio';

  @override
  String get passwordSetLabel => 'Slaptažodis nustatytas';

  @override
  String get passwordEdit => 'Redaguoti';

  @override
  String get passwordDefine => 'Nustatyti';

  @override
  String get btnExtract => 'Išpakuoti';

  @override
  String get btnExtracting => 'Išpakuojama...';

  @override
  String get btnDone => 'Padaryta ✓';

  @override
  String get btnReset => 'Iš naujo nustatyti';

  @override
  String binaryWarning(String cmd) {
    return '7zip nerastas. Įdiekite: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Atidaryti archyvą';

  @override
  String get pickOutputDialogTitle => 'Pasirinkite paskirties aplanką';

  @override
  String logBinaryFound(String path) {
    return '7zip rastas: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip nerastas. Įdiekite naudodami Homebrew (macOS) arba 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Nėra atpažintų archyvų paleistuose failuose.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Nepalaikomas formatas: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Skaitoma archyva: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count įrašo rastas archyvoje.',
      many: '$count įrašų rastas archyvoje.',
      few: '$count įrašai rasti archyvoje.',
      one: '1 įrašas rastas archyvoje.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Šifrota archyva — slaptažodis būtinas.';

  @override
  String get logFilePasswordRequired =>
      'Šifruotas failas — slaptažodis būtinas.';

  @override
  String get logPasswordDefined => 'Slaptažodis nustatytas.';

  @override
  String get logCancelled => 'Atšaukta.';

  @override
  String logDestination(String path) {
    return 'Vieta: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Išpakuojama į: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Išpakavimas baigtas: $path';
  }

  @override
  String get logReset => 'Iš naujo nustatytas.';

  @override
  String logOpening(String name) {
    return 'Atidaromi $name…';
  }

  @override
  String logOpened(String name) {
    return 'Atidarytas: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Klaida atidarant: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Išpakavimo klaida: $error';
  }

  @override
  String logError(String error) {
    return 'Klaida: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Nebaigta padalyta archyva — trūksta dalių. Negalima rodyti turinio.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Nebaigta padalyta archyva — trūksta dalių. Rodomas turinys gali būti nepilnas.';

  @override
  String get logExtractionSplitError => 'Išpakavimas nepavyko: trūksta dalių.';

  @override
  String get errorSplitArchive =>
      '⚠️ Nebaigta padalyta archyva — įsitikinkite, kad visos dalys yra tame pačiame aplanke.';

  @override
  String get tabDecompression => 'Išpakavimas';

  @override
  String get tabCompression => 'Pakavimas';

  @override
  String get tabConsoleApi => 'Konsolė API';

  @override
  String get tabComingSoon => 'Netrukus';

  @override
  String get compLabelArchiveName => 'Archyvo pavadinimas';

  @override
  String get compLabelDestination => 'Vieta';

  @override
  String get compLabelFormat => 'Formatas';

  @override
  String get compLabelCompression => 'Glaudinimo lygis';

  @override
  String get compLabelSecurity => 'Saugumas';

  @override
  String get compLabelSplit => 'Skaidyti';

  @override
  String get compSizeFolder => 'aplankas';

  @override
  String get compDestSameFolder => 'Tas pats aplankas kaip failai';

  @override
  String compLevelNotApplicable(String format) {
    return 'Netaikytina .$format';
  }

  @override
  String get compHeaderEncryption => 'Antraštės šifravimas įjungtas';

  @override
  String get compSplitNone => 'Nė vienas';

  @override
  String get compBtnCompress => 'Pakuoti';

  @override
  String get compBtnCompressing => 'Pakaviimas…';

  @override
  String get compAddFiles => 'Pridėti failus';

  @override
  String get compAddFolder => 'Pridėti aplanką';

  @override
  String get compDropToAdd => 'Vilkite, norėdami pridėti';

  @override
  String get compDropHint => 'Vilkite failus arba aplankus čia';

  @override
  String get compDropSubtitle => 'Failai bus pridėti prie archyvo';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elemento',
      many: '$count elementų',
      few: '$count elementai',
      one: '1 elementas',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Pakaviimas → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archyvas sukurtas: $path';
  }
}
