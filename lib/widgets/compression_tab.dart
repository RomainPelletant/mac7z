import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:path/path.dart' as p;
import 'package:mac7z/l10n/app_localizations.dart';
import 'package:mac7z/theme/app_colors.dart';
import '../models/archive_entry.dart';
import '../services/seven_zip_service.dart';
import '../widgets/log_panel.dart';
import '../widgets/progress_bar.dart';
import '../widgets/password_dialog.dart';

// ── Source item model ─────────────────────────────────────────────────────────

class SourceItem {
  final String path;
  final bool isDir;
  final int size;

  const SourceItem({required this.path, required this.isDir, required this.size});

  String get name => p.basename(path);

  String sizeLabel(AppLocalizations l10n) {
    if (isDir) return l10n.compSizeFolder;
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024) return '${(size / 1024 / 1024).toStringAsFixed(1)} MB';
    return '${(size / 1024 / 1024 / 1024).toStringAsFixed(2)} GB';
  }

  IconData get icon {
    if (isDir) return Icons.folder_rounded;
    final ext = name.contains('.') ? name.split('.').last.toLowerCase() : '';
    switch (ext) {
      case 'pdf': return Icons.picture_as_pdf_rounded;
      case 'jpg': case 'jpeg': case 'png': case 'gif': case 'webp': case 'svg':
        return Icons.image_rounded;
      case 'mp4': case 'mov': case 'avi': case 'mkv':
        return Icons.movie_rounded;
      case 'mp3': case 'wav': case 'flac': case 'aac':
        return Icons.audio_file_rounded;
      case 'zip': case '7z': case 'rar': case 'tar': case 'gz':
        return Icons.folder_zip_rounded;
      case 'dart': case 'py': case 'js': case 'ts': case 'swift':
        return Icons.code_rounded;
      default: return Icons.insert_drive_file_rounded;
    }
  }

  Color get iconColor {
    if (isDir) return const Color(0xFFFFD60A);
    final ext = name.contains('.') ? name.split('.').last.toLowerCase() : '';
    switch (ext) {
      case 'pdf': return const Color(0xFFFF453A);
      case 'jpg': case 'jpeg': case 'png': case 'gif': case 'webp':
        return const Color(0xFF30D158);
      case 'mp4': case 'mov': case 'avi': case 'mkv':
        return const Color(0xFFFF9F0A);
      case 'mp3': case 'wav': case 'flac':
        return const Color(0xFFBF5AF2);
      case 'zip': case '7z': case 'rar': case 'tar': case 'gz':
        return const Color(0xFF64D2FF);
      case 'dart': case 'py': case 'js': case 'ts':
        return const Color(0xFF0A84FF);
      default: return const Color(0xFF98989D);
    }
  }
}

// ── Main widget ───────────────────────────────────────────────────────────────

class CompressionTab extends StatefulWidget {
  /// Optional stream of file/folder paths injected from outside
  /// (e.g. from the macOS "Compress with mac7z" Services menu entry).
  final Stream<List<String>>? addFilesStream;

  const CompressionTab({super.key, this.addFilesStream});

  @override
  State<CompressionTab> createState() => _CompressionTabState();
}

class _CompressionTabState extends State<CompressionTab> {
  // Source files/folders
  final List<SourceItem> _items = [];

  // Config
  final _nameCtrl = TextEditingController(text: 'archive');
  String? _destDir;
  ArchiveFormat _format = ArchiveFormat.sevenZip;
  CompressionLevel _level = CompressionLevel.normal;
  String? _password;
  SplitSize _split = SplitSize.none;

  // Status
  ExtractionStatus _status = ExtractionStatus.idle;
  double _progress = 0;
  String _currentFile = '';
  String? _error;
  final List<LogEntry> _logs = [];

  StreamSubscription<List<String>>? _addFilesSub;

  @override
  void initState() {
    super.initState();
    _addFilesSub = widget.addFilesStream?.listen((paths) {
      _addPaths(paths);
    });
  }

  @override
  void dispose() {
    _addFilesSub?.cancel();
    _nameCtrl.dispose();
    super.dispose();
  }

  // ── Logging ───────────────────────────────────────────────────────────────

  void _log(String msg, [LogLevel level = LogLevel.info]) =>
      setState(() => _logs.add(LogEntry(time: DateTime.now(), message: msg, level: level)));

  // ── File management ───────────────────────────────────────────────────────

