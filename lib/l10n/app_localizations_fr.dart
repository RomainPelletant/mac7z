// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get dropZoneDrop => 'Déposer une archive';

  @override
  String get dropZoneRelease => 'Relâcher pour ouvrir';

  @override
  String get dropZoneSubtitle =>
      'ou cliquer pour sélectionner\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fichiers',
      one: '$count fichier',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => 'Archive protégée';

  @override
  String get passwordDialogSubtitle => 'Entrez le mot de passe';

  @override
  String get passwordDialogHint => 'Mot de passe…';

  @override
  String get cancel => 'Annuler';

  @override
  String get confirm => 'Confirmer';

  @override
  String get logPanelTitle => 'Journal';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrées',
      one: '$count entrée',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => 'Aucune activité';

  @override
  String get progressExtracting => 'Extraction en cours…';

  @override
  String get progressDone => 'Extraction terminée !';

  @override
  String get treeLoading => 'Lecture de l\'archive…';

  @override
  String get treeError => 'Erreur';

  @override
  String get treeEmpty => 'Aucune archive chargée';

  @override
  String get treeEmptyHint => 'Déposez un fichier pour voir son contenu';

  @override
  String get treeSearch => 'Rechercher…';

  @override
  String get treeColName => 'Nom';

  @override
  String get treeColSize => 'Taille';

  @override
  String get treeColModified => 'Modifié';

  @override
  String get treeOpenTooltip => 'Double-cliquer pour ouvrir';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count éléments',
      one: '$count élément',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => 'Destination';

  @override
  String get sectionSecurity => 'Sécurité';

  @override
  String get destinationSameFolder => 'Même dossier que l\'archive';

  @override
  String get subfolderCreate => 'Extraire dans un sous-dossier';

  @override
  String get subfolderDefault => 'du nom de l\'archive';

  @override
  String get passwordNone => 'Aucun mot de passe';

  @override
  String get passwordSetLabel => 'Mot de passe défini';

  @override
  String get passwordEdit => 'Modifier';

  @override
  String get passwordDefine => 'Définir';

  @override
  String get btnExtract => 'Extraire';

  @override
  String get btnExtracting => 'Extraction...';

  @override
  String get btnDone => 'Terminé ✓';

  @override
  String get btnReset => 'Réinitialiser';

  @override
  String binaryWarning(String cmd) {
    return '7zip introuvable. Installez-le : $cmd';
  }

  @override
  String get pickFileDialogTitle => 'Ouvrir une archive';

  @override
  String get pickOutputDialogTitle => 'Choisir le dossier de destination';

  @override
  String logBinaryFound(String path) {
    return '7zip trouvé : $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip non trouvé. Installez-le via Homebrew (macOS) ou 7-zip.org (Windows).';

  @override
  String get logNoArchiveRecognized =>
      'Aucune archive reconnue dans les fichiers déposés.';

  @override
  String logUnsupportedFormat(String name) {
    return 'Format non supporté : $name';
  }

  @override
  String logReadingArchive(String name) {
    return 'Lecture de l\'archive : $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count entrées trouvées dans l\'archive.',
      one: '1 entrée trouvée dans l\'archive.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => 'Archive chiffrée — mot de passe requis.';

  @override
  String get logFilePasswordRequired =>
      'Fichier chiffré — mot de passe requis.';

  @override
  String get logPasswordDefined => 'Mot de passe défini.';

  @override
  String get logCancelled => 'Annulé.';

  @override
  String logDestination(String path) {
    return 'Destination : $path';
  }

  @override
  String logExtractionStarted(String path) {
    return 'Extraction vers : $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ Extraction terminée dans : $path';
  }

  @override
  String get logReset => 'Réinitialisé.';

  @override
  String logOpening(String name) {
    return 'Ouverture de $name…';
  }

  @override
  String logOpened(String name) {
    return 'Ouvert : $name';
  }

  @override
  String logOpenError(String error) {
    return 'Erreur à l\'ouverture : $error';
  }

  @override
  String logExtractionError(String error) {
    return 'Erreur d\'extraction : $error';
  }

  @override
  String logError(String error) {
    return 'Erreur : $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ Archive divisée incomplète — morceaux manquants. Impossible d\'afficher le contenu.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ Archive divisée incomplète — morceaux manquants. Le contenu affiché peut être partiel.';

  @override
  String get logExtractionSplitError =>
      'Extraction impossible : morceaux manquants.';

  @override
  String get errorSplitArchive =>
      '⚠️ Archive divisée incomplète — assurez-vous que tous les morceaux sont dans le même dossier.';

  @override
  String get tabDecompression => 'Décompression';

  @override
  String get tabCompression => 'Compression';

  @override
  String get tabConsoleApi => 'Console API';

  @override
  String get tabComingSoon => 'Bientôt disponible';

  @override
  String get compLabelArchiveName => 'Nom de l\'archive';

  @override
  String get compLabelDestination => 'Destination';

  @override
  String get compLabelFormat => 'Format';

  @override
  String get compLabelCompression => 'Taux compression';

  @override
  String get compLabelSecurity => 'Sécurité';

  @override
  String get compLabelAdvanced => 'Options avancées';

  @override
  String get compLabelSplit => 'Diviser';

  @override
  String get compSizeFolder => 'dossier';

  @override
  String get compDestSameFolder => 'Même dossier que les fichiers';

  @override
  String compLevelNotApplicable(String format) {
    return 'Pas applicable pour .$format';
  }

  @override
  String get compHeaderEncryption => 'Chiffrement de l\'entête actif';

  @override
  String get compSplitNone => 'Aucun';

  @override
  String get compBtnCompress => 'Compresser';

  @override
  String get compBtnCompressing => 'Compression…';

  @override
  String get compAddFiles => 'Ajouter des fichiers';

  @override
  String get compAddFolder => 'Ajouter dossier';

  @override
  String get compDropToAdd => 'Déposer pour ajouter';

  @override
  String get compDropHint => 'Déposer des fichiers ou dossiers ici';

  @override
  String get compDropSubtitle => 'Les fichiers seront ajoutés à l\'archive';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return 'Compression → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ Archive créée: $path';
  }

  @override
  String get consoleSectionConfig => 'CONFIGURATION';

  @override
  String get consoleSectionCommands => 'COMMANDES PRINCIPALES';

  @override
  String get consoleSectionOptions => 'OPTIONS COURANTES';

  @override
  String get consoleSectionExamples => 'EXEMPLES AVANCÉS';

  @override
  String get consoleHeroSubtitle =>
      'mac7z passe tous ses arguments directement au binaire 7zip intégré. Utilisez-le depuis Terminal exactement comme vous utiliseriez 7zz.';

  @override
  String get consoleSetupIntro =>
      'Créez un alias dans votre shell pour utiliser mac7z comme commande standard dans le Terminal :';

  @override
  String get consoleSetupOutroMac =>
      'Ajoutez cette ligne à votre ~/.zshrc (ou ~/.bash_profile) pour la rendre permanente. Une fois configuré, toutes les commandes 7zip standard fonctionnent en remplaçant 7zz par mac7z.';

  @override
  String get consoleSetupOutroLinux =>
      'Ajoutez cette ligne à votre ~/.bashrc (ou ~/.zshrc) pour la rendre permanente. Une fois configuré, toutes les commandes 7zip standard fonctionnent en remplaçant 7zz par mac7z.';

  @override
  String get consoleCmdList => 'Lister le contenu d\'une archive';

  @override
  String get consoleCmdExtractFull => 'Extraire avec les chemins complets';

  @override
  String get consoleCmdExtractToDir => 'Extraire vers un dossier spécifique';

  @override
  String get consoleCmdExtractFlat => 'Extraire à plat (sans sous-dossiers)';

  @override
  String get consoleCmdCreateUpdate => 'Créer ou mettre à jour une archive';

  @override
  String get consoleCmdCreateZip => 'Créer une archive ZIP';

  @override
  String get consoleCmdTest => 'Tester l\'intégrité de l\'archive';

  @override
  String get consoleCmdDelete => 'Supprimer un fichier d\'une archive';

  @override
  String get consoleCmdInfo => 'Afficher les informations sur 7zip';

  @override
  String get consoleOptPassword => 'Protéger l\'archive par mot de passe';

  @override
  String get consoleOptEncryptHeaders =>
      'Chiffrer aussi les noms de fichiers (7z seulement)';

  @override
  String get consoleOptCompressionLevel =>
      'Niveau de compression (0 = aucun, 9 = ultra)';

  @override
  String get consoleOptMultithread => 'Activer la compression multi-thread';

  @override
  String get consoleOptSplitVolumes =>
      'Découper en volumes (ex : -v100m pour 100 Mo)';

  @override
  String get consoleOptRecursive => 'Traitement récursif des sous-dossiers';

  @override
  String get consoleOptYesAll => 'Répondre \"oui\" à toutes les confirmations';

  @override
  String get consoleOptOutputDir => 'Dossier de destination pour l\'extraction';

  @override
  String get consoleOptExclude => 'Exclure des fichiers (ex : -x!*.log)';

  @override
  String get consoleExEncrypted => 'Archive chiffrée avec noms masqués';

  @override
  String get consoleExVolumes => 'Archive découpée en volumes de 50 Mo';

  @override
  String get consoleExUltra => 'Compression ultra (lente, fichier minimal)';

  @override
  String get consoleExSingleFile => 'Extraire un seul fichier';

  @override
  String get consoleExTechnical => 'Lister avec détails techniques';

  @override
  String get consoleCopy => 'Copier';

  @override
  String get consoleCopied => 'Copié !';

  @override
  String get consoleInfoNote =>
      'mac7z embarque son propre binaire 7zz. Les arguments sont transmis tels quels, sans modification. Toute commande valide pour 7zz fonctionne de manière identique avec mac7z.';

  @override
  String get updateAvailableTitle => 'Mise à jour disponible';

  @override
  String updateAvailableMessage(String version) {
    return 'La version $version est disponible. Voulez-vous l’installer maintenant ?';
  }

  @override
  String updateCurrentVersion(String version) {
    return 'Version actuelle : $version';
  }

  @override
  String updateNewVersion(String version) {
    return 'Nouvelle version : $version';
  }

  @override
  String updateFile(String name) {
    return 'Fichier : $name';
  }

  @override
  String updateSize(String size) {
    return 'Taille : $size';
  }

  @override
  String get updateInstall => 'Installer';

  @override
  String get updateLater => 'Plus tard';

  @override
  String get updateSkipVersion => 'Sauter cette version';

  @override
  String get updateDownloading => 'Téléchargement...';

  @override
  String updateDownloadingAsset(String name) {
    return 'Téléchargement de $name...';
  }

  @override
  String get updateOpeningInstaller => 'Ouverture de l’installateur...';

  @override
  String get updateNoCompatibleAsset =>
      'Aucun fichier compatible n\'a été trouvé dans cette release.';
}
