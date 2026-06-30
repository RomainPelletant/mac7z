import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mac7z/l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'services/github_release_updater.dart';
import 'services/update_preferences.dart';
import 'theme/app_colors.dart';
import 'theme/theme_notifier.dart';
import 'screens/home_screen.dart';
import 'services/archive_backend.dart';
import 'services/backend_provider.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
final _releaseUpdater = GitHubReleaseUpdater();
final _updatePreferences = UpdatePreferences();

class Unzipper7App extends StatefulWidget {
  const Unzipper7App({super.key});

  @override
  State<Unzipper7App> createState() => _Unzipper7AppState();
}

class _Unzipper7AppState extends State<Unzipper7App> {
  @override
  void initState() {
    super.initState();
    themeModeNotifier.addListener(_onThemeChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_checkForUpdatesInBackground());
    });
  }

  @override
  void dispose() {
    themeModeNotifier.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() => setState(() {});

  Future<void> _checkForUpdatesInBackground() async {
    if (!mounted) return;
    if (!Platform.isMacOS && !Platform.isLinux) return;

    try {
      final result = await _releaseUpdater.checkForUpdates();
      if (!mounted || !result.hasUpdate) return;

      final skippedVersion = await _updatePreferences.getSkippedVersion();
      if (skippedVersion == result.latestVersion) return;

      final dialogContext = _navigatorKey.currentContext;
      if (dialogContext == null || !dialogContext.mounted || !mounted) return;

      await showDialog<void>(
        context: dialogContext,
        builder: (_) => UpdateAvailableDialog(result: result),
      );
    } catch (_) {
      // Silent background check: errors are logged by the updater service.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7zip Unarchiver',
      debugShowCheckedModeBanner: false,
      themeMode: themeModeNotifier.value,
      theme: _buildTheme(AppColors.light, Brightness.light),
      darkTheme: _buildTheme(AppColors.dark, Brightness.dark),
      navigatorKey: _navigatorKey,
      home: const _AppWithMenu(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  ThemeData _buildTheme(AppColors c, Brightness brightness) {
    const sysFont = '.AppleSystemUIFont';
    const monoFont = 'Menlo';
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: c.bg,
      colorScheme: ColorScheme(
        brightness: brightness,
        background: c.bg,
        surface: c.surface,
        primary: c.accent,
        onPrimary: Colors.white,
        secondary: c.success,
        onSecondary: Colors.white,
        error: c.error,
        onError: Colors.white,
        onBackground: c.textPrimary,
        onSurface: c.textPrimary,
      ),
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light())
          .textTheme
          .copyWith(
            bodyLarge: TextStyle(
                fontFamily: sysFont, color: c.textPrimary, fontSize: 14),
            bodyMedium: TextStyle(
                fontFamily: sysFont, color: c.textSecondary, fontSize: 13),
            labelSmall: TextStyle(
                fontFamily: monoFont, color: c.textSecondary, fontSize: 11),
          )
          .apply(fontFamily: sysFont),
      cardTheme: CardThemeData(
        color: c.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: c.border),
        ),
      ),
      dividerColor: c.border,
      extensions: [c],
      useMaterial3: true,
    );
  }
}

class UpdateAvailableDialog extends StatefulWidget {
  const UpdateAvailableDialog({
    super.key,
    required this.result,
  });

  final UpdateCheckResult result;

  @override
  State<UpdateAvailableDialog> createState() => _UpdateAvailableDialogState();
}

class _UpdateAvailableDialogState extends State<UpdateAvailableDialog> {
  bool _downloading = false;
  double? _progress;
  String? _status;
  String? _error;

