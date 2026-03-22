// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get dropZoneDrop => 'วางไฟล์บีบอัด';

  @override
  String get dropZoneRelease => 'ปล่อยเพื่อเปิด';

  @override
  String get dropZoneSubtitle => 'หรือคลิกเพื่อเลือก\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ไฟล์',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'ไฟล์บีบอัดที่มีการป้องกัน';

  @override
  String get passwordDialogSubtitle => 'ป้อนรหัสผ่าน';

  @override
  String get passwordDialogHint => 'รหัสผ่าน…';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get confirm => 'ยืนยัน';

  @override
  String get logPanelTitle => 'บันทึก';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รายการ',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'ไม่มีกิจกรรม';

  @override
  String get progressExtracting => 'กำลังแยกไฟล์…';

  @override
  String get progressDone => 'แยกไฟล์เสร็จสิ้น!';

  @override
  String get treeLoading => 'กำลังอ่านไฟล์บีบอัด…';

  @override
  String get treeError => 'ข้อผิดพลาด';

  @override
  String get treeEmpty => 'ไม่มีไฟล์บีบอัดที่โหลด';

  @override
  String get treeEmptyHint => 'วางไฟล์เพื่อดูเนื้อหา';

  @override
  String get treeSearch => 'ค้นหา…';

  @override
  String get treeColName => 'ชื่อ';

  @override
  String get treeColSize => 'ขนาด';

  @override
  String get treeColModified => 'แก้ไขแล้ว';

  @override
  String get treeOpenTooltip => 'ดับเบิลคลิกเพื่อเปิด';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รายการ',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'ปลายทาง';

  @override
  String get sectionSecurity => 'ความปลอดภัย';

  @override
  String get destinationSameFolder => 'โฟลเดอร์เดียวกับไฟล์บีบอัด';

  @override
  String get subfolderCreate => 'แยกไฟล์ไปยังโฟลเดอร์ย่อย';

  @override
  String get subfolderDefault => 'ตั้งชื่อจากไฟล์บีบอัด';

  @override
  String get passwordNone => 'ไม่มีรหัสผ่าน';

  @override
  String get passwordSetLabel => 'ตั้งรหัสผ่านแล้ว';

  @override
  String get passwordEdit => 'แก้ไข';

  @override
  String get passwordDefine => 'ตั้งค่า';

  @override
  String get btnExtract => 'แยกไฟล์';

  @override
  String get btnExtracting => 'กำลังแยกไฟล์...';

  @override
  String get btnDone => 'เสร็จสิ้น ✓';

  @override
  String get btnReset => 'รีเซ็ต';

  @override
  String binaryWarning(String cmd) {
    return 'ไม่พบ 7zip ติดตั้ง: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'เปิดไฟล์บีบอัด';

  @override
  String get pickOutputDialogTitle => 'เลือกโฟลเดอร์ปลายทาง';

  @override
  String logBinaryFound(String path) {
    return 'พบ 7zip: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ ไม่พบ 7zip ติดตั้งผ่าน Homebrew (macOS) หรือ 7-zip.org (Windows)';

  @override
  String get logNoArchiveRecognized =>
      'ไม่มีไฟล์บีบอัดที่ถูกรับรู้ในไฟล์ที่วาง';

  @override
  String logUnsupportedFormat(String name) {
    return 'รูปแบบไม่รองรับ: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'กำลังอ่านไฟล์บีบอัด: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'พบ $count รายการในไฟล์บีบอัด',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'ไฟล์บีบอัดที่เข้ารหัส — ต้องใช้รหัสผ่าน';

  @override
  String get logFilePasswordRequired => 'ไฟล์ที่เข้ารหัส — ต้องใช้รหัสผ่าน';

  @override
  String get logPasswordDefined => 'ตั้งรหัสผ่านแล้ว';

  @override
  String get logCancelled => 'ยกเลิกแล้ว';

  @override
  String logDestination(String path) {
    return 'ปลายทาง: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'กำลังแยกไฟล์ไปยัง: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ แยกไฟล์เสร็จสิ้นใน: $path';
  }

  @override
  String get logReset => 'รีเซ็ตแล้ว';

  @override
  String logOpening(String name) {
    return 'กำลังเปิด $name…';
  }

  @override
  String logOpened(String name) {
    return 'เปิดแล้ว: $name';
  }

  @override
  String logOpenError(String error) {
    return 'ข้อผิดพลาดในการเปิด: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'ข้อผิดพลาดในการแยกไฟล์: $error';
  }

  @override
  String logError(String error) {
    return 'ข้อผิดพลาด: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ ไฟล์บีบอัดแบบแยกไม่สมบูรณ์ — ส่วนขาดหายไป ไม่สามารถแสดงเนื้อหา';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ ไฟล์บีบอัดแบบแยกไม่สมบูรณ์ — ส่วนขาดหายไป เนื้อหาที่แสดงอาจไม่สมบูรณ์';

  @override
  String get logExtractionSplitError => 'การแยกไฟล์ล้มเหลว: ส่วนขาดหายไป';

  @override
  String get errorSplitArchive =>
      '⚠️ ไฟล์บีบอัดแบบแยกไม่สมบูรณ์ — ตรวจสอบให้แน่ใจว่าส่วนทั้งหมดอยู่ในโฟลเดอร์เดียวกัน';

  @override
  String get tabDecompression => 'การแตกไฟล์';

  @override
  String get tabCompression => 'การบีบอัด';

  @override
  String get tabConsoleApi => 'คอนโซล API';

  @override
  String get tabComingSoon => 'เร็วๆ นี้';

  @override
  String get compLabelArchiveName => 'ชื่อไฟล์บีบอัด';

  @override
  String get compLabelDestination => 'ปลายทาง';

  @override
  String get compLabelFormat => 'รูปแบบ';

  @override
  String get compLabelCompression => 'ระดับการบีบอัด';

  @override
  String get compLabelSecurity => 'ความปลอดภัย';

  @override
  String get compLabelAdvanced => 'ตัวเลือกขั้นสูง';

  @override
  String get compLabelSplit => 'แบ่ง';

  @override
  String get compSizeFolder => 'โฟลเดอร์';

  @override
  String get compDestSameFolder => 'โฟลเดอร์เดียวกับไฟล์';

  @override
  String compLevelNotApplicable(String format) {
    return 'ไม่ใช้ได้สำหรับ .$format';
  }

  @override
  String get compHeaderEncryption => 'เปิดใช้งานการเข้ารหัสส่วนหัว';

  @override
  String get compSplitNone => 'ไม่มี';

  @override
  String get compBtnCompress => 'บีบอัด';

  @override
  String get compBtnCompressing => 'กำลังบีบอัด…';

  @override
  String get compAddFiles => 'เพิ่มไฟล์';

  @override
  String get compAddFolder => 'เพิ่มโฟลเดอร์';

  @override
  String get compDropToAdd => 'วางเพื่อเพิ่ม';

  @override
  String get compDropHint => 'วางไฟล์หรือโฟลเดอร์ที่นี่';

  @override
  String get compDropSubtitle => 'ไฟล์จะถูกเพิ่มลงในไฟล์บีบอัด';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รายการ',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'กำลังบีบอัด → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ สร้างไฟล์บีบอัด: $path';
  }
}
