// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get dropZoneDrop => 'Thả một kho lưu trữ';

  @override
  String get dropZoneRelease => 'Thả để mở';

  @override
  String get dropZoneSubtitle => 'hoặc nhấp để chọn\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tệp',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Kho lưu trữ được bảo vệ';

  @override
  String get passwordDialogSubtitle => 'Nhập mật khẩu';

  @override
  String get passwordDialogHint => 'Mật khẩu…';

  @override
  String get cancel => 'Hủy';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get logPanelTitle => 'Nhật ký';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Không có hoạt động';

  @override
  String get progressExtracting => 'Đang trích xuất…';

  @override
  String get progressDone => 'Trích xuất hoàn thành!';

  @override
  String get treeLoading => 'Đang đọc kho lưu trữ…';

  @override
  String get treeError => 'Lỗi';

  @override
  String get treeEmpty => 'Không có kho lưu trữ được tải';

  @override
  String get treeEmptyHint => 'Thả một tệp để xem nội dung của nó';

  @override
  String get treeSearch => 'Tìm kiếm…';

  @override
  String get treeColName => 'Tên';

  @override
  String get treeColSize => 'Kích thước';

  @override
  String get treeColModified => 'Đã sửa đổi';

  @override
  String get treeOpenTooltip => 'Nhấp đúp để mở';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Đích';

  @override
  String get sectionSecurity => 'Bảo mật';

  @override
  String get destinationSameFolder => 'Cùng thư mục với kho lưu trữ';

  @override
  String get subfolderCreate => 'Trích xuất vào thư mục con';

  @override
  String get subfolderDefault => 'được đặt tên theo kho lưu trữ';

  @override
  String get passwordNone => 'Không có mật khẩu';

  @override
  String get passwordSetLabel => 'Mật khẩu đã được đặt';

  @override
  String get passwordEdit => 'Chỉnh sửa';

  @override
  String get passwordDefine => 'Đặt';

  @override
  String get btnExtract => 'Trích xuất';

  @override
  String get btnExtracting => 'Đang trích xuất...';

  @override
  String get btnDone => 'Xong ✓';

  @override
  String get btnReset => 'Đặt lại';

  @override
  String binaryWarning(String cmd) {
    return 'Không tìm thấy 7zip. Cài đặt: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Mở một kho lưu trữ';

  @override
  String get pickOutputDialogTitle => 'Chọn thư mục đích';

  @override
  String logBinaryFound(String path) {
    return 'Tìm thấy 7zip: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ Không tìm thấy 7zip. Cài đặt qua Homebrew (macOS) hoặc 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Không có kho lưu trữ được nhận dạng trong các tệp đã thả.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Định dạng không được hỗ trợ: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Đang đọc kho lưu trữ: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tìm thấy $count mục trong kho lưu trữ.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Kho lưu trữ được mã hóa — cần mật khẩu.';

  @override
  String get logFilePasswordRequired => 'Tệp được mã hóa — cần mật khẩu.';

  @override
  String get logPasswordDefined => 'Mật khẩu đã được đặt.';

  @override
  String get logCancelled => 'Đã hủy.';

  @override
  String logDestination(String path) {
    return 'Đích: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Trích xuất sang: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Trích xuất hoàn thành tại: $path';
  }

  @override
  String get logReset => 'Đã đặt lại.';

  @override
  String logOpening(String name) {
    return 'Đang mở $name…';
  }

  @override
  String logOpened(String name) {
    return 'Đã mở: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Lỗi khi mở: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Lỗi trích xuất: $error';
  }

  @override
  String logError(String error) {
    return 'Lỗi: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Kho lưu trữ bị phân chia không hoàn chỉnh — thiếu phần. Không thể hiển thị nội dung.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Kho lưu trữ bị phân chia không hoàn chỉnh — thiếu phần. Nội dung được hiển thị có thể không hoàn chỉnh.';

  @override
  String get logExtractionSplitError =>
      'Trích xuất không thành công: thiếu phần.';

  @override
  String get errorSplitArchive =>
      '⚠️ Kho lưu trữ bị phân chia không hoàn chỉnh — đảm bảo tất cả các phần nằm trong cùng một thư mục.';

  @override
  String get tabDecompression => 'Giải nén';

  @override
  String get tabCompression => 'Nén';

  @override
  String get tabConsoleApi => 'Bảng điều khiển API';

  @override
  String get tabComingSoon => 'Sắp ra mắt';

  @override
  String get compLabelArchiveName => 'Tên kho lưu trữ';

  @override
  String get compLabelDestination => 'Đích';

  @override
  String get compLabelFormat => 'Định dạng';

  @override
  String get compLabelCompression => 'Mức độ nén';

  @override
  String get compLabelSecurity => 'Bảo mật';

  @override
  String get compLabelAdvanced => 'Tùy chọn nâng cao';

  @override
  String get compLabelSplit => 'Chia';

  @override
  String get compSizeFolder => 'thư mục';

  @override
  String get compDestSameFolder => 'Cùng thư mục với tệp';

  @override
  String compLevelNotApplicable(String format) {
    return 'Không áp dụng cho .$format';
  }

  @override
  String get compHeaderEncryption => 'Mã hóa tiêu đề được bật';

  @override
  String get compSplitNone => 'Không';

  @override
  String get compBtnCompress => 'Nén';

  @override
  String get compBtnCompressing => 'Đang nén…';

  @override
  String get compAddFiles => 'Thêm tệp';

  @override
  String get compAddFolder => 'Thêm thư mục';

  @override
  String get compDropToAdd => 'Thả để thêm';

  @override
  String get compDropHint => 'Thả tệp hoặc thư mục ở đây';

  @override
  String get compDropSubtitle => 'Tệp sẽ được thêm vào kho lưu trữ';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Đang nén → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Kho lưu trữ được tạo: $path';
  }
}
