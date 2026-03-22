import 'package:flutter/material.dart';
import '../services/macos_window_service.dart';

/// macOS-style title bar with functional traffic light buttons (red/yellow/green).
/// Displays close, minimize, and fullscreen buttons with native macOS behavior.
class AppTitleBar extends StatefulWidget {
  const AppTitleBar({super.key});

  @override
  State<AppTitleBar> createState() => _AppTitleBarState();
}

class _AppTitleBarState extends State<AppTitleBar> {
  late Map<String, bool> _hovered;

  @override
  void initState() {
    super.initState();
    _hovered = {'close': false, 'minimize': false, 'fullscreen': false};
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      color: const Color(0xFF2C2C2E),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                // Close button (red)
                _TrafficButton(
                  color: const Color(0xFFFF5F57),
                  hovered: _hovered['close']!,
                  onEnter: () => setState(() => _hovered['close'] = true),
                  onExit: () => setState(() => _hovered['close'] = false),
                  onPressed: () => MacOSWindowService.closeWindow(),
                  icon: Icons.close,
                ),
                const SizedBox(width: 8),
                // Minimize button (yellow)
                _TrafficButton(
                  color: const Color(0xFFFFBD2E),
                  hovered: _hovered['minimize']!,
                  onEnter: () => setState(() => _hovered['minimize'] = true),
                  onExit: () => setState(() => _hovered['minimize'] = false),
                  onPressed: () => MacOSWindowService.minimizeWindow(),
                  icon: Icons.remove,
                ),
                const SizedBox(width: 8),
                // Fullscreen button (green)
                _TrafficButton(
                  color: const Color(0xFF28C840),
                  hovered: _hovered['fullscreen']!,
                  onEnter: () => setState(() => _hovered['fullscreen'] = true),
                  onExit: () => setState(() => _hovered['fullscreen'] = false),
                  onPressed: () => MacOSWindowService.toggleFullscreen(),
                  icon: Icons.fullscreen,
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.folder_zip_rounded, size: 13, color: Color(0xFF636366)),
                  SizedBox(width: 6),
                  Text(
                    'mac7z',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF98989D),
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 80),
        ],
      ),
    );
  }
}

class _TrafficButton extends StatelessWidget {
  final Color color;
  final bool hovered;
  final VoidCallback onEnter;
  final VoidCallback onExit;
  final VoidCallback onPressed;
  final IconData icon;

  const _TrafficButton({
    required this.color,
    required this.hovered,
    required this.onEnter,
    required this.onExit,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onEnter(),
      onExit: (_) => onExit(),
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(hovered ? 1.0 : 0.85),
            boxShadow: hovered
                ? [BoxShadow(color: color.withOpacity(0.4), blurRadius: 4)]
                : null,
          ),
          child: hovered
              ? Center(
                  child: Icon(icon, size: 6, color: Colors.white.withOpacity(0.7)),
                )
              : null,
        ),
      ),
    );
  }
}
