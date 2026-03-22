import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ga.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_mt.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('es', '419'),
    Locale('et'),
    Locale('fi'),
    Locale('fr'),
    Locale('ga'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('mt'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sv'),
    Locale('th'),
    Locale('vi'),
    Locale('zh')
  ];

  /// No description provided for @dropZoneDrop.
  ///
  /// In en, this message translates to:
  /// **'Drop an archive'**
  String get dropZoneDrop;

  /// No description provided for @dropZoneRelease.
  ///
  /// In en, this message translates to:
  /// **'Release to open'**
  String get dropZoneRelease;

  /// No description provided for @dropZoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'or click to select\n.zip .7z .rar .tar .gz…'**
  String get dropZoneSubtitle;

  /// No description provided for @dropZoneFileCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} file} other{{count} files}}'**
  String dropZoneFileCount(int count);

  /// No description provided for @passwordDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Protected archive'**
  String get passwordDialogTitle;

  /// No description provided for @passwordDialogSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the password'**
  String get passwordDialogSubtitle;

  /// No description provided for @passwordDialogHint.
  ///
  /// In en, this message translates to:
  /// **'Password…'**
  String get passwordDialogHint;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @logPanelTitle.
  ///
  /// In en, this message translates to:
  /// **'Log'**
  String get logPanelTitle;

  /// No description provided for @logPanelEntryCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} entry} other{{count} entries}}'**
  String logPanelEntryCount(int count);

  /// No description provided for @logPanelEmpty.
  ///
  /// In en, this message translates to:
  /// **'No activity'**
  String get logPanelEmpty;

  /// No description provided for @progressExtracting.
  ///
  /// In en, this message translates to:
  /// **'Extracting…'**
  String get progressExtracting;

  /// No description provided for @progressDone.
  ///
  /// In en, this message translates to:
  /// **'Extraction complete!'**
  String get progressDone;

  /// No description provided for @treeLoading.
  ///
  /// In en, this message translates to:
  /// **'Reading archive…'**
  String get treeLoading;

  /// No description provided for @treeError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get treeError;

  /// No description provided for @treeEmpty.
  ///
  /// In en, this message translates to:
  /// **'No archive loaded'**
  String get treeEmpty;

  /// No description provided for @treeEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Drop a file to see its contents'**
  String get treeEmptyHint;

  /// No description provided for @treeSearch.
  ///
  /// In en, this message translates to:
  /// **'Search…'**
  String get treeSearch;

  /// No description provided for @treeColName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get treeColName;

  /// No description provided for @treeColSize.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get treeColSize;

  /// No description provided for @treeColModified.
  ///
  /// In en, this message translates to:
  /// **'Modified'**
  String get treeColModified;

  /// No description provided for @treeOpenTooltip.
  ///
  /// In en, this message translates to:
  /// **'Double-click to open'**
  String get treeOpenTooltip;

  /// No description provided for @treeItems.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{{count} item} other{{count} items}}'**
  String treeItems(int count);

  /// No description provided for @sectionDestination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get sectionDestination;

  /// No description provided for @sectionSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get sectionSecurity;

  /// No description provided for @destinationSameFolder.
  ///
  /// In en, this message translates to:
  /// **'Same folder as archive'**
  String get destinationSameFolder;

  /// No description provided for @subfolderCreate.
  ///
  /// In en, this message translates to:
  /// **'Extract to a subfolder'**
  String get subfolderCreate;

  /// No description provided for @subfolderDefault.
  ///
  /// In en, this message translates to:
  /// **'named after the archive'**
  String get subfolderDefault;

  /// No description provided for @passwordNone.
  ///
  /// In en, this message translates to:
  /// **'No password'**
  String get passwordNone;

  /// No description provided for @passwordSetLabel.
  ///
  /// In en, this message translates to:
  /// **'Password set'**
  String get passwordSetLabel;

  /// No description provided for @passwordEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get passwordEdit;

  /// No description provided for @passwordDefine.
  ///
  /// In en, this message translates to:
  /// **'Set'**
  String get passwordDefine;

  /// No description provided for @btnExtract.
  ///
  /// In en, this message translates to:
  /// **'Extract'**
  String get btnExtract;

  /// No description provided for @btnExtracting.
  ///
  /// In en, this message translates to:
  /// **'Extracting...'**
  String get btnExtracting;

  /// No description provided for @btnDone.
  ///
  /// In en, this message translates to:
  /// **'Done ✓'**
  String get btnDone;

  /// No description provided for @btnReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get btnReset;

  /// No description provided for @binaryWarning.
  ///
  /// In en, this message translates to:
  /// **'7zip not found. Install it: {cmd}'**
  String binaryWarning(String cmd);

  /// No description provided for @pickFileDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Open an archive'**
  String get pickFileDialogTitle;

  /// No description provided for @pickOutputDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose destination folder'**
  String get pickOutputDialogTitle;

  /// No description provided for @logBinaryFound.
  ///
  /// In en, this message translates to:
  /// **'7zip found: {path}'**
  String logBinaryFound(String path);

  /// No description provided for @logBinaryNotFound.
  ///
  /// In en, this message translates to:
  /// **'⚠️ 7zip not found. Install it via Homebrew (macOS) or 7-zip.org (Windows).'**
  String get logBinaryNotFound;

  /// No description provided for @logNoArchiveRecognized.
  ///
  /// In en, this message translates to:
  /// **'No recognized archive in dropped files.'**
  String get logNoArchiveRecognized;

  /// No description provided for @logUnsupportedFormat.
  ///
  /// In en, this message translates to:
  /// **'Unsupported format: {name}'**
  String logUnsupportedFormat(String name);

  /// No description provided for @logReadingArchive.
  ///
  /// In en, this message translates to:
  /// **'Reading archive: {name}'**
  String logReadingArchive(String name);

  /// No description provided for @logEntriesFound.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 entry found in archive.} other{{count} entries found in archive.}}'**
  String logEntriesFound(int count);

  /// No description provided for @logPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Encrypted archive — password required.'**
  String get logPasswordRequired;

  /// No description provided for @logFilePasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Encrypted file — password required.'**
  String get logFilePasswordRequired;

  /// No description provided for @logPasswordDefined.
  ///
  /// In en, this message translates to:
  /// **'Password set.'**
  String get logPasswordDefined;

  /// No description provided for @logCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled.'**
  String get logCancelled;

  /// No description provided for @logDestination.
  ///
  /// In en, this message translates to:
  /// **'Destination: {path}'**
  String logDestination(String path);

  /// No description provided for @logExtractionStarted.
  ///
  /// In en, this message translates to:
  /// **'Extracting to: {path}'**
  String logExtractionStarted(String path);

  /// No description provided for @logExtractionDone.
  ///
  /// In en, this message translates to:
  /// **'✅ Extraction complete in: {path}'**
  String logExtractionDone(String path);

  /// No description provided for @logReset.
  ///
  /// In en, this message translates to:
  /// **'Reset.'**
  String get logReset;

  /// No description provided for @logOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening {name}…'**
  String logOpening(String name);

  /// No description provided for @logOpened.
  ///
  /// In en, this message translates to:
  /// **'Opened: {name}'**
  String logOpened(String name);

  /// No description provided for @logOpenError.
  ///
  /// In en, this message translates to:
  /// **'Error opening: {error}'**
  String logOpenError(String error);

  /// No description provided for @logExtractionError.
  ///
  /// In en, this message translates to:
  /// **'Extraction error: {error}'**
  String logExtractionError(String error);

  /// No description provided for @logError.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String logError(String error);

  /// No description provided for @logSplitIncompleteEmpty.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Incomplete split archive — missing parts. Cannot display contents.'**
  String get logSplitIncompleteEmpty;

  /// No description provided for @logSplitIncompletePartial.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Incomplete split archive — missing parts. Displayed content may be partial.'**
  String get logSplitIncompletePartial;

  /// No description provided for @logExtractionSplitError.
  ///
  /// In en, this message translates to:
  /// **'Extraction failed: missing parts.'**
  String get logExtractionSplitError;

  /// No description provided for @errorSplitArchive.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Incomplete split archive — make sure all parts are in the same folder.'**
  String get errorSplitArchive;

  /// No description provided for @tabDecompression.
  ///
  /// In en, this message translates to:
  /// **'Decompression'**
  String get tabDecompression;

  /// No description provided for @tabCompression.
  ///
  /// In en, this message translates to:
  /// **'Compression'**
  String get tabCompression;

  /// No description provided for @tabConsoleApi.
  ///
  /// In en, this message translates to:
  /// **'Console API'**
  String get tabConsoleApi;

  /// No description provided for @tabComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get tabComingSoon;

  /// No description provided for @compLabelArchiveName.
  ///
  /// In en, this message translates to:
  /// **'Archive name'**
  String get compLabelArchiveName;

  /// No description provided for @compLabelDestination.
  ///
  /// In en, this message translates to:
  /// **'Destination'**
  String get compLabelDestination;

  /// No description provided for @compLabelFormat.
  ///
  /// In en, this message translates to:
  /// **'Format'**
  String get compLabelFormat;

  /// No description provided for @compLabelCompression.
  ///
  /// In en, this message translates to:
  /// **'Compression level'**
  String get compLabelCompression;

  /// No description provided for @compLabelSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get compLabelSecurity;

  /// No description provided for @compLabelAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced options'**
  String get compLabelAdvanced;

  /// No description provided for @compLabelSplit.
  ///
  /// In en, this message translates to:
  /// **'Split'**
  String get compLabelSplit;

  /// No description provided for @compSizeFolder.
  ///
  /// In en, this message translates to:
  /// **'folder'**
  String get compSizeFolder;

  /// No description provided for @compDestSameFolder.
  ///
  /// In en, this message translates to:
  /// **'Same folder as files'**
  String get compDestSameFolder;

  /// No description provided for @compLevelNotApplicable.
  ///
  /// In en, this message translates to:
  /// **'Not applicable for .{format}'**
  String compLevelNotApplicable(String format);

  /// No description provided for @compHeaderEncryption.
  ///
  /// In en, this message translates to:
  /// **'Header encryption enabled'**
  String get compHeaderEncryption;

  /// No description provided for @compSplitNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get compSplitNone;

  /// No description provided for @compBtnCompress.
  ///
  /// In en, this message translates to:
  /// **'Compress'**
  String get compBtnCompress;

  /// No description provided for @compBtnCompressing.
  ///
  /// In en, this message translates to:
  /// **'Compressing…'**
  String get compBtnCompressing;

  /// No description provided for @compAddFiles.
  ///
  /// In en, this message translates to:
  /// **'Add files'**
  String get compAddFiles;

  /// No description provided for @compAddFolder.
  ///
  /// In en, this message translates to:
  /// **'Add folder'**
  String get compAddFolder;

  /// No description provided for @compDropToAdd.
  ///
  /// In en, this message translates to:
  /// **'Drop to add'**
  String get compDropToAdd;

  /// No description provided for @compDropHint.
  ///
  /// In en, this message translates to:
  /// **'Drop files or folders here'**
  String get compDropHint;

  /// No description provided for @compDropSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Files will be added to the archive'**
  String get compDropSubtitle;

  /// No description provided for @compItemCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 item} other{{count} items}}'**
  String compItemCount(int count);

  /// No description provided for @compLogStarted.
  ///
  /// In en, this message translates to:
  /// **'Compressing → {path}'**
  String compLogStarted(String path);

  /// No description provided for @compLogDone.
  ///
  /// In en, this message translates to:
  /// **'✅ Archive created: {path}'**
  String compLogDone(String path);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bg',
        'cs',
        'da',
        'de',
        'el',
        'en',
        'es',
        'et',
        'fi',
        'fr',
        'ga',
        'hr',
        'hu',
        'id',
        'it',
        'ja',
        'ko',
        'lt',
        'lv',
        'mt',
        'nl',
        'pl',
        'pt',
        'ro',
        'ru',
        'sk',
        'sl',
        'sv',
        'th',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'es':
      {
        switch (locale.countryCode) {
          case '419':
            return AppLocalizationsEs419();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'ga':
      return AppLocalizationsGa();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'lt':
      return AppLocalizationsLt();
    case 'lv':
      return AppLocalizationsLv();
    case 'mt':
      return AppLocalizationsMt();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
