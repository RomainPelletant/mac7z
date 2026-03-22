// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get dropZoneDrop => 'Soltar um arquivo';

  @override
  String get dropZoneRelease => 'Soltar para abrir';

  @override
  String get dropZoneSubtitle =>
      'ou clique para selecionar\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '$count arquivo',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Arquivo protegido';

  @override
  String get passwordDialogSubtitle => 'Digite a senha';

  @override
  String get passwordDialogHint => 'Senha…';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get logPanelTitle => 'Registo';

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
  String get logPanelEmpty => 'Sem atividade';

  @override
  String get progressExtracting => 'Extraindo…';

  @override
  String get progressDone => 'Extração concluída!';

  @override
  String get treeLoading => 'Lendo arquivo…';

  @override
  String get treeError => 'Erro';

  @override
  String get treeEmpty => 'Nenhum arquivo carregado';

  @override
  String get treeEmptyHint => 'Solte um arquivo para ver seu conteúdo';

  @override
  String get treeSearch => 'Procurar…';

  @override
  String get treeColName => 'Nome';

  @override
  String get treeColSize => 'Tamanho';

  @override
  String get treeColModified => 'Modificado';

  @override
  String get treeOpenTooltip => 'Duplo clique para abrir';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destino';

  @override
  String get sectionSecurity => 'Segurança';

  @override
  String get destinationSameFolder => 'Mesma pasta que o arquivo';

  @override
  String get subfolderCreate => 'Extrair para uma subpasta';

  @override
  String get subfolderDefault => 'nomeada segundo o arquivo';

  @override
  String get passwordNone => 'Sem senha';

  @override
  String get passwordSetLabel => 'Senha definida';

  @override
  String get passwordEdit => 'Editar';

  @override
  String get passwordDefine => 'Definir';

  @override
  String get btnExtract => 'Extrair';

  @override
  String get btnExtracting => 'Extraindo...';

  @override
  String get btnDone => 'Concluído ✓';

  @override
  String get btnReset => 'Repor';

  @override
  String binaryWarning(String cmd) {
    return '7zip não encontrado. Instale-o: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Abrir um arquivo';

  @override
  String get pickOutputDialogTitle => 'Escolha pasta de destino';

  @override
  String logBinaryFound(String path) {
    return '7zip encontrado: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip não encontrado. Instale via Homebrew (macOS) ou 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Nenhum arquivo reconhecido nos arquivos soltos.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Formato não suportado: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Lendo arquivo: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entradas encontradas no arquivo.',
      one: '1 entrada encontrada no arquivo.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Arquivo encriptado — senha obrigatória.';

  @override
  String get logFilePasswordRequired =>
      'Arquivo encriptado — senha obrigatória.';

  @override
  String get logPasswordDefined => 'Senha definida.';

  @override
  String get logCancelled => 'Cancelado.';

  @override
  String logDestination(String path) {
    return 'Destino: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Extraindo para: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extração concluída em: $path';
  }

  @override
  String get logReset => 'Reposto.';

  @override
  String logOpening(String name) {
    return 'Abrindo $name…';
  }

  @override
  String logOpened(String name) {
    return 'Aberto: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Erro ao abrir: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Erro de extração: $error';
  }

  @override
  String logError(String error) {
    return 'Erro: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Arquivo dividido incompleto — partes ausentes. Impossível exibir conteúdo.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Arquivo dividido incompleto — partes ausentes. O conteúdo exibido pode estar incompleto.';

  @override
  String get logExtractionSplitError => 'Extração falhou: partes ausentes.';

  @override
  String get errorSplitArchive =>
      '⚠️ Arquivo dividido incompleto — certifique-se de que todas as partes estão na mesma pasta.';

  @override
  String get tabDecompression => 'Descompressão';

  @override
  String get tabCompression => 'Compressão';

  @override
  String get tabConsoleApi => 'Console API';

  @override
  String get tabComingSoon => 'Em breve';

  @override
  String get compLabelArchiveName => 'Nome do arquivo';

  @override
  String get compLabelDestination => 'Destino';

  @override
  String get compLabelFormat => 'Formato';

  @override
  String get compLabelCompression => 'Nível de compressão';

  @override
  String get compLabelSecurity => 'Segurança';

  @override
  String get compLabelAdvanced => 'Opções avançadas';

  @override
  String get compLabelSplit => 'Dividir';

  @override
  String get compSizeFolder => 'pasta';

  @override
  String get compDestSameFolder => 'Mesma pasta que os arquivos';

  @override
  String compLevelNotApplicable(String format) {
    return 'Não aplicável para .$format';
  }

  @override
  String get compHeaderEncryption => 'Encriptação de cabeçalho ativada';

  @override
  String get compSplitNone => 'Nenhum';

  @override
  String get compBtnCompress => 'Comprimir';

  @override
  String get compBtnCompressing => 'Comprimindo…';

  @override
  String get compAddFiles => 'Adicionar arquivos';

  @override
  String get compAddFolder => 'Adicionar pasta';

  @override
  String get compDropToAdd => 'Soltar para adicionar';

  @override
  String get compDropHint => 'Solte arquivos ou pastas aqui';

  @override
  String get compDropSubtitle => 'Os arquivos serão adicionados ao arquivo';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Comprimindo → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arquivo criado: $path';
  }
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get dropZoneDrop => 'Solte um arquivo';

  @override
  String get dropZoneRelease => 'Solte para abrir';

  @override
  String get dropZoneSubtitle =>
      'ou clique para selecionar\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count arquivos',
      one: '$count arquivo',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Arquivo protegido';

  @override
  String get passwordDialogSubtitle => 'Insira a senha';

  @override
  String get passwordDialogHint => 'Senha…';

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get logPanelTitle => 'Log';

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
  String get logPanelEmpty => 'Sem atividade';

  @override
  String get progressExtracting => 'Extraindo…';

  @override
  String get progressDone => 'Extração concluída!';

  @override
  String get treeLoading => 'Lendo arquivo…';

  @override
  String get treeError => 'Erro';

  @override
  String get treeEmpty => 'Nenhum arquivo carregado';

  @override
  String get treeEmptyHint => 'Solte um arquivo para ver seu conteúdo';

  @override
  String get treeSearch => 'Procurar…';

  @override
  String get treeColName => 'Nome';

  @override
  String get treeColSize => 'Tamanho';

  @override
  String get treeColModified => 'Modificado';

  @override
  String get treeOpenTooltip => 'Clique duas vezes para abrir';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '$count item',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destino';

  @override
  String get sectionSecurity => 'Segurança';

  @override
  String get destinationSameFolder => 'Mesma pasta do arquivo';

  @override
  String get subfolderCreate => 'Extrair para uma subpasta';

  @override
  String get subfolderDefault => 'nomeada conforme o arquivo';

  @override
  String get passwordNone => 'Sem senha';

  @override
  String get passwordSetLabel => 'Senha definida';

  @override
  String get passwordEdit => 'Editar';

  @override
  String get passwordDefine => 'Definir';

  @override
  String get btnExtract => 'Extrair';

  @override
  String get btnExtracting => 'Extraindo...';

  @override
  String get btnDone => 'Pronto ✓';

  @override
  String get btnReset => 'Resetar';

  @override
  String binaryWarning(String cmd) {
    return '7zip não encontrado. Instale: $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Abrir um arquivo';

  @override
  String get pickOutputDialogTitle => 'Escolha a pasta de destino';

  @override
  String logBinaryFound(String path) {
    return '7zip encontrado: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip não encontrado. Instale via Homebrew (macOS) ou 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Nenhum arquivo reconhecido nos arquivos soltos.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Formato não suportado: $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Lendo arquivo: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entradas encontradas no arquivo.',
      one: '1 entrada encontrada no arquivo.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired =>
      'Arquivo criptografado — senha obrigatória.';

  @override
  String get logFilePasswordRequired =>
      'Arquivo criptografado — senha obrigatória.';

  @override
  String get logPasswordDefined => 'Senha definida.';

  @override
  String get logCancelled => 'Cancelado.';

  @override
  String logDestination(String path) {
    return 'Destino: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Extraindo para: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extração concluída em: $path';
  }

  @override
  String get logReset => 'Resetado.';

  @override
  String logOpening(String name) {
    return 'Abrindo $name…';
  }

  @override
  String logOpened(String name) {
    return 'Aberto: $name';
  }

  @override
  String logOpenError(String error) {
    return 'Erro ao abrir: $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Erro de extração: $error';
  }

  @override
  String logError(String error) {
    return 'Erro: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Arquivo dividido incompleto — partes ausentes. Impossível exibir conteúdo.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Arquivo dividido incompleto — partes ausentes. O conteúdo exibido pode estar incompleto.';

  @override
  String get logExtractionSplitError => 'Falha na extração: partes ausentes.';

  @override
  String get errorSplitArchive =>
      '⚠️ Arquivo dividido incompleto — certifique-se de que todas as partes estão na mesma pasta.';

  @override
  String get tabDecompression => 'Descompressão';

  @override
  String get tabCompression => 'Compressão';

  @override
  String get tabConsoleApi => 'Console API';

  @override
  String get tabComingSoon => 'Em breve';

  @override
  String get compLabelArchiveName => 'Nome do arquivo';

  @override
  String get compLabelDestination => 'Destino';

  @override
  String get compLabelFormat => 'Formato';

  @override
  String get compLabelCompression => 'Nível de compressão';

  @override
  String get compLabelSecurity => 'Segurança';

  @override
  String get compLabelSplit => 'Dividir';

  @override
  String get compSizeFolder => 'pasta';

  @override
  String get compDestSameFolder => 'Mesma pasta dos arquivos';

  @override
  String compLevelNotApplicable(String format) {
    return 'Não aplicável para .$format';
  }

  @override
  String get compHeaderEncryption => 'Criptografia de cabeçalho ativada';

  @override
  String get compSplitNone => 'Nenhum';

  @override
  String get compBtnCompress => 'Comprimir';

  @override
  String get compBtnCompressing => 'Comprimindo…';

  @override
  String get compAddFiles => 'Adicionar arquivos';

  @override
  String get compAddFolder => 'Adicionar pasta';

  @override
  String get compDropToAdd => 'Solte para adicionar';

  @override
  String get compDropHint => 'Solte arquivos ou pastas aqui';

  @override
  String get compDropSubtitle => 'Os arquivos serão adicionados ao arquivo';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count itens',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Comprimindo → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Arquivo criado: $path';
  }
}
