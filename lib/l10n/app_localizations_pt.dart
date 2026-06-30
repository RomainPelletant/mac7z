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

  @override
  String get consoleSectionConfig => 'CONFIGURAÇÃO';

  @override
  String get consoleSectionCommands => 'COMANDOS PRINCIPAIS';

  @override
  String get consoleSectionOptions => 'OPÇÕES COMUNS';

  @override
  String get consoleSectionExamples => 'EXEMPLOS AVANÇADOS';

  @override
  String get consoleHeroSubtitle =>
      'O mac7z passa todos os argumentos diretamente para o binário 7zip incluído. Use-o no Terminal exatamente como usaria o 7zz.';

  @override
  String get consoleSetupIntro =>
      'Crie um alias na sua shell para usar o mac7z como comando padrão no Terminal:';

  @override
  String get consoleSetupOutroMac =>
      'Adicione esta linha ao seu ~/.zshrc ou ~/.bash_profile para a tornar permanente. Depois de configurado, todos os comandos padrão do 7zip funcionam substituindo o 7zz por mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Adicione esta linha ao seu ~/.bashrc ou ~/.zshrc para a tornar permanente. Depois de configurado, todos os comandos padrão do 7zip funcionam substituindo o 7zz por mac7z.';

  @override
  String get consoleCmdList => 'Listar o conteúdo de um arquivo';

  @override
  String get consoleCmdExtractFull => 'Extrair com os caminhos completos';

  @override
  String get consoleCmdExtractToDir => 'Extrair para uma pasta específica';

  @override
  String get consoleCmdExtractFlat => 'Extrair sem subpastas';

  @override
  String get consoleCmdCreateUpdate => 'Criar ou atualizar um arquivo';

  @override
  String get consoleCmdCreateZip => 'Criar um arquivo ZIP';

  @override
  String get consoleCmdTest => 'Testar a integridade do arquivo';

  @override
  String get consoleCmdDelete => 'Eliminar um ficheiro de um arquivo';

  @override
  String get consoleCmdInfo => 'Mostrar informações sobre o 7zip';

  @override
  String get consoleOptPassword => 'Proteger o arquivo com uma palavra-passe';

  @override
  String get consoleOptEncryptHeaders =>
      'Encriptar também os nomes dos ficheiros (apenas 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Nível de compressão (0 = nenhum, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Ativar compressão multi-thread';

  @override
  String get consoleOptSplitVolumes =>
      'Dividir em volumes (ex.: -v100m para 100 MB)';

  @override
  String get consoleOptRecursive => 'Processar subpastas recursivamente';

  @override
  String get consoleOptYesAll => 'Responder \"sim\" a todas as confirmações';

  @override
  String get consoleOptOutputDir => 'Pasta de destino para a extração';

  @override
  String get consoleOptExclude => 'Excluir ficheiros (ex.: -x!*.log)';

  @override
  String get consoleExEncrypted => 'Arquivo encriptado com nomes ocultos';

  @override
  String get consoleExVolumes => 'Arquivo dividido em volumes de 50 MB';

  @override
  String get consoleExUltra => 'Compressão ultra (lenta, ficheiro mínimo)';

  @override
  String get consoleExSingleFile => 'Extrair um único ficheiro';

  @override
  String get consoleExTechnical => 'Listar com detalhes técnicos';

  @override
  String get consoleCopy => 'Copiar';

  @override
  String get consoleCopied => 'Copiado!';

  @override
  String get consoleInfoNote =>
      'O mac7z inclui o seu próprio binário 7zz. Os argumentos são passados exatamente como estão, sem alterações. Qualquer comando válido para o 7zz funciona da mesma forma com o mac7z.';

  @override
  String get updateAvailableTitle => 'Atualização disponível';

  @override
  String updateAvailableMessage(String version) {
    return 'A versão $version está disponível. Quer instalá-la agora?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Versão atual: $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Nova versão: $version';
  }

  @override
  String updateFile(String name) {
    return 'Ficheiro: $name';
  }

  @override
  String updateSize(String size) {
    return 'Tamanho: $size';
  }

  @override
  String get updateInstall => 'Instalar';

  @override
  String get updateLater => 'Mais tarde';

  @override
  String get updateSkipVersion => 'Ignorar esta versão';

  @override
  String get updateDownloading => 'A transferir...';

  @override
  String updateDownloadingAsset(String name) {
    return 'A transferir $name...';
  }

  @override
  String get updateOpeningInstaller => 'A abrir o instalador...';

  @override
  String get updateNoCompatibleAsset =>
      'Nenhum ficheiro compatível foi encontrado nesta release.';
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

  @override
  String get consoleSectionConfig => 'CONFIGURAÇÃO';

  @override
  String get consoleSectionCommands => 'COMANDOS PRINCIPAIS';

  @override
  String get consoleSectionOptions => 'OPÇÕES COMUNS';

  @override
  String get consoleSectionExamples => 'EXEMPLOS AVANÇADOS';

  @override
  String get consoleHeroSubtitle =>
      'O mac7z envia todos os argumentos diretamente para o binário 7zip incluído. Use-o no Terminal exatamente como você usaria o 7zz.';

  @override
  String get consoleSetupIntro =>
      'Crie um alias no seu shell para usar o mac7z como comando padrão no Terminal:';

  @override
  String get consoleSetupOutroMac =>
      'Adicione esta linha ao seu ~/.zshrc ou ~/.bash_profile para deixá-la permanente. Depois de configurado, todos os comandos padrão do 7zip funcionam substituindo o 7zz por mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Adicione esta linha ao seu ~/.bashrc ou ~/.zshrc para deixá-la permanente. Depois de configurado, todos os comandos padrão do 7zip funcionam substituindo o 7zz por mac7z.';

  @override
  String get consoleCmdList => 'Listar o conteúdo de um arquivo';

  @override
  String get consoleCmdExtractFull => 'Extrair com os caminhos completos';

  @override
  String get consoleCmdExtractToDir => 'Extrair para uma pasta específica';

  @override
  String get consoleCmdExtractFlat => 'Extrair sem subpastas';

  @override
  String get consoleCmdCreateUpdate => 'Criar ou atualizar um arquivo';

  @override
  String get consoleCmdCreateZip => 'Criar um arquivo ZIP';

  @override
  String get consoleCmdTest => 'Testar a integridade do arquivo';

  @override
  String get consoleCmdDelete => 'Remover um arquivo de um arquivo compactado';

  @override
  String get consoleCmdInfo => 'Mostrar informações sobre o 7zip';

  @override
  String get consoleOptPassword => 'Proteger o arquivo com senha';

  @override
  String get consoleOptEncryptHeaders =>
      'Criptografar também os nomes dos arquivos (apenas 7z)';

  @override
  String get consoleOptCompressionLevel =>
      'Nível de compressão (0 = nenhum, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Ativar compressão multithread';

  @override
  String get consoleOptSplitVolumes =>
      'Dividir em volumes (ex.: -v100m para 100 MB)';

  @override
  String get consoleOptRecursive => 'Processar subpastas recursivamente';

  @override
  String get consoleOptYesAll => 'Responder \"sim\" a todas as confirmações';

  @override
  String get consoleOptOutputDir => 'Pasta de destino para extração';

  @override
  String get consoleOptExclude => 'Excluir arquivos (ex.: -x!*.log)';

  @override
  String get consoleExEncrypted => 'Arquivo criptografado com nomes ocultos';

  @override
  String get consoleExVolumes => 'Arquivo dividido em volumes de 50 MB';

  @override
  String get consoleExUltra => 'Compressão ultra (lenta, arquivo mínimo)';

  @override
  String get consoleExSingleFile => 'Extrair um único arquivo';

  @override
  String get consoleExTechnical => 'Listar com detalhes técnicos';

  @override
  String get consoleCopy => 'Copiar';

  @override
  String get consoleCopied => 'Copiado!';

  @override
  String get consoleInfoNote =>
      'O mac7z inclui seu próprio binário 7zz. Os argumentos são repassados exatamente como estão, sem modificação. Qualquer comando válido para 7zz funciona da mesma forma com o mac7z.';

  @override
  String get updateAvailableTitle => 'Atualização disponível';

  @override
  String updateAvailableMessage(String version) {
    return 'A versão $version está disponível. Deseja instalá-la agora?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Versão atual: $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Nova versão: $version';
  }

  @override
  String updateFile(String name) {
    return 'Arquivo: $name';
  }

  @override
  String updateSize(String size) {
    return 'Tamanho: $size';
  }

  @override
  String get updateInstall => 'Instalar';

  @override
  String get updateLater => 'Mais tarde';

  @override
  String get updateSkipVersion => 'Pular esta versão';

  @override
  String get updateDownloading => 'Baixando...';

  @override
  String updateDownloadingAsset(String name) {
    return 'Baixando $name...';
  }

  @override
  String get updateOpeningInstaller => 'Abrindo o instalador...';

  @override
  String get updateNoCompatibleAsset =>
      'Nenhum arquivo compatível foi encontrado nesta release.';
}
