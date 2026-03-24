import 'package:flutter/material.dart';

/// Custom color tokens for mac7z, available as a ThemeExtension.
///
/// Usage:
///   final c = Theme.of(context).appColors;
///   Container(color: c.bg)
class AppColors extends ThemeExtension<AppColors> {
  // Backgrounds
  final Color bg; // main scaffold background
  final Color surface; // panel / card
  final Color surface2; // toolbar / elevated row
  final Color surface3; // subtle chip / indicator

  // Tab bar
  final Color tabBar;
  final Color tabIndicator;

  // Borders & dividers
  final Color border;

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;

  // Semantic
  final Color accent;
  final Color success;
  final Color warning;
  final Color error;

  // Specific
  final Color logBg;
  final Color codeText; // monospace / terminal text

  const AppColors({
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.surface3,
    required this.tabBar,
    required this.tabIndicator,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.accent,
    required this.success,
    required this.warning,
    required this.error,
    required this.logBg,
    required this.codeText,
  });

  // ── Dark palette (macOS dark mode) ────────────────────────────────────────
  static const dark = AppColors(
    bg: Color(0xFF1C1C1E),
    surface: Color(0xFF2C2C2E),
    surface2: Color(0xFF3A3A3C),
    surface3: Color(0xFF48484A),
    tabBar: Color(0xFF2C2C2E),
    tabIndicator: Color(0xFF48484A),
    border: Color(0x14FFFFFF), // white 8%
    textPrimary: Color(0xFFF5F5F7),
    textSecondary: Color(0xFF98989D),
    textTertiary: Color(0xFF636366),
    accent: Color(0xFF0A84FF),
    success: Color(0xFF30D158),
    warning: Color(0xFFFF9F0A),
    error: Color(0xFFFF453A),
    logBg: Color(0xFF111113),
    codeText: Color(0xFF64D2FF),
  );

  // ── Light palette (macOS light mode) ──────────────────────────────────────
  static const light = AppColors(
    bg: Color(0xFFF2F2F7),
    surface: Color(0xFFFFFFFF),
    surface2: Color(0xFFE5E5EA),
    surface3: Color(0xFFD1D1D6),
    tabBar: Color(0xFFE9E9EE),
    tabIndicator: Color(0xFFFFFFFF),
    border: Color(0x14000000), // black 8%
    textPrimary: Color(0xFF1C1C1E),
    textSecondary: Color(0xFF636366),
    textTertiary: Color(0xFF8E8E93),
    accent: Color(0xFF007AFF),
    success: Color(0xFF34C759),
    warning: Color(0xFFFF9500),
    error: Color(0xFFFF3B30),
    logBg: Color(0xFFE5E5EA),
    codeText: Color(0xFF0066CC),
  );

  @override
  AppColors copyWith({
    Color? bg,
    Color? surface,
    Color? surface2,
    Color? surface3,
    Color? tabBar,
    Color? tabIndicator,
    Color? border,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? accent,
    Color? success,
    Color? warning,
    Color? error,
    Color? logBg,
    Color? codeText,
  }) =>
      AppColors(
        bg: bg ?? this.bg,
        surface: surface ?? this.surface,
        surface2: surface2 ?? this.surface2,
        surface3: surface3 ?? this.surface3,
        tabBar: tabBar ?? this.tabBar,
        tabIndicator: tabIndicator ?? this.tabIndicator,
        border: border ?? this.border,
        textPrimary: textPrimary ?? this.textPrimary,
        textSecondary: textSecondary ?? this.textSecondary,
        textTertiary: textTertiary ?? this.textTertiary,
        accent: accent ?? this.accent,
        success: success ?? this.success,
        warning: warning ?? this.warning,
        error: error ?? this.error,
        logBg: logBg ?? this.logBg,
        codeText: codeText ?? this.codeText,
      );

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      bg: Color.lerp(bg, other.bg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      surface3: Color.lerp(surface3, other.surface3, t)!,
      tabBar: Color.lerp(tabBar, other.tabBar, t)!,
      tabIndicator: Color.lerp(tabIndicator, other.tabIndicator, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      logBg: Color.lerp(logBg, other.logBg, t)!,
      codeText: Color.lerp(codeText, other.codeText, t)!,
    );
  }
}

/// Convenience extension so you can write `Theme.of(context).appColors`
extension AppColorsX on ThemeData {
  AppColors get appColors => extension<AppColors>() ?? AppColors.dark;
}
