// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get dropZoneDrop => 'Пуснете архив';

  @override
  String get dropZoneRelease => 'Отпуснете, за да отворите';

  @override
  String get dropZoneSubtitle =>
      'или щракнете, за да изберете\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Защитен архив';

  @override
  String get passwordDialogSubtitle => 'Въведете паролата';

  @override
  String get passwordDialogHint => 'Парола…';

  @override
  String get cancel => 'Отмяна';

  @override
  String get confirm => 'Потвърждаване';

  @override
  String get logPanelTitle => 'Дневник';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записа',
      one: '$count запис',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Без активност';

  @override
  String get progressExtracting => 'Разархивиране…';

  @override
  String get progressDone => 'Разархивиране завършено!';

  @override
  String get treeLoading => 'Четене на архив…';

  @override
  String get treeError => 'Грешка';

  @override
  String get treeEmpty => 'Няма заредени архиви';

  @override
  String get treeEmptyHint => 'Пуснете файл, за да видите съдържанието му';

  @override
  String get treeSearch => 'Търсене…';

  @override
  String get treeColName => 'Име';

  @override
  String get treeColSize => 'Размер';

  @override
  String get treeColModified => 'Изменено';

  @override
  String get treeOpenTooltip => 'Двойно щракване, за да отворите';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count елемента',
      one: '$count елемент',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Дестинация';

  @override
  String get sectionSecurity => 'Безопасност';

  @override
  String get destinationSameFolder => 'Същата папка като архива';

  @override
  String get subfolderCreate => 'Разархивиране в подпапка';

  @override
  String get subfolderDefault => 'наименувана по архива';

  @override
  String get passwordNone => 'Без парола';

  @override
  String get passwordSetLabel => 'Парола установена';

  @override
  String get passwordEdit => 'Редактиране';

  @override
  String get passwordDefine => 'Задаване';

  @override
  String get btnExtract => 'Разархивиране';

  @override
  String get btnExtracting => 'Разархивиране...';

  @override
  String get btnDone => 'Готово ✓';

  @override
  String get btnReset => 'Нулиране';

  @override
  String binaryWarning(String cmd) {
    return '7zip не е намерен. Инсталирайте го: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Отворете архив';

  @override
  String get pickOutputDialogTitle => 'Изберете целева папка';

  @override
  String logBinaryFound(String path) {
    return '7zip намерен: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip не е намерен. Инсталирайте чрез Homebrew (macOS) или 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Няма разпознат архив в пуснатите файлове.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Неподдържан формат: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Четене на архив: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записа намерени в архива.',
      one: '1 запис намерен в архива.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Криптиран архив — требуется парола.';

  @override
  String get logFilePasswordRequired => 'Криптиран файл — требуется парола.';

  @override
  String get logPasswordDefined => 'Парола установена.';

  @override
  String get logCancelled => 'Отменено.';

  @override
  String logDestination(String path) {
    return 'Дестинация: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Разархивиране на: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Разархивиране завършено на: $path';
  }

  @override
  String get logReset => 'Нулирано.';

  @override
  String logOpening(String name) {
    return 'Отваряне на $name…';
  }

  @override
  String logOpened(String name) {
    return 'Отворено: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Грешка при отваряне: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Грешка при разархивиране: $error';
  }

  @override
  String logError(String error) {
    return 'Грешка: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Непълен разделен архив — липсващи части. Не може да се покаже съдържанието.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Непълен разделен архив — липсващи части. Показаното съдържание може да е непълно.';

  @override
  String get logExtractionSplitError =>
      'Разархивиране неуспешно: липсващи части.';

  @override
  String get errorSplitArchive =>
      '⚠️ Непълен разделен архив — уверете се, че всички части са в същата папка.';

  @override
  String get tabDecompression => 'Декомпресия';

  @override
  String get tabCompression => 'Компресия';

  @override
  String get tabConsoleApi => 'Конзола API';

  @override
  String get tabComingSoon => 'Скоро';

  @override
  String get compLabelArchiveName => 'Име на архива';

  @override
  String get compLabelDestination => 'Дестинация';

  @override
  String get compLabelFormat => 'Формат';

  @override
  String get compLabelCompression => 'Ниво на компресия';

  @override
  String get compLabelSecurity => 'Безопасност';

  @override
  String get compLabelAdvanced => 'Разширени опции';

  @override
  String get compLabelSplit => 'Разделяне';

  @override
  String get compSizeFolder => 'папка';

  @override
  String get compDestSameFolder => 'Същата папка като файловете';

  @override
  String compLevelNotApplicable(String format) {
    return 'Неприложимо за .$format';
  }

  @override
  String get compHeaderEncryption => 'Криптиране на заглавката активирано';

  @override
  String get compSplitNone => 'Никой';

  @override
  String get compBtnCompress => 'Компресирай';

  @override
  String get compBtnCompressing => 'Компресиране…';

  @override
  String get compAddFiles => 'Добавяне на файлове';

  @override
  String get compAddFolder => 'Добавяне на папка';

  @override
  String get compDropToAdd => 'Пуснете, за да добавите';

  @override
  String get compDropHint => 'Пуснете файлове или папки тук';

  @override
  String get compDropSubtitle => 'Файловете ще бъдат добавени към архива';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count елемента',
      one: '1 елемент',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Компресиране → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Архив създаден: $path';
  }
}
