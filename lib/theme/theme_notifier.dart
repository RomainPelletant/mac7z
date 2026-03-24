import 'dart:io';
import 'package:flutter/material.dart';

/// Global theme mode notifier. Toggle it from anywhere to switch
/// between light and dark mode (used on Linux where there is no system menu).
final themeModeNotifier = ValueNotifier<ThemeMode>(
  Platform.isLinux ? ThemeMode.dark : ThemeMode.system,
);
