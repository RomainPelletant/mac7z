import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mac7z/l10n/app_localizations.dart';
import 'theme/app_colors.dart';
import 'screens/home_screen.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class Unzipper7App extends StatelessWidget {
  const Unzipper7App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7zip Unarchiver',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
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
    const sysFont  = '.AppleSystemUIFont';
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
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme.copyWith(
        bodyLarge:  TextStyle(fontFamily: sysFont,  color: c.textPrimary,   fontSize: 14),
        bodyMedium: TextStyle(fontFamily: sysFont,  color: c.textSecondary, fontSize: 13),
        labelSmall: TextStyle(fontFamily: monoFont, color: c.textSecondary, fontSize: 11),
      ).apply(fontFamily: sysFont),
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
              onSelected: () => showLicensePage(
                context: _navigatorKey.currentContext!,
                applicationName: 'mac7z',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.folder_zip_rounded, size: 48),
              ),
            ),
            const PlatformProvidedMenuItem(type: PlatformProvidedMenuItemType.hide),
            const PlatformProvidedMenuItem(type: PlatformProvidedMenuItemType.hideOtherApplications),
            const PlatformProvidedMenuItem(type: PlatformProvidedMenuItemType.showAllApplications),
            const PlatformProvidedMenuItem(type: PlatformProvidedMenuItemType.quit),
          ],
        ),
      ],
      child: const HomeScreen(),
    );
  }
}