  Future<void> _install() async {
    final asset = widget.result.asset;
    if (asset == null) {
      setState(() {
        _error = AppLocalizations.of(context)!.updateNoCompatibleAsset;
      });
      return;
    }

    setState(() {
      _downloading = true;
      _progress = 0;
      _error = null;
      _status = AppLocalizations.of(context)!.updateDownloadingAsset(asset.name);
    });

    try {
      await _updatePreferences.clearSkippedVersion();
      final downloaded = await _releaseUpdater.downloadUpdate(
        asset,
        onProgress: (receivedBytes, totalBytes) {
          if (!mounted || totalBytes <= 0) return;
          setState(() => _progress = receivedBytes / totalBytes);
        },
      );

      if (!mounted) return;
      setState(() {
        _status = AppLocalizations.of(context)!.updateOpeningInstaller;
      });

      await _releaseUpdater.launchInstaller(downloaded);
      if (!mounted) return;
      Navigator.of(context).pop();
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = '$e';
        _downloading = false;
      });
    }
  }

  Future<void> _skipThisVersion() async {
    await _updatePreferences.skipVersion(widget.result.latestVersion);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  String _formatBytes(int bytes) {
    if (bytes <= 0) return 'Unknown';

    const units = ['B', 'KB', 'MB', 'GB'];
    var value = bytes.toDouble();
    var unitIndex = 0;

    while (value >= 1024 && unitIndex < units.length - 1) {
      value /= 1024;
      unitIndex++;
    }

    final digits = value >= 10 || unitIndex == 0 ? 0 : 1;
    return '${value.toStringAsFixed(digits)} ${units[unitIndex]}';
  }

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    final l10n = AppLocalizations.of(context)!;
    final result = widget.result;
    final asset = result.asset;

    return AlertDialog(
      backgroundColor: c.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      title: Text(l10n.updateAvailableTitle),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.updateAvailableMessage(result.latestVersion),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: c.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.updateCurrentVersion(result.currentVersion),
              style: TextStyle(color: c.textSecondary),
            ),
            Text(
              l10n.updateNewVersion(result.latestVersion),
              style: TextStyle(color: c.textSecondary),
            ),
            if (asset != null) ...[
              const SizedBox(height: 10),
              Text(
                l10n.updateFile(asset.name),
                style: TextStyle(color: c.textSecondary),
              ),
              Text(
                l10n.updateSize(_formatBytes(asset.size)),
                style: TextStyle(color: c.textSecondary),
              ),
            ],
            if (_downloading && _progress != null) ...[
              const SizedBox(height: 14),
              LinearProgressIndicator(value: _progress),
            ],
            if (_status != null) ...[
              const SizedBox(height: 10),
              Text(
                _status!,
                style: TextStyle(color: c.textSecondary),
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: 10),
              Text(
                _error!,
                style: TextStyle(color: c.error),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _downloading ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.updateLater, style: TextStyle(color: c.textSecondary)),
        ),
        TextButton(
          onPressed: _downloading ? null : _skipThisVersion,
          child: Text(
            l10n.updateSkipVersion,
            style: TextStyle(color: c.textSecondary),
          ),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: c.accent),
          onPressed: _downloading ? null : _install,
          child: Text(
            _downloading ? l10n.updateDownloading : l10n.updateInstall,
          ),
        ),
      ],
    );
  }
}

class _AppWithMenu extends StatelessWidget {
  const _AppWithMenu();

  @override
  Widget build(BuildContext context) {
    if (!Platform.isMacOS) return const HomeScreen();

    return PlatformMenuBar(
      menus: [
        PlatformMenu(
          label: 'mac7z',
          menus: [
            PlatformMenuItem(
              label: 'À propos de mac7z',
              onSelected: () {
                PackageInfo.fromPlatform().then((info) {
                  showLicensePage(
                    context: _navigatorKey.currentContext!,
                    applicationName: 'mac7z',
                    applicationVersion: info.version,
                    applicationIcon:
                        const Icon(Icons.folder_zip_rounded, size: 48),
                  );
                });
              },
            ),
            PlatformMenuItem(
              label: 'Préférences…',
              shortcut: const SingleActivator(LogicalKeyboardKey.comma,
                  meta: true),
              onSelected: () => showDialog(
                context: _navigatorKey.currentContext!,
                builder: (_) => const PreferencesDialog(),
              ),
            ),
            const PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.hide),
            const PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.hideOtherApplications),
            const PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.showAllApplications),
            const PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.quit),
          ],
        ),
      ],
      child: const HomeScreen(),
    );
  }
}

// ── Preferences dialog ────────────────────────────────────────────────────────

class PreferencesDialog extends StatefulWidget {
  const PreferencesDialog();

  @override
  State<PreferencesDialog> createState() => _PreferencesDialogState();
}

class _PreferencesDialogState extends State<PreferencesDialog> {
  late BackendType _selected;

  @override
  void initState() {
    super.initState();
    _selected = BackendProvider.instance.value;
  }

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return AlertDialog(
      backgroundColor: c.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      title: Text(
        'Préférences',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: c.textPrimary,
        ),
      ),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MOTEUR D\'ARCHIVAGE',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
                color: c.textTertiary,
              ),
            ),
            const SizedBox(height: 10),
            ...BackendType.values.map((type) => _BackendTile(
                  type: type,
                  selected: _selected == type,
                  onTap: () => setState(() => _selected = type),
                )),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Annuler', style: TextStyle(color: c.textSecondary)),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: c.accent),
          onPressed: () {
            BackendProvider.instance.setBackend(_selected);
            Navigator.of(context).pop();
          },
          child: const Text('Appliquer'),
        ),
      ],
    );
  }
}

class _BackendTile extends StatelessWidget {
  final BackendType type;
  final bool selected;
  final VoidCallback onTap;

  const _BackendTile({
    required this.type,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? c.accent.withOpacity(0.1) : c.bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? c.accent : c.border,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              type == BackendType.bundled
                  ? Icons.inventory_2_rounded
                  : Icons.computer_rounded,
              size: 18,
              color: selected ? c.accent : c.textSecondary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type.label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: selected ? c.accent : c.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    type.description,
                    style: TextStyle(
                      fontSize: 11,
                      color: c.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle_rounded, size: 16, color: c.accent),
          ],
        ),
      ),
    );
  }
}
