// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get dropZoneDrop => 'アーカイブをドロップ';

  @override
  String get dropZoneRelease => 'ドロップして開く';

  @override
  String get dropZoneSubtitle => 'または選択するにはクリック\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ファイル',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => '保護されたアーカイブ';

  @override
  String get passwordDialogSubtitle => 'パスワードを入力';

  @override
  String get passwordDialogHint => 'パスワード…';

  @override
  String get cancel => 'キャンセル';

  @override
  String get confirm => '確認';

  @override
  String get logPanelTitle => 'ログ';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count エントリ',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'アクティビティなし';

  @override
  String get progressExtracting => '抽出中…';

  @override
  String get progressDone => '抽出完了!';

  @override
  String get treeLoading => 'アーカイブを読み込み中…';

  @override
  String get treeError => 'エラー';

  @override
  String get treeEmpty => 'アーカイブが読み込まれていません';

  @override
  String get treeEmptyHint => 'ファイルをドロップして内容を表示';

  @override
  String get treeSearch => '検索…';

  @override
  String get treeColName => '名前';

  @override
  String get treeColSize => 'サイズ';

  @override
  String get treeColModified => '変更日';

  @override
  String get treeOpenTooltip => 'ダブルクリックして開く';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count アイテム',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => '保存先';

  @override
  String get sectionSecurity => 'セキュリティ';

  @override
  String get destinationSameFolder => 'アーカイブと同じフォルダ';

  @override
  String get subfolderCreate => 'サブフォルダに抽出';

  @override
  String get subfolderDefault => 'アーカイブ名で名付け';

  @override
  String get passwordNone => 'パスワードなし';

  @override
  String get passwordSetLabel => 'パスワード設定済み';

  @override
  String get passwordEdit => '編集';

  @override
  String get passwordDefine => '設定';

  @override
  String get btnExtract => '抽出';

  @override
  String get btnExtracting => '抽出中...';

  @override
  String get btnDone => '完了 ✓';

  @override
  String get btnReset => 'リセット';

  @override
  String binaryWarning(String cmd) {
    return '7zip が見つかりません。インストール: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'アーカイブを開く';

  @override
  String get pickOutputDialogTitle => '保存先フォルダを選択';

  @override
  String logBinaryFound(String path) {
    return '7zip が見つかりました: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip が見つかりません。Homebrew (macOS) または 7-zip.org (Windows) からインストール。';

  @override
  String get logNoArchiveRecognized => 'ドロップされたファイルに認識されたアーカイブがありません。';

  @override
  String logUnsupportedFormat(String name) {
    return 'サポートされていない形式: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'アーカイブを読み込み中: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個のエントリがアーカイブで見つかりました。',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => '暗号化されたアーカイブ — パスワードが必要です。';

  @override
  String get logFilePasswordRequired => '暗号化されたファイル — パスワードが必要です。';

  @override
  String get logPasswordDefined => 'パスワード設定済み。';

  @override
  String get logCancelled => 'キャンセル。';

  @override
  String logDestination(String path) {
    return '保存先: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return '抽出先: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ 抽出完了: $path';
  }

  @override
  String get logReset => 'リセット。';

  @override
  String logOpening(String name) {
    return '$name を開く中…';
  }

  @override
  String logOpened(String name) {
    return '開きました: $name';
  }

  @override
  String logOpenError(String error) {
    return '開く際エラー: $error';
  }

  @override
  String logExtractionError(String error) {
    return '抽出エラー: $error';
  }

  @override
  String logError(String error) {
    return 'エラー: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ 不完全な分割アーカイブ — 欠落部分があります。コンテンツを表示できません。';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ 不完全な分割アーカイブ — 欠落部分があります。表示されるコンテンツは不完全な可能性があります。';

  @override
  String get logExtractionSplitError => '抽出失敗: 欠落部分があります。';

  @override
  String get errorSplitArchive => '⚠️ 不完全な分割アーカイブ — すべての部分が同じフォルダに存在することを確認。';

  @override
  String get tabDecompression => '解凍';

  @override
  String get tabCompression => '圧縮';

  @override
  String get tabConsoleApi => 'コンソール API';

  @override
  String get tabComingSoon => '近日公開';

  @override
  String get compLabelArchiveName => 'アーカイブ名';

  @override
  String get compLabelDestination => '保存先';

  @override
  String get compLabelFormat => 'フォーマット';

  @override
  String get compLabelCompression => '圧縮レベル';

  @override
  String get compLabelSecurity => 'セキュリティ';

  @override
  String get compLabelSplit => '分割';

  @override
  String get compSizeFolder => 'フォルダ';

  @override
  String get compDestSameFolder => 'ファイルと同じフォルダ';

  @override
  String compLevelNotApplicable(String format) {
    return '.$format には適用されません';
  }

  @override
  String get compHeaderEncryption => 'ヘッダ暗号化が有効';

  @override
  String get compSplitNone => 'なし';

  @override
  String get compBtnCompress => '圧縮';

  @override
  String get compBtnCompressing => '圧縮中…';

  @override
  String get compAddFiles => 'ファイルを追加';

  @override
  String get compAddFolder => 'フォルダを追加';

  @override
  String get compDropToAdd => 'ドラッグして追加';

  @override
  String get compDropHint => 'ここにファイルやフォルダをドロップ';

  @override
  String get compDropSubtitle => 'ファイルがアーカイブに追加されます';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return '圧縮中 → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ アーカイブを作成: $path';
  }
}
