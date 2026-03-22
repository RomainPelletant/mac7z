// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get dropZoneDrop => '放置存档';

  @override
  String get dropZoneRelease => '释放以打开';

  @override
  String get dropZoneSubtitle => '或点击选择\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个文件',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => '受保护的存档';

  @override
  String get passwordDialogSubtitle => '输入密码';

  @override
  String get passwordDialogHint => '密码…';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确认';

  @override
  String get logPanelTitle => '日志';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条条目',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => '无活动';

  @override
  String get progressExtracting => '提取中…';

  @override
  String get progressDone => '提取完成!';

  @override
  String get treeLoading => '正在读取存档…';

  @override
  String get treeError => '错误';

  @override
  String get treeEmpty => '未加载存档';

  @override
  String get treeEmptyHint => '放置文件查看其内容';

  @override
  String get treeSearch => '搜索…';

  @override
  String get treeColName => '名称';

  @override
  String get treeColSize => '大小';

  @override
  String get treeColModified => '修改于';

  @override
  String get treeOpenTooltip => '双击打开';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => '目标';

  @override
  String get sectionSecurity => '安全性';

  @override
  String get destinationSameFolder => '与存档相同的文件夹';

  @override
  String get subfolderCreate => '提取到子文件夹';

  @override
  String get subfolderDefault => '以存档名称命名';

  @override
  String get passwordNone => '无密码';

  @override
  String get passwordSetLabel => '已设置密码';

  @override
  String get passwordEdit => '编辑';

  @override
  String get passwordDefine => '设置';

  @override
  String get btnExtract => '提取';

  @override
  String get btnExtracting => '提取中...';

  @override
  String get btnDone => '完成 ✓';

  @override
  String get btnReset => '重置';

  @override
  String binaryWarning(String cmd) {
    return '未找到 7zip。安装: $cmd';
  }

  @override
  String get pickFileDialogTitle => '打开存档';

  @override
  String get pickOutputDialogTitle => '选择目标文件夹';

  @override
  String logBinaryFound(String path) {
    return '找到 7zip: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 未找到 7zip。通过 Homebrew (macOS) 或 7-zip.org (Windows) 安装。';

  @override
  String get logNoArchiveRecognized => '放置的文件中未识别到任何存档。';

  @override
  String logUnsupportedFormat(String name) {
    return '不支持的格式: $name';
  }

  @override
  String logReadingArchive(String name) {
    return '正在读取存档: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '存档中找到 $count 个条目。',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => '加密存档 — 需要密码。';

  @override
  String get logFilePasswordRequired => '加密文件 — 需要密码。';

  @override
  String get logPasswordDefined => '密码已设置。';

  @override
  String get logCancelled => '已取消。';

  @override
  String logDestination(String path) {
    return '目标: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return '提取到: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ 提取完成: $path';
  }

  @override
  String get logReset => '已重置。';

  @override
  String logOpening(String name) {
    return '打开 $name…';
  }

  @override
  String logOpened(String name) {
    return '已打开: $name';
  }

  @override
  String logOpenError(String error) {
    return '打开错误: $error';
  }

  @override
  String logExtractionError(String error) {
    return '提取错误: $error';
  }

  @override
  String logError(String error) {
    return '错误: $error';
  }

  @override
  String get logSplitIncompleteEmpty => '⚠️ 不完整的分割存档 — 缺少部分。无法显示内容。';

  @override
  String get logSplitIncompletePartial => '⚠️ 不完整的分割存档 — 缺少部分。显示的内容可能不完整。';

  @override
  String get logExtractionSplitError => '提取失败: 缺少部分。';

  @override
  String get errorSplitArchive => '⚠️ 不完整的分割存档 — 确保所有部分都在同一文件夹中。';

  @override
  String get tabDecompression => '解压';

  @override
  String get tabCompression => '压缩';

  @override
  String get tabConsoleApi => '控制台 API';

  @override
  String get tabComingSoon => '即将推出';

  @override
  String get compLabelArchiveName => '存档名称';

  @override
  String get compLabelDestination => '目标';

  @override
  String get compLabelFormat => '格式';

  @override
  String get compLabelCompression => '压缩级别';

  @override
  String get compLabelSecurity => '安全性';

  @override
  String get compLabelAdvanced => '高级选项';

  @override
  String get compLabelSplit => '分割';

  @override
  String get compSizeFolder => '文件夹';

  @override
  String get compDestSameFolder => '与文件相同的文件夹';

  @override
  String compLevelNotApplicable(String format) {
    return '不适用于 .$format';
  }

  @override
  String get compHeaderEncryption => '标头加密已启用';

  @override
  String get compSplitNone => '无';

  @override
  String get compBtnCompress => '压缩';

  @override
  String get compBtnCompressing => '压缩中…';

  @override
  String get compAddFiles => '添加文件';

  @override
  String get compAddFolder => '添加文件夹';

  @override
  String get compDropToAdd => '拖放以添加';

  @override
  String get compDropHint => '在此放置文件或文件夹';

  @override
  String get compDropSubtitle => '文件将添加到存档中';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 项',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return '压缩中 → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ 存档已创建: $path';
  }
}