  Future<void> _addPaths(List<String> paths) async {
    for (final path in paths) {
      if (_items.any((i) => i.path == path)) continue;
      final isDir = await FileSystemEntity.isDirectory(path);
      int size = 0;
      if (!isDir) {
        try { size = await File(path).length(); } catch (_) {}
      }
      if (mounted) setState(() => _items.add(SourceItem(path: path, isDir: isDir, size: size)));
    }
    // Auto-fill archive name from first item
    if (_items.length == 1 && _nameCtrl.text == 'archive') {
      final base = p.basenameWithoutExtension(_items.first.name);
      if (mounted) setState(() => _nameCtrl.text = base);
    }
  }

  Future<void> _pickFiles() async {
    final l10n = AppLocalizations.of(context)!;
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true, type: FileType.any, dialogTitle: l10n.compAddFiles,
    );
    if (result != null) await _addPaths(result.files.map((f) => f.path!).toList());
  }

  Future<void> _pickFolder() async {
    final l10n = AppLocalizations.of(context)!;
    final dir = await FilePicker.platform.getDirectoryPath(dialogTitle: l10n.compAddFolder);
    if (dir != null) await _addPaths([dir]);
  }

  Future<void> _pickDest() async {
    final l10n = AppLocalizations.of(context)!;
    final dir = await FilePicker.platform.getDirectoryPath(dialogTitle: l10n.pickOutputDialogTitle);
    if (dir != null) setState(() => _destDir = dir);
  }

  void _removeItem(int i) => setState(() => _items.removeAt(i));

  // ── Compression ───────────────────────────────────────────────────────────

  String _outputPath() {
    final base = _destDir ??
        (_items.isNotEmpty ? p.dirname(_items.first.path) : Directory.current.path);
    final name = _nameCtrl.text.trim().isEmpty ? 'archive' : _nameCtrl.text.trim();
    return p.join(base, '$name.${_format.label}');
  }

  Future<void> _compress() async {
    if (_items.isEmpty) return;
    final outPath = _outputPath();

    setState(() {
      _status = ExtractionStatus.extracting;
      _progress = 0;
      _currentFile = '';
      _error = null;
    });
    final l10n = AppLocalizations.of(context)!;
    _log(l10n.compLogStarted(outPath));

    try {
      await for (final prog in SevenZipService.compress(
        sourcePaths: _items.map((i) => i.path).toList(),
        outputPath: outPath,
        format: _format,
        level: _level,
        password: _password,
        splitSize: _split,
        onLog: (l) => _log(l),
      )) {
        if (!mounted) break;
        setState(() {
          if (prog.percent >= 0) _progress = prog.percent;
          _currentFile = prog.currentFile;
          if (prog.done) {
            _progress = 100;
            _status = ExtractionStatus.done;
          }
        });
      }
      _log(l10n.compLogDone(outPath), LogLevel.success);
    } on Exception catch (e) {
      setState(() { _status = ExtractionStatus.error; _error = e.toString(); });
      _log(l10n.logError(e.toString()), LogLevel.error);
    }
  }

  void _reset() {
    setState(() {
      _items.clear();
      _destDir = null;
      _format = ArchiveFormat.sevenZip;
      _level = CompressionLevel.normal;
      _password = null;
      _split = SplitSize.none;
      _status = ExtractionStatus.idle;
      _progress = 0;
      _currentFile = '';
      _error = null;
    });
    _nameCtrl.text = 'archive';
    _log(AppLocalizations.of(context)!.logReset);
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        // ── Left panel ──────────────────────────────────────────────────────
        SizedBox(
          width: 300,
          child: _LeftPanel(
            nameCtrl: _nameCtrl,
            destDir: _destDir,
            format: _format,
            level: _level,
            password: _password,
            split: _split,
            status: _status,
            hasItems: _items.isNotEmpty,
            onPickDest: _pickDest,
            onFormatChanged: (f) => setState(() => _format = f),
            onLevelChanged: (l) => setState(() => _level = l),
            onSplitChanged: (s) => setState(() => _split = s),
            onSetPassword: () async {
              final pwd = await showDialog<String>(
                context: context, builder: (_) => const PasswordDialog(),
              );
              if (pwd != null) setState(() => _password = pwd);
            },
            onCompress: _compress,
            onReset: _reset,
          ),
        ),
        VerticalDivider(width: 1, color: theme.dividerColor),
        // ── Right panel ─────────────────────────────────────────────────────
        Expanded(
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: _FileList(
                  items: _items,
                  status: _status,
                  error: _error,
                  onDrop: _addPaths,
                  onPickFiles: _pickFiles,
                  onPickFolder: _pickFolder,
                  onRemove: _removeItem,
                ),
              ),
              Divider(height: 1, color: theme.dividerColor),
              if (_status == ExtractionStatus.extracting || _status == ExtractionStatus.done)
                ExtractionProgressBar(
                  progress: _progress,
                  currentFile: _currentFile,
                  done: _status == ExtractionStatus.done,
                ),
              Divider(height: 1, color: theme.dividerColor),
              Expanded(
                flex: 3,
                child: LogPanel(logs: _logs),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Left panel ────────────────────────────────────────────────────────────────

class _LeftPanel extends StatelessWidget {
  final TextEditingController nameCtrl;
  final String? destDir;
  final ArchiveFormat format;
  final CompressionLevel level;
  final String? password;
  final SplitSize split;
  final ExtractionStatus status;
  final bool hasItems;
  final VoidCallback onPickDest;
  final ValueChanged<ArchiveFormat> onFormatChanged;
  final ValueChanged<CompressionLevel> onLevelChanged;
  final ValueChanged<SplitSize> onSplitChanged;
  final VoidCallback onSetPassword;
  final VoidCallback onCompress;
  final VoidCallback onReset;

  const _LeftPanel({
    required this.nameCtrl,
    required this.destDir,
    required this.format,
    required this.level,
    required this.password,
    required this.split,
    required this.status,
    required this.hasItems,
    required this.onPickDest,
    required this.onFormatChanged,
    required this.onLevelChanged,
    required this.onSplitChanged,
    required this.onSetPassword,
    required this.onCompress,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    final isRunning = status == ExtractionStatus.extracting;
    final isDone = status == ExtractionStatus.done;

    return Container(
      color: c.bg,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Archive name ───────────────────────────────────────────────
            _Label(l10n.compLabelArchiveName),
            const SizedBox(height: 8),
            TextField(
              controller: nameCtrl,
              style: TextStyle(fontSize: 13, color: c.textPrimary),
              decoration: InputDecoration(
                suffixText: '.${format.label}',
                suffixStyle: TextStyle(fontSize: 12, color: c.textTertiary),
                filled: true,
                fillColor: c.surface,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: c.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: c.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: c.accent, width: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ── Destination ───────────────────────────────────────────────
            _Label(l10n.compLabelDestination),
            const SizedBox(height: 8),
            _PickerRow(
              icon: Icons.folder_open_rounded,
              iconColor: const Color(0xFFFFD60A),
              label: destDir != null ? p.basename(destDir!) : l10n.compDestSameFolder,
              labelColor: destDir != null ? c.textPrimary : c.textTertiary,
              tooltip: destDir,
              onTap: onPickDest,
            ),
            const SizedBox(height: 16),

            // ── Format ────────────────────────────────────────────────────
            _Label(l10n.compLabelFormat),
            const SizedBox(height: 8),
            _SegmentedPicker<ArchiveFormat>(
              values: ArchiveFormat.values,
              selected: format,
              labelOf: (f) => f.label,
              onChanged: onFormatChanged,
            ),
            const SizedBox(height: 16),

            // ── Compression level ─────────────────────────────────────────
            _Label(l10n.compLabelCompression),
            const SizedBox(height: 8),
            if (format.supportsLevel)
              _SegmentedPicker<CompressionLevel>(
                values: CompressionLevel.values,
                selected: level,
                labelOf: (l) => l.label,
                onChanged: onLevelChanged,
              )
            else
              _DisabledRow(l10n.compLevelNotApplicable(format.label)),
            const SizedBox(height: 16),

            // ── Password ──────────────────────────────────────────────────
            _Label(l10n.compLabelSecurity),
            const SizedBox(height: 8),
            _PickerRow(
              icon: password != null ? Icons.lock_rounded : Icons.lock_open_rounded,
              iconColor: password != null ? c.accent : c.textTertiary,
              label: password != null ? l10n.passwordSetLabel : l10n.passwordNone,
              labelColor: password != null ? c.accent : c.textTertiary,
              trailingLabel: password != null ? l10n.passwordEdit : l10n.passwordDefine,
              onTap: onSetPassword,
              highlighted: password != null,
            ),
            if (format == ArchiveFormat.sevenZip && password != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    Icon(Icons.shield_rounded, size: 11, color: c.success.withOpacity(0.8)),
                    const SizedBox(width: 4),
                    Text(
                      l10n.compHeaderEncryption,
                      style: TextStyle(fontSize: 10, color: c.success.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),

            // ── Split ─────────────────────────────────────────────────────
            _Label(l10n.compLabelSplit),
            const SizedBox(height: 8),
            _SegmentedPicker<SplitSize>(
              values: SplitSize.values,
              selected: split,
              labelOf: (s) => s == SplitSize.none ? l10n.compSplitNone : s.label,
              onChanged: onSplitChanged,
            ),
            const SizedBox(height: 28),

            // ── Buttons ───────────────────────────────────────────────────
            if (!isDone)
              _ActionButton(
                label: isRunning ? l10n.compBtnCompressing : l10n.compBtnCompress,
                icon: isRunning ? Icons.hourglass_top_rounded : Icons.archive_rounded,
                color: c.accent,
                enabled: hasItems && !isRunning,
                onPressed: onCompress,
              )
            else
              _ActionButton(
                label: l10n.btnDone,
                icon: Icons.check_circle_rounded,
                color: c.success,
                enabled: false,
                onPressed: () {},
              ),
            const SizedBox(height: 10),
            _ActionButton(
              label: l10n.btnReset,
              icon: Icons.refresh_rounded,
              color: c.surface3,
              enabled: hasItems || isDone,
              onPressed: onReset,
            ),
          ],
        ),
      ),
    );
  }
}

// ── File list (right panel) ───────────────────────────────────────────────────

class _FileList extends StatefulWidget {
  final List<SourceItem> items;
  final ExtractionStatus status;
  final String? error;
  final Future<void> Function(List<String>) onDrop;
  final VoidCallback onPickFiles;
  final VoidCallback onPickFolder;
  final void Function(int) onRemove;

  const _FileList({
    required this.items,
    required this.status,
    required this.error,
    required this.onDrop,
    required this.onPickFiles,
    required this.onPickFolder,
    required this.onRemove,
  });

  @override
  State<_FileList> createState() => _FileListState();
}

class _FileListState extends State<_FileList> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return DropTarget(
      onDragDone: (d) {
        setState(() => _hovering = false);
        widget.onDrop(d.files.map((f) => f.path).toList());
      },
      onDragEntered: (_) => setState(() => _hovering = true),
      onDragExited: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: _hovering
            ? c.accent.withOpacity(0.06)
            : c.bg,
        child: widget.items.isEmpty
            ? _EmptyDropHint(
                hovering: _hovering,
                onPickFiles: widget.onPickFiles,
                onPickFolder: widget.onPickFolder,
              )
            : _ItemsView(
                items: widget.items,
                onRemove: widget.onRemove,
                onPickFiles: widget.onPickFiles,
                onPickFolder: widget.onPickFolder,
                error: widget.error,
              ),
      ),
    );
  }
}

class _EmptyDropHint extends StatelessWidget {
  final bool hovering;
  final VoidCallback onPickFiles;
  final VoidCallback onPickFolder;

  const _EmptyDropHint({
    required this.hovering,
    required this.onPickFiles,
    required this.onPickFolder,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    final color = hovering ? c.accent : c.textTertiary;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: hovering
                  ? c.accent.withOpacity(0.12)
                  : c.surface,
              border: Border.all(
                color: hovering
                    ? c.accent.withOpacity(0.5)
                    : c.border,
              ),
            ),
            child: Icon(Icons.add_to_photos_rounded, size: 42, color: color),
          ),
          const SizedBox(height: 18),
          Text(
            hovering ? l10n.compDropToAdd : l10n.compDropHint,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: hovering ? c.accent : c.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l10n.compDropSubtitle,
            style: TextStyle(fontSize: 12, color: c.textTertiary),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SmallBtn(label: l10n.compAddFiles, icon: Icons.add_rounded, onTap: onPickFiles),
              const SizedBox(width: 10),
              _SmallBtn(label: l10n.compAddFolder, icon: Icons.folder_rounded, onTap: onPickFolder),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 200.ms);
  }
}

