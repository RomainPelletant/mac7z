// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get dropZoneDrop => 'Ρίξτε ένα αρχείο';

  @override
  String get dropZoneRelease => 'Απελευθερώστε για άνοιγμα';

  @override
  String get dropZoneSubtitle =>
      'ή κάντε κλικ για επιλογή\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count αρχεία',
      one: '$count αρχείο',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Προστατευμένο αρχείο';

  @override
  String get passwordDialogSubtitle => 'Εισάγετε τον κωδικό πρόσβασης';

  @override
  String get passwordDialogHint => 'Κωδικός πρόσβασης…';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get confirm => 'Επιβεβαίωση';

  @override
  String get logPanelTitle => 'Ημερολόγιο';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εγγραφές',
      one: '$count εγγραφή',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Καμία δραστηριότητα';

  @override
  String get progressExtracting => 'Εξαγωγή…';

  @override
  String get progressDone => 'Ολοκλήρωση εξαγωγής!';

  @override
  String get treeLoading => 'Ανάγνωση αρχείου…';

  @override
  String get treeError => 'Σφάλμα';

  @override
  String get treeEmpty => 'Κανένα αρχείο φορτωμένο';

  @override
  String get treeEmptyHint =>
      'Ρίξτε ένα αρχείο για να δείτε το περιεχόμενό του';

  @override
  String get treeSearch => 'Αναζήτηση…';

  @override
  String get treeColName => 'Όνομα';

  @override
  String get treeColSize => 'Μέγεθος';

  @override
  String get treeColModified => 'Τροποποιήθηκε';

  @override
  String get treeOpenTooltip => 'Διπλό κλικ για άνοιγμα';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count στοιχεία',
      one: '$count στοιχείο',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Προορισμός';

  @override
  String get sectionSecurity => 'Ασφάλεια';

  @override
  String get destinationSameFolder => 'Ίδιος φάκελος με το αρχείο';

  @override
  String get subfolderCreate => 'Εξαγωγή σε υποφάκελο';

  @override
  String get subfolderDefault => 'με όνομα από το αρχείο';

  @override
  String get passwordNone => 'Χωρίς κωδικό πρόσβασης';

  @override
  String get passwordSetLabel => 'Κωδικός πρόσβασης ορίστηκε';

  @override
  String get passwordEdit => 'Επεξεργασία';

  @override
  String get passwordDefine => 'Ορισμός';

  @override
  String get btnExtract => 'Εξαγωγή';

  @override
  String get btnExtracting => 'Εξαγωγή...';

  @override
  String get btnDone => 'Ολοκληρώθη ✓';

  @override
  String get btnReset => 'Επαναφορά';

  @override
  String binaryWarning(String cmd) {
    return '7zip δεν βρέθηκε. Εγκαταστήστε το: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Άνοιγμα αρχείου';

  @override
  String get pickOutputDialogTitle => 'Επιλέξτε φάκελο προορισμού';

  @override
  String logBinaryFound(String path) {
    return '7zip βρέθηκε: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip δεν βρέθηκε. Εγκαταστήστε μέσω Homebrew (macOS) ή 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Κανένα αναγνωρισμένο αρχείο στα ριγμένα αρχεία.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Μη υποστηριζόμενη μορφή: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Ανάγνωση αρχείου: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count εγγραφές βρέθηκαν στο αρχείο.',
      one: '1 εγγραφή βρέθηκε στο αρχείο.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired =>
      'Κρυπτογραφημένο αρχείο — απαιτείται κωδικός πρόσβασης.';

  @override
  String get logFilePasswordRequired =>
      'Κρυπτογραφημένο αρχείο — απαιτείται κωδικός πρόσβασης.';

  @override
  String get logPasswordDefined => 'Κωδικός πρόσβασης ορίστηκε.';

  @override
  String get logCancelled => 'Ακυρώθηκε.';

  @override
  String logDestination(String path) {
    return 'Προορισμός: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Εξαγωγή σε: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Εξαγωγή ολοκληρώθηκε σε: $path';
  }

  @override
  String get logReset => 'Επαναφορά.';

  @override
  String logOpening(String name) {
    return 'Άνοιγμα $name…';
  }

  @override
  String logOpened(String name) {
    return 'Ανοίχθηκε: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Σφάλμα κατά το άνοιγμα: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Σφάλμα εξαγωγής: $error';
  }

  @override
  String logError(String error) {
    return 'Σφάλμα: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Ελλιπές διαχωρισμένο αρχείο — ελλείπουσα μέρη. Δεν είναι δυνατή η εμφάνιση περιεχομένου.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Ελλιπές διαχωρισμένο αρχείο — ελλείπουσα μέρη. Το εμφανιζόμενο περιεχόμενο ενδέχεται να είναι ελλιπές.';

  @override
  String get logExtractionSplitError => 'Η εξαγωγή απέτυχε: ελλείπουσα μέρη.';

  @override
  String get errorSplitArchive =>
      '⚠️ Ελλιπές διαχωρισμένο αρχείο — βεβαιωθείτε ότι όλα τα μέρη είναι στον ίδιο φάκελο.';

  @override
  String get tabDecompression => 'Αποσυμπίεση';

  @override
  String get tabCompression => 'Συμπίεση';

  @override
  String get tabConsoleApi => 'Κονσόλα API';

  @override
  String get tabComingSoon => 'Σύντομα';

  @override
  String get compLabelArchiveName => 'Όνομα αρχείου';

  @override
  String get compLabelDestination => 'Προορισμός';

  @override
  String get compLabelFormat => 'Μορφή';

  @override
  String get compLabelCompression => 'Επίπεδο συμπίεσης';

  @override
  String get compLabelSecurity => 'Ασφάλεια';

  @override
  String get compLabelSplit => 'Διαχωρισμός';

  @override
  String get compSizeFolder => 'φάκελος';

  @override
  String get compDestSameFolder => 'Ίδιος φάκελος με τα αρχεία';

  @override
  String compLevelNotApplicable(String format) {
    return 'Δεν ισχύει για .$format';
  }

  @override
  String get compHeaderEncryption => 'Κρυπτογράφηση κεφαλίδας ενεργοποιημένη';

  @override
  String get compSplitNone => 'Κανένα';

  @override
  String get compBtnCompress => 'Συμπίεση';

  @override
  String get compBtnCompressing => 'Συμπίεση…';

  @override
  String get compAddFiles => 'Προσθήκη αρχείων';

  @override
  String get compAddFolder => 'Προσθήκη φακέλου';

  @override
  String get compDropToAdd => 'Ρίξτε για προσθήκη';

  @override
  String get compDropHint => 'Ρίξτε αρχεία ή φακέλους εδώ';

  @override
  String get compDropSubtitle => 'Τα αρχεία θα προστεθούν στο αρχείο';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count στοιχεία',
      one: '1 στοιχείο',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Συμπίεση → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Αρχείο δημιουργήθηκε: $path';
  }
}
