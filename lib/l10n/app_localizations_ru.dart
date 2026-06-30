// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get dropZoneDrop => 'Перетащите архив';

  @override
  String get dropZoneRelease => 'Отпустите, чтобы открыть';

  @override
  String get dropZoneSubtitle =>
      'или нажмите, чтобы выбрать\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count файла',
      many: '$count файлов',
      few: '$count файла',
      one: '$count файл',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Защищённый архив';

  @override
  String get passwordDialogSubtitle => 'Введите пароль';

  @override
  String get passwordDialogHint => 'Пароль…';

  @override
  String get cancel => 'Отмена';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get logPanelTitle => 'Журнал';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записи',
      many: '$count записей',
      few: '$count записи',
      one: '$count запись',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Нет активности';

  @override
  String get progressExtracting => 'Распаковка…';

  @override
  String get progressDone => 'Распаковка завершена!';

  @override
  String get treeLoading => 'Чтение архива…';

  @override
  String get treeError => 'Ошибка';

  @override
  String get treeEmpty => 'Архив не загружен';

  @override
  String get treeEmptyHint => 'Перетащите файл, чтобы увидеть его содержимое';

  @override
  String get treeSearch => 'Поиск…';

  @override
  String get treeColName => 'Имя';

  @override
  String get treeColSize => 'Размер';

  @override
  String get treeColModified => 'Изменено';

  @override
  String get treeOpenTooltip => 'Дважды щелкните, чтобы открыть';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '$count элемент',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Назначение';

  @override
  String get sectionSecurity => 'Безопасность';

  @override
  String get destinationSameFolder => 'В папку архива';

  @override
  String get subfolderCreate => 'Распаковать в подпапку';

  @override
  String get subfolderDefault => 'с именем архива';

  @override
  String get passwordNone => 'Без пароля';

  @override
  String get passwordSetLabel => 'Пароль установлен';

  @override
  String get passwordEdit => 'Изменить';

  @override
  String get passwordDefine => 'Установить';

  @override
  String get btnExtract => 'Распаковать';

  @override
  String get btnExtracting => 'Распаковка...';

  @override
  String get btnDone => 'Готово ✓';

  @override
  String get btnReset => 'Сброс';

  @override
  String binaryWarning(String cmd) {
    return '7zip не найден. Установите его: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Открыть архив';

  @override
  String get pickOutputDialogTitle => 'Выберите папку назначения';

  @override
  String logBinaryFound(String path) {
    return '7zip найден: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip не найден. Установите через Homebrew (macOS) или 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Не найдено распознанных архивов в перетащенных файлах.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Неподдерживаемый формат: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Чтение архива: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'В архиве найдена $count запись.',
      many: 'В архиве найдено $count записей.',
      few: 'В архиве найдено $count записи.',
      one: 'В архиве найдена 1 запись.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Зашифрованный архив — требуется пароль.';

  @override
  String get logFilePasswordRequired =>
      'Зашифрованный файл — требуется пароль.';

  @override
  String get logPasswordDefined => 'Пароль установлен.';

  @override
  String get logCancelled => 'Отменено.';

  @override
  String logDestination(String path) {
    return 'Назначение: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Распаковка в: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Распаковка завершена в: $path';
  }

  @override
  String get logReset => 'Сброс.';

  @override
  String logOpening(String name) {
    return 'Открытие $name…';
  }

  @override
  String logOpened(String name) {
    return 'Открыто: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Ошибка при открытии: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Ошибка распаковки: $error';
  }

  @override
  String logError(String error) {
    return 'Ошибка: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Неполный разделённый архив — отсутствуют части. Не удаётся отобразить содержимое.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Неполный разделённый архив — отсутствуют части. Отображаемое содержимое может быть неполным.';

  @override
  String get logExtractionSplitError =>
      'Распаковка не удалась: отсутствуют части.';

  @override
  String get errorSplitArchive =>
      '⚠️ Неполный разделённый архив — убедитесь, что все части находятся в одной папке.';

  @override
  String get tabDecompression => 'Распаковка';

  @override
  String get tabCompression => 'Упаковка';

  @override
  String get tabConsoleApi => 'Консоль API';

  @override
  String get tabComingSoon => 'Скоро';

  @override
  String get compLabelArchiveName => 'Имя архива';

  @override
  String get compLabelDestination => 'Назначение';

  @override
  String get compLabelFormat => 'Формат';

  @override
  String get compLabelCompression => 'Уровень сжатия';

  @override
  String get compLabelSecurity => 'Безопасность';

  @override
  String get compLabelAdvanced => 'Дополнительные параметры';

  @override
  String get compLabelSplit => 'Разделить';

  @override
  String get compSizeFolder => 'папка';

  @override
  String get compDestSameFolder => 'В папку файлов';

  @override
  String compLevelNotApplicable(String format) {
    return 'Недоступно для .$format';
  }

  @override
  String get compHeaderEncryption => 'Шифрование заголовка включено';

  @override
  String get compSplitNone => 'Нет';

  @override
  String get compBtnCompress => 'Сжать';

  @override
  String get compBtnCompressing => 'Сжатие…';

  @override
  String get compAddFiles => 'Добавить файлы';

  @override
  String get compAddFolder => 'Добавить папку';

  @override
  String get compDropToAdd => 'Перетащите для добавления';

  @override
  String get compDropHint => 'Перетащите файлы или папки сюда';

  @override
  String get compDropSubtitle => 'Файлы будут добавлены в архив';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count элемента',
      many: '$count элементов',
      few: '$count элемента',
      one: '1 элемент',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Сжатие → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Архив создан: $path';
  }

  @override
  String get consoleSectionConfig => 'НАСТРОЙКА';

  @override
  String get consoleSectionCommands => 'ОСНОВНЫЕ КОМАНДЫ';

  @override
  String get consoleSectionOptions => 'ЧАСТЫЕ ПАРАМЕТРЫ';

  @override
  String get consoleSectionExamples => 'РАСШИРЕННЫЕ ПРИМЕРЫ';

  @override
  String get consoleHeroSubtitle =>
      'mac7z передаёт все аргументы напрямую встроенному двоичному файлу 7zip. Используйте его в Terminal точно так же, как вы использовали бы 7zz.';

  @override
  String get consoleSetupIntro =>
      'Создайте alias в своей оболочке, чтобы использовать mac7z как обычную команду в Terminal:';

  @override
  String get consoleSetupOutroMac =>
      'Добавьте эту строку в ~/.zshrc или ~/.bash_profile, чтобы сделать её постоянной. После настройки все стандартные команды 7zip будут работать, если заменить 7zz на mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Добавьте эту строку в ~/.bashrc или ~/.zshrc, чтобы сделать её постоянной. После настройки все стандартные команды 7zip будут работать, если заменить 7zz на mac7z.';

  @override
  String get consoleCmdList => 'Показать содержимое архива';

  @override
  String get consoleCmdExtractFull => 'Извлечь с полными путями';

  @override
  String get consoleCmdExtractToDir => 'Извлечь в указанную папку';

  @override
  String get consoleCmdExtractFlat => 'Извлечь без подпапок';

  @override
  String get consoleCmdCreateUpdate => 'Создать или обновить архив';

  @override
  String get consoleCmdCreateZip => 'Создать ZIP-архив';

  @override
  String get consoleCmdTest => 'Проверить целостность архива';

  @override
  String get consoleCmdDelete => 'Удалить файл из архива';

  @override
  String get consoleCmdInfo => 'Показать информацию о 7zip';

  @override
  String get consoleOptPassword => 'Защитить архив паролем';

  @override
  String get consoleOptEncryptHeaders =>
      'Шифровать также имена файлов (только 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Уровень сжатия (0 = нет, 9 = ультра)';

  @override
  String get consoleOptMultithread => 'Включить многопоточное сжатие';

  @override
  String get consoleOptSplitVolumes =>
      'Разбить на тома (например, -v100m для 100 МБ)';

  @override
  String get consoleOptRecursive => 'Рекурсивно обрабатывать подпапки';

  @override
  String get consoleOptYesAll => 'Отвечать «да» на все подтверждения';

  @override
  String get consoleOptOutputDir => 'Папка назначения для извлечения';

  @override
  String get consoleOptExclude => 'Исключить файлы (например, -x!*.log)';

  @override
  String get consoleExEncrypted => 'Зашифрованный архив со скрытыми именами';

  @override
  String get consoleExVolumes => 'Архив, разделённый на тома по 50 МБ';

  @override
  String get consoleExUltra => 'Ультра-сжатие (медленно, минимальный размер)';

  @override
  String get consoleExSingleFile => 'Извлечь один файл';

  @override
  String get consoleExTechnical => 'Показать с техническими подробностями';

  @override
  String get consoleCopy => 'Копировать';

  @override
  String get consoleCopied => 'Скопировано!';

  @override
  String get consoleInfoNote =>
      'mac7z включает собственный двоичный файл 7zz. Аргументы передаются без изменений, точно как есть. Любая команда, допустимая для 7zz, работает точно так же и с mac7z.';

  @override
  String get updateAvailableTitle => 'Доступно обновление';

  @override
  String updateAvailableMessage(String version) {
    return 'Доступна версия $version. Установить её сейчас?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Текущая версия: $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Новая версия: $version';
  }

  @override
  String updateFile(String name) {
    return 'Файл: $name';
  }

  @override
  String updateSize(String size) {
    return 'Размер: $size';
  }

  @override
  String get updateInstall => 'Установить';

  @override
  String get updateLater => 'Позже';

  @override
  String get updateSkipVersion => 'Пропустить эту версию';

  @override
  String get updateDownloading => 'Загрузка...';

  @override
  String updateDownloadingAsset(String name) {
    return 'Загрузка $name...';
  }

  @override
  String get updateOpeningInstaller => 'Открытие установщика...';

  @override
  String get updateNoCompatibleAsset =>
      'В этом релизе не найден совместимый файл.';
}
