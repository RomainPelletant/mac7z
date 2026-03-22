// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get dropZoneDrop => 'Soltar un archivo';

  @override
  String get dropZoneRelease => 'Soltar para abrir';

  @override
  String get dropZoneSubtitle =>
      'o haz clic para seleccionar\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '$count archivo',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Archivo protegido';

  @override
  String get passwordDialogSubtitle => 'Ingresa la contraseña';

  @override
  String get passwordDialogHint => 'Contraseña…';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get logPanelTitle => 'Registro';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entradas',
      one: '$count entrada',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Sin actividad';

  @override
  String get progressExtracting => 'Extrayendo…';

  @override
  String get progressDone => '¡Extracción completada!';

  @override
  String get treeLoading => 'Leyendo archivo…';

  @override
  String get treeError => 'Error';

  @override
  String get treeEmpty => 'Sin archivo cargado';

  @override
  String get treeEmptyHint => 'Suelta un archivo para ver su contenido';

  @override
  String get treeSearch => 'Buscar…';

  @override
  String get treeColName => 'Nombre';

  @override
  String get treeColSize => 'Tamaño';

  @override
  String get treeColModified => 'Modificado';

  @override
  String get treeOpenTooltip => 'Doble clic para abrir';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '$count elemento',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destino';

  @override
  String get sectionSecurity => 'Seguridad';

  @override
  String get destinationSameFolder => 'Misma carpeta que el archivo';

  @override
  String get subfolderCreate => 'Extraer en una subcarpeta';

  @override
  String get subfolderDefault => 'nombrada según el archivo';

  @override
  String get passwordNone => 'Sin contraseña';

  @override
  String get passwordSetLabel => 'Contraseña establecida';

  @override
  String get passwordEdit => 'Editar';

  @override
  String get passwordDefine => 'Establecer';

  @override
  String get btnExtract => 'Extraer';

  @override
  String get btnExtracting => 'Extrayendo...';

  @override
  String get btnDone => 'Hecho ✓';

  @override
  String get btnReset => 'Restablecer';

  @override
  String binaryWarning(String cmd) {
    return '7zip no encontrado. Instálalo: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Abrir un archivo';

  @override
  String get pickOutputDialogTitle => 'Elige carpeta de destino';

  @override
  String logBinaryFound(String path) {
    return '7zip encontrado: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip no encontrado. Instálalo vía Homebrew (macOS) o 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Ningún archivo reconocido en los archivos soltados.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Formato no soportado: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Leyendo archivo: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entradas encontradas en el archivo.',
      one: '1 entrada encontrada en el archivo.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired =>
      'Archivo encriptado — contraseña requerida.';

  @override
  String get logFilePasswordRequired =>
      'Archivo encriptado — contraseña requerida.';

  @override
  String get logPasswordDefined => 'Contraseña establecida.';

  @override
  String get logCancelled => 'Cancelado.';

  @override
  String logDestination(String path) {
    return 'Destino: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Extrayendo a: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extracción completada en: $path';
  }

  @override
  String get logReset => 'Restablecido.';

  @override
  String logOpening(String name) {
    return 'Abriendo $name…';
  }

  @override
  String logOpened(String name) {
    return 'Abierto: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Error al abrir: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Error de extracción: $error';
  }

  @override
  String logError(String error) {
    return 'Error: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Archivo dividido incompleto — faltan partes. No se puede mostrar el contenido.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Archivo dividido incompleto — faltan partes. El contenido mostrado puede estar incompleto.';

  @override
  String get logExtractionSplitError => 'La extracción falló: faltan partes.';

  @override
  String get errorSplitArchive =>
      '⚠️ Archivo dividido incompleto — asegúrate de que todas las partes estén en la misma carpeta.';

  @override
  String get tabDecompression => 'Descompresión';

  @override
  String get tabCompression => 'Compresión';

  @override
  String get tabConsoleApi => 'Consola API';

  @override
  String get tabComingSoon => 'Próximamente';

  @override
  String get compLabelArchiveName => 'Nombre del archivo';

  @override
  String get compLabelDestination => 'Destino';

  @override
  String get compLabelFormat => 'Formato';

  @override
  String get compLabelCompression => 'Nivel de compresión';

  @override
  String get compLabelSecurity => 'Seguridad';

  @override
  String get compLabelSplit => 'Dividir';

  @override
  String get compSizeFolder => 'carpeta';

  @override
  String get compDestSameFolder => 'Misma carpeta que los archivos';

  @override
  String compLevelNotApplicable(String format) {
    return 'No aplicable para .$format';
  }

  @override
  String get compHeaderEncryption => 'Cifrado de encabezado activado';

  @override
  String get compSplitNone => 'Ninguno';

  @override
  String get compBtnCompress => 'Comprimir';

  @override
  String get compBtnCompressing => 'Comprimiendo…';

  @override
  String get compAddFiles => 'Añadir archivos';

  @override
  String get compAddFolder => 'Añadir carpeta';

  @override
  String get compDropToAdd => 'Soltar para añadir';

  @override
  String get compDropHint => 'Suelta archivos o carpetas aquí';

  @override
  String get compDropSubtitle => 'Los archivos se añadirán al archivo';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Comprimiendo → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archivo creado: $path';
  }
}

/// The translations for Spanish Castilian, as used in Latin America and the Caribbean (`es_419`).
class AppLocalizationsEs419 extends AppLocalizationsEs {
  AppLocalizationsEs419() : super('es_419');

  @override
  String get dropZoneDrop => 'Suelta un archivo';

  @override
  String get dropZoneRelease => 'Suelta para abrir';

  @override
  String get dropZoneSubtitle =>
      'o haz clic para seleccionar\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count archivos',
      one: '$count archivo',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Archivo protegido';

  @override
  String get passwordDialogSubtitle => 'Ingresa la contraseña';

  @override
  String get passwordDialogHint => 'Contraseña…';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get logPanelTitle => 'Registro';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entradas',
      one: '$count entrada',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Sin actividad';

  @override
  String get progressExtracting => 'Extrayendo…';

  @override
  String get progressDone => '¡Extracción completada!';

  @override
  String get treeLoading => 'Leyendo archivo…';

  @override
  String get treeError => 'Error';

  @override
  String get treeEmpty => 'Sin archivo cargado';

  @override
  String get treeEmptyHint => 'Suelta un archivo para ver su contenido';

  @override
  String get treeSearch => 'Buscar…';

  @override
  String get treeColName => 'Nombre';

  @override
  String get treeColSize => 'Tamaño';

  @override
  String get treeColModified => 'Modificado';

  @override
  String get treeOpenTooltip => 'Doble clic para abrir';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '$count elemento',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destino';

  @override
  String get sectionSecurity => 'Seguridad';

  @override
  String get destinationSameFolder => 'Misma carpeta que el archivo';

  @override
  String get subfolderCreate => 'Extraer a una subcarpeta';

  @override
  String get subfolderDefault => 'nombrada según el archivo';

  @override
  String get passwordNone => 'Sin contraseña';

  @override
  String get passwordSetLabel => 'Contraseña establecida';

  @override
  String get passwordEdit => 'Editar';

  @override
  String get passwordDefine => 'Establecer';

  @override
  String get btnExtract => 'Extraer';

  @override
  String get btnExtracting => 'Extrayendo...';

  @override
  String get btnDone => 'Hecho ✓';

  @override
  String get btnReset => 'Restablecer';

  @override
  String binaryWarning(String cmd) {
    return '7zip no encontrado. Instálalo: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Abrir un archivo';

  @override
  String get pickOutputDialogTitle => 'Elige carpeta de destino';

  @override
  String logBinaryFound(String path) {
    return '7zip encontrado: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip no encontrado. Instálalo vía Homebrew (macOS) o 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Ningún archivo reconocido en los archivos soltados.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Formato no soportado: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Leyendo archivo: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entradas encontradas en el archivo.',
      one: '1 entrada encontrada en el archivo.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired =>
      'Archivo encriptado — contraseña requerida.';

  @override
  String get logFilePasswordRequired =>
      'Archivo encriptado — contraseña requerida.';

  @override
  String get logPasswordDefined => 'Contraseña establecida.';

  @override
  String get logCancelled => 'Cancelado.';

  @override
  String logDestination(String path) {
    return 'Destino: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Extrayendo a: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extracción completada en: $path';
  }

  @override
  String get logReset => 'Restablecido.';

  @override
  String logOpening(String name) {
    return 'Abriendo $name…';
  }

  @override
  String logOpened(String name) {
    return 'Abierto: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Error al abrir: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Error de extracción: $error';
  }

  @override
  String logError(String error) {
    return 'Error: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Archivo dividido incompleto — faltan partes. No se puede mostrar el contenido.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Archivo dividido incompleto — faltan partes. El contenido mostrado puede estar incompleto.';

  @override
  String get logExtractionSplitError => 'La extracción falló: faltan partes.';

  @override
  String get errorSplitArchive =>
      '⚠️ Archivo dividido incompleto — asegúrate de que todas las partes estén en la misma carpeta.';

  @override
  String get tabDecompression => 'Descompresión';

  @override
  String get tabCompression => 'Compresión';

  @override
  String get tabConsoleApi => 'Consola API';

  @override
  String get tabComingSoon => 'Próximamente';

  @override
  String get compLabelArchiveName => 'Nombre del archivo';

  @override
  String get compLabelDestination => 'Destino';

  @override
  String get compLabelFormat => 'Formato';

  @override
  String get compLabelCompression => 'Nivel de compresión';

  @override
  String get compLabelSecurity => 'Seguridad';

  @override
  String get compLabelSplit => 'Dividir';

  @override
  String get compSizeFolder => 'carpeta';

  @override
  String get compDestSameFolder => 'Misma carpeta que los archivos';

  @override
  String compLevelNotApplicable(String format) {
    return 'No aplicable para .$format';
  }

  @override
  String get compHeaderEncryption => 'Cifrado de encabezado activado';

  @override
  String get compSplitNone => 'Ninguno';

  @override
  String get compBtnCompress => 'Comprimir';

  @override
  String get compBtnCompressing => 'Comprimiendo…';

  @override
  String get compAddFiles => 'Añadir archivos';

  @override
  String get compAddFolder => 'Añadir carpeta';

  @override
  String get compDropToAdd => 'Suelta para añadir';

  @override
  String get compDropHint => 'Suelta archivos o carpetas aquí';

  @override
  String get compDropSubtitle => 'Los archivos se añadirán al archivo';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: '1 elemento',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Comprimiendo → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archivo creado: $path';
  }
}
