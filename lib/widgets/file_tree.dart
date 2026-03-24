import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/material.dart';
import 'package:mac7z/l10n/app_localizations.dart';
import 'package:mac7z/theme/app_colors.dart';
import '../models/archive_entry.dart';

class FileTreeWidget extends StatefulWidget {
  final List<ArchiveEntry> entries;
  final ExtractionStatus status;
  final String? error;

  /// Called when the user double-clicks a non-directory entry.
  final void Function(ArchiveEntry)? onFileOpen;

  const FileTreeWidget({
    super.key,
    required this.entries,
    required this.status,
    required this.error,
    this.onFileOpen,
  });

  /// Sorts archive entries into proper tree order:
  /// directories before files at each level, alphabetically within each level.
  @visibleForTesting
  static List<ArchiveEntry> sortTree(List<ArchiveEntry> entries) =>
      _FileTreeWidgetState._sortTree(entries);

  @override
  State<FileTreeWidget> createState() => _FileTreeWidgetState();
}

class _FileTreeWidgetState extends State<FileTreeWidget> {
  String _search = '';
  late List<ArchiveEntry> _sortedEntries;

  @override
  void initState() {
    super.initState();
    _sortedEntries = _sortTree(widget.entries);
  }

  @override
  void didUpdateWidget(FileTreeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.entries != oldWidget.entries) {
      _sortedEntries = _sortTree(widget.entries);
    }
  }

  /// Trie les entrées pour respecter l'arborescence :
  /// - dossiers avant fichiers à chaque niveau
  /// - ordre alphabétique (insensible à la casse) au sein d'un même niveau
  static List<ArchiveEntry> _sortTree(List<ArchiveEntry> entries) {
    final list = List<ArchiveEntry>.from(entries);
    list.sort((a, b) {
      final aParts = a.path
          .replaceAll('\\', '/')
          .split('/')
          .where((s) => s.isNotEmpty)
          .toList();
      final bParts = b.path
          .replaceAll('\\', '/')
          .split('/')
          .where((s) => s.isNotEmpty)
          .toList();

      for (int i = 0; i < aParts.length && i < bParts.length; i++) {
        final ac = aParts[i].toLowerCase();
        final bc = bParts[i].toLowerCase();
        if (ac == bc) continue;

        // Divergence à ce niveau — même parent (niveaux 0..i-1 identiques)
        final aLast = i == aParts.length - 1;
        final bLast = i == bParts.length - 1;

        if (aLast && bLast) {
          // Même profondeur : dossiers avant fichiers, puis alpha
          if (a.isDirectory && !b.isDirectory) return -1;
          if (!a.isDirectory && b.isDirectory) return 1;
          return ac.compareTo(bc);
        }
        // Profondeurs différentes mais noms distincts → tri alpha sur le composant courant
        return ac.compareTo(bc);
      }

      // Un chemin est préfixe de l'autre → le plus court (parent) en premier
      return aParts.length.compareTo(bParts.length);
    });
    return list;
  }

  List<ArchiveEntry> get _filtered {
    if (_search.isEmpty) return _sortedEntries;
    final q = _search.toLowerCase();
    return _sortedEntries
        .where((e) => e.path.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    if (widget.status == ExtractionStatus.previewing) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(color: c.accent, strokeWidth: 2),
            const SizedBox(height: 16),
            Text(l10n.treeLoading,
                style: TextStyle(color: c.textSecondary, fontSize: 13)),
          ],
        ),
      );
    }

    if (widget.error != null && widget.entries.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline_rounded, color: c.error, size: 48),
            const SizedBox(height: 12),
            Text(l10n.treeError,
                style: TextStyle(
                    color: c.error, fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(widget.error!,
                  style: TextStyle(color: c.textSecondary, fontSize: 12),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      );
    }

    if (widget.entries.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_rounded, size: 64, color: c.surface2),
            const SizedBox(height: 16),
            Text(l10n.treeEmpty,
                style: TextStyle(color: c.textTertiary, fontSize: 14)),
            const SizedBox(height: 4),
            Text(l10n.treeEmptyHint,
                style: TextStyle(color: c.surface3, fontSize: 12)),
          ],
        ),
      );
    }

    final filtered = _filtered;
    final totalSize = widget.entries.fold<int>(0, (s, e) => s + e.size);

    return Column(
      children: [
        // Header with search + stats
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: c.bg,
          child: Row(
            children: [
              // Search
              Expanded(
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: c.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white.withOpacity(0.06)),
                  ),
                  child: TextField(
                    onChanged: (v) => setState(() => _search = v),
                    style: TextStyle(fontSize: 13, color: c.textPrimary),
                    decoration: InputDecoration(
                      hintText: l10n.treeSearch,
                      hintStyle: TextStyle(color: c.surface3, fontSize: 13),
                      prefixIcon: Icon(Icons.search_rounded,
                          size: 16, color: c.textTertiary),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Stats
              Text(
                '${_formatSize(totalSize)} · ${l10n.treeItems(widget.entries.length)}',
                style: TextStyle(fontSize: 11, color: c.textTertiary),
              ),
            ],
          ),
        ),
        // Column headers
        Container(
          color: c.surface,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              Expanded(flex: 5, child: _ColHeader(l10n.treeColName)),
              Expanded(flex: 2, child: _ColHeader(l10n.treeColSize)),
              Expanded(flex: 3, child: _ColHeader(l10n.treeColModified)),
            ],
          ),
        ),
        // File list
        Expanded(
          child: ListView.builder(
            itemCount: filtered.length,
            itemExtent: 36,
            itemBuilder: (ctx, i) {
              final entry = filtered[i];
              return _EntryRow(
                entry: entry,
                index: i,
                onFileOpen: widget.onFileOpen,
              );
            },
          ),
        ),
      ],
    );
  }

  static String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(0)} KB';
    if (bytes < 1024 * 1024 * 1024)
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }
}

