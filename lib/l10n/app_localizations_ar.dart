// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get dropZoneDrop => 'أسقط الأرشيف';

  @override
  String get dropZoneRelease => 'أفلت للفتح';

  @override
  String get dropZoneSubtitle => 'أو انقر للتحديد\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ملف',
      many: '$count ملفًا',
      few: '$count ملفات',
      two: '$count ملفان',
      one: '$count ملف',
      zero: '$count ملفات',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'أرشيف محمي';

  @override
  String get passwordDialogSubtitle => 'أدخل كلمة المرور';

  @override
  String get passwordDialogHint => 'كلمة المرور…';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get logPanelTitle => 'السجل';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count إدخال',
      many: '$count إدخالاً',
      few: '$count إدخالات',
      two: '$count إدخالان',
      one: '$count إدخال',
      zero: '$count إدخالات',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'لا توجد أنشطة';

  @override
  String get progressExtracting => 'جاري الاستخراج…';

  @override
  String get progressDone => 'اكتمل الاستخراج!';

  @override
  String get treeLoading => 'جاري قراءة الأرشيف…';

  @override
  String get treeError => 'خطأ';

  @override
  String get treeEmpty => 'لم يتم تحميل أرشيف';

  @override
  String get treeEmptyHint => 'أسقط ملف لرؤية محتوياته';

  @override
  String get treeSearch => 'بحث…';

  @override
  String get treeColName => 'الاسم';

  @override
  String get treeColSize => 'الحجم';

  @override
  String get treeColModified => 'معدل';

  @override
  String get treeOpenTooltip => 'انقر مرتين للفتح';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عنصر',
      many: '$count عنصراً',
      few: '$count عناصر',
      two: '$count عنصران',
      one: '$count عنصر',
      zero: '$count عناصر',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'الوجهة';

  @override
  String get sectionSecurity => 'الأمان';

  @override
  String get destinationSameFolder => 'نفس المجلد مثل الأرشيف';

  @override
  String get subfolderCreate => 'استخراج في مجلد فرعي';

  @override
  String get subfolderDefault => 'مسمى حسب الأرشيف';

  @override
  String get passwordNone => 'بدون كلمة مرور';

  @override
  String get passwordSetLabel => 'تم تعيين كلمة المرور';

  @override
  String get passwordEdit => 'تحرير';

  @override
  String get passwordDefine => 'عين';

  @override
  String get btnExtract => 'استخراج';

  @override
  String get btnExtracting => 'جاري الاستخراج...';

  @override
  String get btnDone => 'تم ✓';

  @override
  String get btnReset => 'إعادة تعيين';

  @override
  String binaryWarning(String cmd) {
    return 'لم يتم العثور على 7zip. تثبيت: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'فتح أرشيف';

  @override
  String get pickOutputDialogTitle => 'اختر مجلد الوجهة';

  @override
  String logBinaryFound(String path) {
    return 'تم العثور على 7zip: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ لم يتم العثور على 7zip. قم بالتثبيت عبر Homebrew (macOS) أو 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'لا توجد أرشيفات معترف بها في الملفات المُسقطة.';

  @override
  String logUnsupportedFormat(String name) {
    return 'صيغة غير مدعومة: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'جاري قراءة الأرشيف: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم العثور على $count إدخال في الأرشيف.',
      many: 'تم العثور على $count إدخالاً في الأرشيف.',
      few: 'تم العثور على $count إدخالات في الأرشيف.',
      two: 'تم العثور على $count إدخالين في الأرشيف.',
      one: 'تم العثور على $count إدخال في الأرشيف.',
      zero: 'تم العثور على $count إدخالات في الأرشيف.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'أرشيف مشفر — كلمة مرور مطلوبة.';

  @override
  String get logFilePasswordRequired => 'ملف مشفر — كلمة مرور مطلوبة.';

  @override
  String get logPasswordDefined => 'تم تعيين كلمة المرور.';

  @override
  String get logCancelled => 'تم الإلغاء.';

  @override
  String logDestination(String path) {
    return 'الوجهة: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'جاري الاستخراج إلى: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ اكتمل الاستخراج في: $path';
  }

  @override
  String get logReset => 'إعادة تعيين.';

  @override
  String logOpening(String name) {
    return 'جاري فتح $name…';
  }

  @override
  String logOpened(String name) {
    return 'تم الفتح: $name';
  }

  @override
  String logOpenError(String error) {
    return 'خطأ في الفتح: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'خطأ في الاستخراج: $error';
  }

  @override
  String logError(String error) {
    return 'خطأ: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ أرشيف مقسم غير مكتمل — أجزاء مفقودة. لا يمكن عرض المحتوى.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ أرشيف مقسم غير مكتمل — أجزاء مفقودة. قد تكون المحتويات المعروضة غير مكتملة.';

  @override
  String get logExtractionSplitError => 'فشل الاستخراج: أجزاء مفقودة.';

  @override
  String get errorSplitArchive =>
      '⚠️ أرشيف مقسم غير مكتمل — تأكد من أن جميع الأجزاء في نفس المجلد.';

  @override
  String get tabDecompression => 'فك الضغط';

  @override
  String get tabCompression => 'الضغط';

  @override
  String get tabConsoleApi => 'واجهة API';

  @override
  String get tabComingSoon => 'قريباً';

  @override
  String get compLabelArchiveName => 'اسم الأرشيف';

  @override
  String get compLabelDestination => 'الوجهة';

  @override
  String get compLabelFormat => 'الصيغة';

  @override
  String get compLabelCompression => 'مستوى الضغط';

  @override
  String get compLabelSecurity => 'الأمان';

  @override
  String get compLabelAdvanced => 'خيارات متقدمة';

  @override
  String get compLabelSplit => 'قسم';

  @override
  String get compSizeFolder => 'مجلد';

  @override
  String get compDestSameFolder => 'نفس المجلد مثل الملفات';

  @override
  String compLevelNotApplicable(String format) {
    return 'غير قابل للتطبيق على .$format';
  }

  @override
  String get compHeaderEncryption => 'تشفير الرأس مفعل';

  @override
  String get compSplitNone => 'لا شيء';

  @override
  String get compBtnCompress => 'ضغط';

  @override
  String get compBtnCompressing => 'جاري الضغط…';

  @override
  String get compAddFiles => 'أضف ملفات';

  @override
  String get compAddFolder => 'إضافة مجلد';

  @override
  String get compDropToAdd => 'أسقط للإضافة';

  @override
  String get compDropHint => 'أسقط الملفات أو المجلدات هنا';

  @override
  String get compDropSubtitle => 'سيتم إضافة الملفات إلى الأرشيف';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عنصر',
      many: '$count عنصراً',
      few: '$count عناصر',
      two: '$count عنصران',
      one: '$count عنصر',
      zero: '$count عناصر',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'جاري الضغط → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ تم إنشاء الأرشيف: $path';
  }

  @override
  String get consoleSectionConfig => 'الإعداد';

  @override
  String get consoleSectionCommands => 'الأوامر الرئيسية';

  @override
  String get consoleSectionOptions => 'الخيارات الشائعة';

  @override
  String get consoleSectionExamples => 'أمثلة متقدمة';

  @override
  String get consoleHeroSubtitle =>
      'يمرر mac7z جميع الوسائط مباشرة إلى ملف 7zip الثنائي المضمّن. استخدمه من Terminal تمامًا كما تستخدم 7zz.';

  @override
  String get consoleSetupIntro =>
      'أنشئ اسمًا مستعارًا في shell لاستخدام mac7z كأمر عادي في Terminal:';

  @override
  String get consoleSetupOutroMac =>
      'أضف هذا السطر إلى ~/.zshrc أو ~/.bash_profile لجعله دائمًا. بعد الإعداد، تعمل كل أوامر 7zip القياسية باستبدال 7zz بـ mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'أضف هذا السطر إلى ~/.bashrc أو ~/.zshrc لجعله دائمًا. بعد الإعداد، تعمل كل أوامر 7zip القياسية باستبدال 7zz بـ mac7z.';

  @override
  String get consoleCmdList => 'عرض محتويات الأرشيف';

  @override
  String get consoleCmdExtractFull => 'استخراج مع المسارات الكاملة';

  @override
  String get consoleCmdExtractToDir => 'استخراج إلى مجلد محدد';

  @override
  String get consoleCmdExtractFlat => 'استخراج مسطح بدون مجلدات فرعية';

  @override
  String get consoleCmdCreateUpdate => 'إنشاء أرشيف أو تحديثه';

  @override
  String get consoleCmdCreateZip => 'إنشاء أرشيف ZIP';

  @override
  String get consoleCmdTest => 'اختبار سلامة الأرشيف';

  @override
  String get consoleCmdDelete => 'حذف ملف من الأرشيف';

  @override
  String get consoleCmdInfo => 'عرض معلومات حول 7zip';

  @override
  String get consoleOptPassword => 'حماية الأرشيف بكلمة مرور';

  @override
  String get consoleOptEncryptHeaders => 'تشفير أسماء الملفات أيضًا (7z فقط)';

  @override
  String get consoleOptCompressionLevel => 'مستوى الضغط (0 = بدون، 9 = أقصى)';

  @override
  String get consoleOptMultithread => 'تفعيل الضغط متعدد الخيوط';

  @override
  String get consoleOptSplitVolumes =>
      'تقسيم إلى أجزاء (مثل ‎-v100m لـ 100 ميغابايت)';

  @override
  String get consoleOptRecursive => 'معالجة المجلدات الفرعية بشكل递归';

  @override
  String get consoleOptYesAll => 'الإجابة \"نعم\" على جميع التأكيدات';

  @override
  String get consoleOptOutputDir => 'مجلد الوجهة للاستخراج';

  @override
  String get consoleOptExclude => 'استبعاد ملفات (مثل ‎-x!*.log)';

  @override
  String get consoleExEncrypted => 'أرشيف مشفّر بأسماء مخفية';

  @override
  String get consoleExVolumes => 'أرشيف مقسم إلى أجزاء 50 ميغابايت';

  @override
  String get consoleExUltra => 'ضغط فائق (بطيء، أصغر ملف)';

  @override
  String get consoleExSingleFile => 'استخراج ملف واحد';

  @override
  String get consoleExTechnical => 'عرض مع تفاصيل تقنية';

  @override
  String get consoleCopy => 'نسخ';

  @override
  String get consoleCopied => 'تم النسخ!';

  @override
  String get consoleInfoNote =>
      'يتضمن mac7z ملف 7zz الثنائي الخاص به. تُمرَّر الوسائط كما هي تمامًا دون تعديل. أي أمر صالح لـ 7zz يعمل بالطريقة نفسها مع mac7z.';
}
