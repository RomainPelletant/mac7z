// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get dropZoneDrop => 'Przeciągnij archiwum';

  @override
  String get dropZoneRelease => 'Zwolnij, aby otworzyć';

  @override
  String get dropZoneSubtitle =>
      'lub kliknij, aby wybrać\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pliku',
      many: '$count plików',
      few: '$count pliki',
      one: '$count plik',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Chronione archiwum';

  @override
  String get passwordDialogSubtitle => 'Podaj hasło';

  @override
  String get passwordDialogHint => 'Hasło…';

  @override
  String get cancel => 'Anuluj';

  @override
  String get confirm => 'Potwierdź';

  @override
  String get logPanelTitle => 'Dziennik';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count wpisu',
      many: '$count wpisów',
      few: '$count wpisy',
      one: '$count wpis',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Brak aktywności';

  @override
  String get progressExtracting => 'Rozpakowywanie…';

  @override
  String get progressDone => 'Rozpakowanie ukończone!';

  @override
  String get treeLoading => 'Czytanie archiwum…';

  @override
  String get treeError => 'Błąd';

  @override
  String get treeEmpty => 'Brak załadowanego archiwum';

  @override
  String get treeEmptyHint => 'Przeciągnij plik, aby zobaczyć jego zawartość';

  @override
  String get treeSearch => 'Wyszukaj…';

  @override
  String get treeColName => 'Nazwa';

  @override
  String get treeColSize => 'Rozmiar';

  @override
  String get treeColModified => 'Zmodyfikowano';

  @override
  String get treeOpenTooltip => 'Kliknij dwukrotnie, aby otworzyć';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementu',
      many: '$count elementów',
      few: '$count elementy',
      one: '$count element',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Cel';

  @override
  String get sectionSecurity => 'Bezpieczeństwo';

  @override
  String get destinationSameFolder => 'Ten sam folder co archiwum';

  @override
  String get subfolderCreate => 'Rozpakuj do podfolderu';

  @override
  String get subfolderDefault => 'o nazwie archiwum';

  @override
  String get passwordNone => 'Brak hasła';

  @override
  String get passwordSetLabel => 'Hasło ustawione';

  @override
  String get passwordEdit => 'Edytuj';

  @override
  String get passwordDefine => 'Ustaw';

  @override
  String get btnExtract => 'Rozpakuj';

  @override
  String get btnExtracting => 'Rozpakowywanie...';

  @override
  String get btnDone => 'Gotowe ✓';

  @override
  String get btnReset => 'Zresetuj';

  @override
  String binaryWarning(String cmd) {
    return '7zip nie znaleziony. Zainstaluj go: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Otwórz archiwum';

  @override
  String get pickOutputDialogTitle => 'Wybierz folder docelowy';

  @override
  String logBinaryFound(String path) {
    return '7zip znaleziony: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip nie znaleziony. Zainstaluj za pośrednictwem Homebrew (macOS) lub 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Brak rozpoznanego archiwum w przeciągniętych plikach.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Nieobsługiwany format: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Czytanie archiwum: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Znaleziono $count wpisu w archiwum.',
      many: 'Znaleziono $count wpisów w archiwum.',
      few: 'Znaleziono $count wpisy w archiwum.',
      one: 'Znaleziono 1 wpis w archiwum.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Zaszyfrowane archiwum — wymagane hasło.';

  @override
  String get logFilePasswordRequired => 'Zaszyfrowany plik — wymagane hasło.';

  @override
  String get logPasswordDefined => 'Hasło ustawione.';

  @override
  String get logCancelled => 'Anulowano.';

  @override
  String logDestination(String path) {
    return 'Cel: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Rozpakowywanie do: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Rozpakowanie ukończone w: $path';
  }

  @override
  String get logReset => 'Zresetowano.';

  @override
  String logOpening(String name) {
    return 'Otwieranie $name…';
  }

  @override
  String logOpened(String name) {
    return 'Otwarte: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Błąd podczas otwierania: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Błąd rozpakowania: $error';
  }

  @override
  String logError(String error) {
    return 'Błąd: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Niekompletne archiwum podzielone — brakujące części. Nie można wyświetlić zawartości.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Niekompletne archiwum podzielone — brakujące części. Wyświetlona zawartość może być niekompletna.';

  @override
  String get logExtractionSplitError =>
      'Rozpakowanie nie powiodło się: brakujące części.';

  @override
  String get errorSplitArchive =>
      '⚠️ Niekompletne archiwum podzielone — upewnij się, że wszystkie części znajdują się w tym samym folderze.';

  @override
  String get tabDecompression => 'Dekompresja';

  @override
  String get tabCompression => 'Kompresja';

  @override
  String get tabConsoleApi => 'Konsola API';

  @override
  String get tabComingSoon => 'Wkrótce';

  @override
  String get compLabelArchiveName => 'Nazwa archiwum';

  @override
  String get compLabelDestination => 'Cel';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Poziom kompresji';

  @override
  String get compLabelSecurity => 'Bezpieczeństwo';

  @override
  String get compLabelSplit => 'Podziel';

  @override
  String get compSizeFolder => 'folder';

  @override
  String get compDestSameFolder => 'Ten sam folder co pliki';

  @override
  String compLevelNotApplicable(String format) {
    return 'Nie dotyczy dla .$format';
  }

  @override
  String get compHeaderEncryption => 'Szyfrowanie nagłówka włączone';

  @override
  String get compSplitNone => 'Brak';

  @override
  String get compBtnCompress => 'Kompresuj';

  @override
  String get compBtnCompressing => 'Kompresowanie…';

  @override
  String get compAddFiles => 'Dodaj pliki';

  @override
  String get compAddFolder => 'Dodaj folder';

  @override
  String get compDropToAdd => 'Przeciągnij, aby dodać';

  @override
  String get compDropHint => 'Przeciągnij tutaj pliki lub foldery';

  @override
  String get compDropSubtitle => 'Pliki będą dodane do archiwum';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementu',
      many: '$count elementów',
      few: '$count elementy',
      one: '1 element',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Kompresowanie → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archiwum utworzone: $path';
  }
}