class _ColHeader extends StatelessWidget {
  final String label;
  const _ColHeader(this.label);
  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Text(
      label,
      style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: c.textTertiary,
          letterSpacing: 0.5),
    );
  }
}

class _EntryRow extends StatefulWidget {
  final ArchiveEntry entry;
  final int index;
  final void Function(ArchiveEntry)? onFileOpen;

  const _EntryRow({
    required this.entry,
    required this.index,
    this.onFileOpen,
  });

  @override
  State<_EntryRow> createState() => _EntryRowState();
}

class _EntryRowState extends State<_EntryRow> {
  bool _hovered = false;
  bool _opening = false;

  void _handleDoubleTap() {
    final e = widget.entry;
    if (e.isDirectory || widget.onFileOpen == null) return;
    setState(() => _opening = true);
    widget.onFileOpen!(e);
    // Reset the visual "opening" indicator after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _opening = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    final e = widget.entry;
    final depth = e.path.split('/').length - 1;
    final name = e.name.isEmpty ? e.path.split('/').last : e.name;
    final canOpen = !e.isDirectory && widget.onFileOpen != null;

    return MouseRegion(
      cursor: canOpen ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onDoubleTap: canOpen ? _handleDoubleTap : null,
        child: Tooltip(
          message: canOpen ? l10n.treeOpenTooltip : '',
          waitDuration: const Duration(milliseconds: 600),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            color: _opening
                ? c.accent.withOpacity(0.12)
                : _hovered
                    ? Colors.white.withOpacity(0.04)
                    : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Indent
                SizedBox(width: depth * 16.0),
                // Icon — show spinner when opening
                _opening
                    ? SizedBox(
                        width: 15,
                        height: 15,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: c.accent,
                        ),
                      )
                    : Icon(e.icon, size: 15, color: e.iconColor(context)),
                const SizedBox(width: 8),
                Expanded(
                  flex: 5,
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: _opening
                          ? c.accent
                          : e.isDirectory
                              ? c.textPrimary
                              : const Color(0xFFD1D1D6),
                      fontWeight:
                          e.isDirectory ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    e.sizeFormatted,
                    style: TextStyle(
                        fontFamily: 'Menlo',
                        fontSize: 11,
                        color: c.textTertiary),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    e.modified != null
                        ? '${e.modified!.day.toString().padLeft(2, '0')}/${e.modified!.month.toString().padLeft(2, '0')}/${e.modified!.year}'
                        : '—',
                    style: TextStyle(fontSize: 11, color: c.textTertiary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