class _ItemsView extends StatelessWidget {
  final List<SourceItem> items;
  final void Function(int) onRemove;
  final VoidCallback onPickFiles;
  final VoidCallback onPickFolder;
  final String? error;

  const _ItemsView({
    required this.items,
    required this.onRemove,
    required this.onPickFiles,
    required this.onPickFolder,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    return Column(
      children: [
        // Toolbar
        Container(
          height: 38,
          color: c.surface,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Text(
                l10n.compItemCount(items.length),
                style: TextStyle(fontSize: 12, color: c.textSecondary),
              ),
              const Spacer(),
              _SmallBtn(label: l10n.compAddFiles, icon: Icons.add_rounded, onTap: onPickFiles),
              const SizedBox(width: 8),
              _SmallBtn(label: l10n.compAddFolder, icon: Icons.folder_rounded, onTap: onPickFolder),
            ],
          ),
        ),
        Divider(height: 1, color: c.surface),
        if (error != null)
          Container(
            color: c.error.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.error_rounded, size: 14, color: c.error),
                const SizedBox(width: 8),
                Expanded(child: Text(error!, style: TextStyle(fontSize: 12, color: c.error))),
              ],
            ),
          ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 4),
            itemCount: items.length,
            separatorBuilder: (_, __) => Divider(height: 1, color: c.surface, indent: 50),
            itemBuilder: (context, i) {
              final item = items[i];
              return _ItemRow(
                item: item,
                onRemove: () => onRemove(i),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ItemRow extends StatefulWidget {
  final SourceItem item;
  final VoidCallback onRemove;
  const _ItemRow({required this.item, required this.onRemove});

  @override
  State<_ItemRow> createState() => _ItemRowState();
}

class _ItemRowState extends State<_ItemRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        color: _hovered ? c.border : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          children: [
            Icon(widget.item.icon, size: 20, color: widget.item.iconColor),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: TextStyle(fontSize: 13, color: c.textPrimary),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.item.path,
                    style: TextStyle(fontSize: 10, color: c.textTertiary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              widget.item.sizeLabel(l10n),
              style: TextStyle(fontSize: 11, color: c.textTertiary, fontFamily: 'Menlo'),
            ),
            const SizedBox(width: 6),
            AnimatedOpacity(
              opacity: _hovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 120),
              child: GestureDetector(
                onTap: widget.onRemove,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: c.surface3,
                  ),
                  child: Icon(Icons.close_rounded, size: 11, color: c.textSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Small helpers ─────────────────────────────────────────────────────────────

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);
  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 10, letterSpacing: 1.2,
        color: c.textTertiary, fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _DisabledRow extends StatelessWidget {
  final String text;
  const _DisabledRow(this.text);
  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: c.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.border),
      ),
      child: Text(text, style: TextStyle(fontSize: 12, color: c.surface3)),
    );
  }
}

