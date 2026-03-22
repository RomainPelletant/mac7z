// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get dropZoneDrop => 'Lepaskan arsip';

  @override
  String get dropZoneRelease => 'Lepaskan untuk membuka';

  @override
  String get dropZoneSubtitle =>
      'atau klik untuk memilih\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Arsip yang dilindungi';

  @override
  String get passwordDialogSubtitle => 'Masukkan sandi';

  @override
  String get passwordDialogHint => 'Sandi…';

  @override
  String get cancel => 'Batal';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get logPanelTitle => 'Log';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entri',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Tidak ada aktivitas';

  @override
  String get progressExtracting => 'Mengekstrak…';

  @override
  String get progressDone => 'Ekstraksi selesai!';

  @override
  String get treeLoading => 'Membaca arsip…';

  @override
  String get treeError => 'Kesalahan';

  @override
  String get treeEmpty => 'Tidak ada arsip yang dimuat';

  @override
  String get treeEmptyHint => 'Lepaskan file untuk melihat isinya';

  @override
  String get treeSearch => 'Cari…';

  @override
  String get treeColName => 'Nama';

  @override
  String get treeColSize => 'Ukuran';

  @override
  String get treeColModified => 'Diubah';

  @override
  String get treeOpenTooltip => 'Klik dua kali untuk membuka';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Tujuan';

  @override
  String get sectionSecurity => 'Keamanan';

  @override
  String get destinationSameFolder => 'Folder yang sama dengan arsip';

  @override
  String get subfolderCreate => 'Ekstrak ke subfolder';

  @override
  String get subfolderDefault => 'bernama menurut arsip';

  @override
  String get passwordNone => 'Tanpa sandi';

  @override
  String get passwordSetLabel => 'Sandi telah ditetapkan';

  @override
  String get passwordEdit => 'Edit';

  @override
  String get passwordDefine => 'Tetapkan';

  @override
  String get btnExtract => 'Ekstrak';

  @override
  String get btnExtracting => 'Mengekstrak...';

  @override
  String get btnDone => 'Selesai ✓';

  @override
  String get btnReset => 'Setel Ulang';

  @override
  String binaryWarning(String cmd) {
    return '7zip tidak ditemukan. Instal: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Buka arsip';

  @override
  String get pickOutputDialogTitle => 'Pilih folder tujuan';

  @override
  String logBinaryFound(String path) {
    return '7zip ditemukan: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip tidak ditemukan. Instal melalui Homebrew (macOS) atau 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Tidak ada arsip yang dikenali dalam file yang dilepaskan.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Format tidak didukung: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Membaca arsip: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entri ditemukan dalam arsip.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Arsip terenkripsi — sandi diperlukan.';

  @override
  String get logFilePasswordRequired => 'File terenkripsi — sandi diperlukan.';

  @override
  String get logPasswordDefined => 'Sandi telah ditetapkan.';

  @override
  String get logCancelled => 'Dibatalkan.';

  @override
  String logDestination(String path) {
    return 'Tujuan: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Mengekstrak ke: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Ekstraksi selesai di: $path';
  }

  @override
  String get logReset => 'Setel ulang.';

  @override
  String logOpening(String name) {
    return 'Membuka $name…';
  }

  @override
  String logOpened(String name) {
    return 'Dibuka: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Kesalahan saat membuka: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Kesalahan ekstraksi: $error';
  }

  @override
  String logError(String error) {
    return 'Kesalahan: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Arsip terpisah yang tidak lengkap — bagian hilang. Tidak dapat menampilkan konten.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Arsip terpisah yang tidak lengkap — bagian hilang. Konten yang ditampilkan mungkin tidak lengkap.';

  @override
  String get logExtractionSplitError => 'Ekstraksi gagal: bagian hilang.';

  @override
  String get errorSplitArchive =>
      '⚠️ Arsip terpisah yang tidak lengkap — pastikan semua bagian ada di folder yang sama.';

  @override
  String get tabDecompression => 'Dekompresi';

  @override
  String get tabCompression => 'Kompresi';

  @override
  String get tabConsoleApi => 'Konsol API';

  @override
  String get tabComingSoon => 'Segera hadir';

  @override
  String get compLabelArchiveName => 'Nama arsip';

  @override
  String get compLabelDestination => 'Tujuan';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Tingkat kompresi';

  @override
  String get compLabelSecurity => 'Keamanan';

  @override
  String get compLabelAdvanced => 'Opsi lanjutan';

  @override
  String get compLabelSplit => 'Pisahkan';

  @override
  String get compSizeFolder => 'folder';

  @override
  String get compDestSameFolder => 'Folder yang sama dengan file';

  @override
  String compLevelNotApplicable(String format) {
    return 'Tidak berlaku untuk .$format';
  }

  @override
  String get compHeaderEncryption => 'Enkripsi header diaktifkan';

  @override
  String get compSplitNone => 'Tidak ada';

  @override
  String get compBtnCompress => 'Kompres';

  @override
  String get compBtnCompressing => 'Mengompresi…';

  @override
  String get compAddFiles => 'Tambah file';

  @override
  String get compAddFolder => 'Tambah folder';

  @override
  String get compDropToAdd => 'Lepas untuk menambah';

  @override
  String get compDropHint => 'Lepas file atau folder di sini';

  @override
  String get compDropSubtitle => 'File akan ditambahkan ke arsip';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Mengompresi → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arsip dibuat: $path';
  }
}
