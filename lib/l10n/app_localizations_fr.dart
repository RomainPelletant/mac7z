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
}
