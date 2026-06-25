import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mac7z/l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'theme/app_colors.dart';
import 'theme/theme_notifier.dart';
import 'screens/home_screen.dart';
import 'services/archive_backend.dart';
import 'services/backend_provider.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

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
  }

  @override
  void dispose() {
    themeModeNotifier.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() => setState(() {});

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
