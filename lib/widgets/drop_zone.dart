import 'package:flutter/material.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mac7z/l10n/app_localizations.dart';
import 'package:mac7z/theme/app_colors.dart';

class DropZoneWidget extends StatefulWidget {
  final bool hasFile;
  final String? fileName;
  final int entryCount;
  final Future<void> Function(List<String>) onDrop;
  final VoidCallback onTap;
  final VoidCallback onClear;

  const DropZoneWidget({
    super.key,
    required this.hasFile,
    required this.fileName,
    required this.entryCount,
    required this.onDrop,
    required this.onTap,
    required this.onClear,
  });

  @override
  State<DropZoneWidget> createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return DropTarget(
      onDragDone: (detail) {
        setState(() => _hovering = false);
        widget.onDrop(detail.files.map((f) => f.path).toList());
      },
      onDragEntered: (_) => setState(() => _hovering = true),
      onDragExited: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: _hovering
                    ? c.accent.withOpacity(0.12)
                    : c.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _hovering
                      ? c.accent
                      : widget.hasFile
                          ? c.success.withOpacity(0.5)
                          : c.border,
                  width: _hovering ? 2 : 1,
                ),
              ),
              child: widget.hasFile
                  ? _FileSummary(name: widget.fileName!, count: widget.entryCount)
                  : _EmptyZone(hovering: _hovering),
            ),
            if (widget.hasFile)
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: widget.onClear,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: c.surface3,
                      border: Border.all(color: Colors.white.withOpacity(0.12)),
                    ),
                    child: const Icon(Icons.close_rounded, size: 13, color: Color(0xFFAEAEB2)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _EmptyZone extends StatelessWidget {
  final bool hovering;
  const _EmptyZone({required this.hovering});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: hovering
                  ? c.accent.withOpacity(0.2)
                  : c.surface2,
            ),
            child: Icon(
              Icons.folder_zip_rounded,
              size: 40,
              color: hovering ? c.accent : c.textTertiary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            hovering ? l10n.dropZoneRelease : l10n.dropZoneDrop,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: hovering ? c.accent : c.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.dropZoneSubtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: c.textTertiary, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _FileSummary extends StatelessWidget {
  final String name;
  final int count;
  const _FileSummary({required this.name, required this.count});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    final ext = name.split('.').last.toUpperCase();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: c.accent.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Icons.folder_zip_rounded, size: 36, color: c.accent),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: c.accent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(ext, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: c.textPrimary),
            ),
          ),
          const SizedBox(height: 4),
          if (count > 0)
            Text(
              l10n.dropZoneFileCount(count),
              style: TextStyle(fontSize: 12, color: c.success),
            ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).scale(begin: const Offset(0.95, 0.95));
  }
}
