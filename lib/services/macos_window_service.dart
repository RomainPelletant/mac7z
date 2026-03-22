import 'package:flutter/services.dart';

/// Service pour contrôler la fenêtre macOS native via method channels.
class MacOSWindowService {
  static const _channel = MethodChannel('com.mac7z/window');

  /// Ferme la fenêtre actuelle.
  static Future<void> closeWindow() async {
    try {
      await _channel.invokeMethod('closeWindow');
    } catch (e) {
      print('Error closing window: $e');
    }
  }

  /// Minimise la fenêtre actuelle.
  static Future<void> minimizeWindow() async {
    try {
      await _channel.invokeMethod('minimizeWindow');
    } catch (e) {
      print('Error minimizing window: $e');
    }
  }

  /// Bascule le mode fullscreen de la fenêtre.
  static Future<void> toggleFullscreen() async {
    try {
      await _channel.invokeMethod('toggleFullscreen');
    } catch (e) {
      print('Error toggling fullscreen: $e');
    }
  }
}