class _PickerRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final Color labelColor;
  final String? trailingLabel;
  final String? tooltip;
  final VoidCallback onTap;
  final bool highlighted;

  const _PickerRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.labelColor,
    required this.onTap,
    this.trailingLabel,
    this.tooltip,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Tooltip(
      message: tooltip ?? '',
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: highlighted
                  ? c.accent.withOpacity(0.4)
                  : c.border,
            ),
          ),
          child: Row(
            children: [
              Icon(icon, size: 15, color: iconColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: labelColor),
                ),
              ),
              if (trailingLabel != null)
                Text(trailingLabel!,
                  style: TextStyle(fontSize: 11, color: c.accent),
                )
              else
                Icon(Icons.chevron_right_rounded, size: 14, color: c.textTertiary),
            ],
          ),
        ),
      ),
    );
  }
}

/// Segmented control générique (wrap si beaucoup d'éléments).
class _SegmentedPicker<T> extends StatelessWidget {
  final List<T> values;
  final T selected;
  final String Function(T) labelOf;
  final ValueChanged<T> onChanged;

  const _SegmentedPicker({
    required this.values,
    required this.selected,
    required this.labelOf,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: values.map((v) {
        final isSelected = v == selected;
        return GestureDetector(
          onTap: () => onChanged(v),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? c.accent : c.surface,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: isSelected ? c.accent : c.border,
              ),
            ),
            child: Text(
              labelOf(v),
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? Colors.white : c.textSecondary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool enabled;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label, required this.icon,
    required this.color, required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: enabled ? 1.0 : 0.4,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 16, color: Colors.white),
                const SizedBox(width: 8),
                Text(label, style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SmallBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const _SmallBtn({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: c.surface2,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: c.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: c.textSecondary),
            const SizedBox(width: 5),
            Text(label, style: TextStyle(fontSize: 11, color: c.textSecondary)),
          ],
        ),
      ),
    );
  }
}
