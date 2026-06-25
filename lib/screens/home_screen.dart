import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mac7z/l10n/app_localizations.dart';
import 'package:mac7z/theme/app_colors.dart';
import 'package:mac7z/theme/theme_notifier.dart';
import '../models/archive_entry.dart';
import '../services/seven_zip_service.dart';
import '../services/backend_provider.dart';
import '../app.dart' show PreferencesDialog;
import '../services/temp_preview_manager.dart';
import '../utils/archive_utils.dart';
import '../widgets/drop_zone.dart';
import '../widgets/file_tree.dart';
import '../widgets/log_panel.dart';
import '../widgets/progress_bar.dart';
import '../widgets/password_dialog.dart';
import '../widgets/console_tab.dart';
import '../widgets/compression_tab.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ExtractionStatus _status = ExtractionStatus.idle;
  String? _archivePath;
  String? _outputDir;
  String? _password;
  List<ArchiveEntry> _entries = [];
  List<LogEntry> _logs = [];
  double _progress = 0;
  String _currentFile = '';
  String? _error;
  bool _binaryAvailable = true;
  String? _binaryPath;
  bool _createSubfolder = true;

  late TabController _tabController;

  /// Remembers the latest external compression request so the CompressionTab
  /// can consume it even if it mounts slightly after the platform message.
  int _compressRequestId = 0;
  List<String> _pendingCompressPaths = const [];

  // Method channel to receive files opened from Finder
  static const _fileOpenChannel = MethodChannel('com.mac7z/file_open');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _checkBinary();
    _fileOpenChannel.setMethodCallHandler(_handleFileOpen);
    // Tell Swift that this handler is now registered. On cold start, the
    // native channel may appear a little later than this widget, so retry
    // briefly until the macOS side acknowledges readiness.
    unawaited(_notifyNativeFlutterReady());
    // Orphan cleanup and lifecycle management is handled by TempPreviewManager
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<dynamic> _handleFileOpen(MethodCall call) async {
    if (call.method == 'openFile') {
      final path = call.arguments as String?;
      if (path != null && _isArchive(path)) {
        // Switch to the decompression tab when a file is opened externally
        _tabController.animateTo(0);
        await _loadArchive(path);
      }
    } else if (call.method == 'compressFiles') {
      // Triggered by the "Compress with mac7z" Services menu item.
      // Switch to the compression tab and forward the paths.
      final raw = call.arguments as List?;
      if (raw != null && raw.isNotEmpty) {
        setState(() {
          _compressRequestId++;
          _pendingCompressPaths = raw.cast<String>();
        });
        _tabController.animateTo(1);
      }
    }
  }

  Future<void> _notifyNativeFlutterReady() async {
    for (var attempt = 0; attempt < 20 && mounted; attempt++) {
      try {
        await _fileOpenChannel.invokeMethod<bool>('flutterReady');
        return;
      } on MissingPluginException {
        await Future<void>.delayed(const Duration(milliseconds: 200));
      } on PlatformException {
        await Future<void>.delayed(const Duration(milliseconds: 200));
      }
    }
  }

  Future<void> _checkBinary() async {
    final path = await BackendProvider.instance.current.findBinary();
    setState(() {
      _binaryAvailable = path != null;
      _binaryPath = path;
    });
    final l10n = AppLocalizations.of(context)!;
    if (path == null) {
      _log(
        l10n.logBinaryNotFound,
        LogLevel.warning,
      );
    }
  }

  void _log(String message, [LogLevel level = LogLevel.info]) {
    setState(() {
      _logs.add(LogEntry(time: DateTime.now(), message: message, level: level));
    });
  }

  Future<void> _onFilesDropped(List<String> paths) async {
    final archivePaths = paths.where((p) => _isArchive(p)).toList();
    if (archivePaths.isEmpty) {
      final l10n = AppLocalizations.of(context)!;
      _log(l10n.logNoArchiveRecognized, LogLevel.warning);
      return;
    }
    await _loadArchive(archivePaths.first);
  }

  Future<void> _pickFile() async {
    // FileType.any évite les problèmes de UTI macOS pour les formats peu communs
    // (.xz, .tar.xz, etc.) — la validation est faite par _isArchive.
    final l10n = AppLocalizations.of(context)!;
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: l10n.pickFileDialogTitle,
      type: FileType.any,
    );
    if (result != null && result.files.single.path != null) {
      final path = result.files.single.path!;
      if (!_isArchive(path)) {
        _log(l10n.logUnsupportedFormat(p.basename(path)), LogLevel.warning);
        return;
      }
      await _loadArchive(path);
    }
  }

  Future<void> _loadArchive(String path) async {
    setState(() {
      _archivePath = path;
      _entries = [];
      _status = ExtractionStatus.previewing;
      _error = null;
      _progress = 0;
    });
    final l10n = AppLocalizations.of(context)!;
    _log(l10n.logReadingArchive(p.basename(path)));

    try {
      final entries = await BackendProvider.instance.current
          .listContents(path, password: _password);
      setState(() {
        _entries = entries;
        _status = ExtractionStatus.idle;
      });
      _log(l10n.logEntriesFound(entries.length), LogLevel.success);
    } on SplitVolumeException catch (e) {
      // Show whatever 7zip could read, with a warning
      setState(() {
        _entries = e.partialEntries;
        _status = ExtractionStatus.idle;
      });
      _log(
        e.partialEntries.isEmpty
            ? l10n.logSplitIncompleteEmpty
            : l10n.logSplitIncompletePartial,
        LogLevel.warning,
      );
    } on Exception catch (e) {
      final msg = e.toString();
      if (msg.contains('password') || msg.contains('Wrong')) {
        _log(l10n.logPasswordRequired, LogLevel.warning);
        final pwd = await _showPasswordDialog();
        if (pwd != null) {
          _password = pwd;
          await _loadArchive(path);
        } else {
          setState(() => _status = ExtractionStatus.idle);
        }
      } else {
        setState(() {
          _status = ExtractionStatus.error;
          _error = msg;
        });
        _log(l10n.logError(msg), LogLevel.error);
      }
    }
  }

  Future<String?> _showPasswordDialog() async {
    return showDialog<String>(
      context: context,
      builder: (_) => const PasswordDialog(),
    );
  }

  Future<void> _pickOutputDir() async {
    final l10n = AppLocalizations.of(context)!;
    final dir = await FilePicker.platform
        .getDirectoryPath(dialogTitle: l10n.pickOutputDialogTitle);
    if (dir != null) {
      setState(() => _outputDir = dir);
      _log('Destination : $dir');
    }
  }

  String _archiveBaseName(String path) => archiveBaseName(path);

  Future<void> _extract() async {
    if (_archivePath == null) return;

    final baseDir = _outputDir ?? p.dirname(_archivePath!);
    final String outDir = _createSubfolder
        ? p.join(baseDir, _archiveBaseName(_archivePath!))
        : baseDir;

    // Ensure output dir exists
    await Directory(outDir).create(recursive: true);

    setState(() {
      _status = ExtractionStatus.extracting;
      _progress = 0;
      _currentFile = '';
      _error = null;
    });
    final l10n = AppLocalizations.of(context)!;
    _log(l10n.logExtractionStarted(outDir));

    int fileCount = 0;
    try {
      await for (final prog in BackendProvider.instance.current.extract(
        _archivePath!,
        outDir,
        password: _password,
        onLog: (l) => _log(l),
      )) {
        setState(() {
          if (prog.percent >= 0) {
            _progress = prog.percent;
          } else {
            fileCount++;
            _progress = _entries.isEmpty
                ? 0
                : (fileCount / _entries.length * 100).clamp(0, 99);
          }
          _currentFile = prog.currentFile;
          if (prog.done) {
            _progress = 100;
            _status = ExtractionStatus.done;
          }
        });
      }
      _log(l10n.logExtractionDone(outDir), LogLevel.success);
    } on Exception catch (e) {
      final msg = e.toString();
      if (msg.contains('volumes are missing') || msg.contains('incomplete')) {
        setState(() {
          _status = ExtractionStatus.error;
          _error = l10n.errorSplitArchive;
        });
        _log(l10n.logExtractionSplitError, LogLevel.error);
      } else if (msg.contains('password') ||
          msg.contains('Wrong') ||
          msg.contains('encrypted')) {
        setState(() {
          _status = ExtractionStatus.idle;
          _error = null;
          _progress = 0;
        });
        _log(l10n.logPasswordRequired, LogLevel.warning);
        final pwd = await _showPasswordDialog();
        if (pwd != null) {
          setState(() => _password = pwd);
          await _extract();
        }
      } else {
        setState(() {
          _status = ExtractionStatus.error;
          _error = msg;
        });
        _log(l10n.logExtractionError(e.toString()), LogLevel.error);
      }
    }
  }

  void _reset() {
    setState(() {
      _status = ExtractionStatus.idle;
      _archivePath = null;
      _outputDir = null;
      _password = null;
      _entries = [];
      _progress = 0;
      _currentFile = '';
      _error = null;
    });
    final l10n = AppLocalizations.of(context)!;
    _log(l10n.logReset);
  }

  bool _isArchive(String path) => isArchive(path);

  /// Extracts [entry] to a managed temp directory and opens it with the
  /// system default app.
  ///
  /// Cleanup is fully delegated to [TempPreviewManager]:
  ///   • periodic sweep (every 30 s, dirs older than 2 min)
  ///   • app lifecycle hook (app detach / quit)
  ///   • startup orphan scan (crash recovery)
  Future<void> _openFile(ArchiveEntry entry) async {
    if (entry.isDirectory || _archivePath == null) return;
    final l10n = AppLocalizations.of(context)!;
    _log(l10n.logOpening(entry.name));
    await _openFileWithPassword(entry, _password);
  }

  Future<void> _openFileWithPassword(
      ArchiveEntry entry, String? password) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      final tempDir = await TempPreviewManager.instance.createDir();
      final filePath = await BackendProvider.instance.current.extractSingleFile(
        _archivePath!,
        entry.path,
        outputDir: tempDir,
        password: password,
      );

      if (Platform.isMacOS) {
        await Process.run('open', [filePath]);
      } else if (Platform.isWindows) {
        await Process.run('explorer', [filePath]);
      } else {
        await Process.run('xdg-open', [filePath]);
      }
      _log(l10n.logOpened(entry.name), LogLevel.success);
    } catch (e) {
      final msg = e.toString();
      if (msg.contains('Wrong password') ||
          msg.contains('password') ||
          msg.contains('encrypted')) {
        _log(l10n.logFilePasswordRequired, LogLevel.warning);
        final pwd = await _showPasswordDialog();
        if (pwd != null) {
          setState(() => _password = pwd);
          await _openFileWithPassword(entry, pwd);
        }
      } else {
        _log(l10n.logOpenError(e.toString()), LogLevel.error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          // Binary warning banner (shown above tabs when 7zip is missing)
          if (!_binaryAvailable)
            _BinaryWarning(
                onDismiss: () => setState(() => _binaryAvailable = true)),
          // Tab bar
          _AppTabBar(controller: _tabController, l10n: l10n),
          Divider(height: 1, color: theme.dividerColor),
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              // Disable swipe to avoid accidental tab switches on a desktop app
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // ── Tab 1: Décompression ──────────────────────────────────
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: _LeftPanel(
                        archivePath: _archivePath,
                        outputDir: _outputDir,
                        status: _status,
                        entries: _entries,
                        createSubfolder: _createSubfolder,
                        onPickFile: _pickFile,
                        onDrop: _onFilesDropped,
                        onPickOutput: _pickOutputDir,
                        onExtract: _extract,
                        onReset: _reset,
                        onToggleSubfolder: (v) =>
                            setState(() => _createSubfolder = v),
                      ),
                    ),
                    VerticalDivider(width: 1, color: theme.dividerColor),
                    Expanded(
                      child: _RightPanel(
                        entries: _entries,
                        logs: _logs,
                        status: _status,
                        progress: _progress,
                        currentFile: _currentFile,
                        error: _error,
                        onFileOpen: _archivePath != null ? _openFile : null,
                      ),
                    ),
                  ],
                ),
                // ── Tab 2: Compression ────────────────────────────────────
                CompressionTab(
                  externalAddRequestId: _compressRequestId,
                  externalAddPaths: _pendingCompressPaths,
                ),
                // ── Tab 3: Console API ────────────────────────────────────
                const _ConsoleApiTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Tab bar ──────────────────────────────────────────────────────────────────

class _AppTabBar extends StatelessWidget {
  final TabController controller;
  final AppLocalizations l10n;

  const _AppTabBar({required this.controller, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    final tabBar = TabBar(
      controller: controller,
      isScrollable: false,
      tabs: [
        Tab(
            icon: const Icon(Icons.unarchive_rounded, size: 15),
            text: l10n.tabDecompression,
            iconMargin: const EdgeInsets.only(bottom: 2)),
        Tab(
            icon: const Icon(Icons.archive_rounded, size: 15),
            text: l10n.tabCompression,
            iconMargin: const EdgeInsets.only(bottom: 2)),
        Tab(
            icon: const Icon(Icons.terminal_rounded, size: 15),
            text: l10n.tabConsoleApi,
            iconMargin: const EdgeInsets.only(bottom: 2)),
      ],
      labelColor: c.textPrimary,
      unselectedLabelColor: c.textTertiary,
      labelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        fontFamily: '.AppleSystemUIFont',
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontFamily: '.AppleSystemUIFont',
      ),
      indicator: BoxDecoration(
        color: c.tabIndicator,
        borderRadius: BorderRadius.circular(7),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
      dividerColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    );

    return Container(
      height: 54,
      color: c.tabBar,
      child: Platform.isLinux
          ? Stack(
              alignment: Alignment.center,
              children: [
                tabBar,
                Positioned(
                  right: 8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _SettingsButton(colors: c),
                      _ThemeModeButton(colors: c),
                    ],
                  ),
                ),
              ],
            )
          : Align(alignment: Alignment.center, child: tabBar),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  final AppColors colors;
  const _SettingsButton({required this.colors});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Préférences',
      icon: Icon(Icons.settings_rounded, size: 18, color: colors.textSecondary),
      onPressed: () => showDialog(
        context: context,
        builder: (_) => const PreferencesDialog(),
      ),
    );
  }
}

class _ThemeModeButton extends StatelessWidget {
  final AppColors colors;
  const _ThemeModeButton({required this.colors});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
      icon: Icon(
        isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
        size: 18,
        color: colors.textSecondary,
      ),
      onPressed: () {
        themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
      },
    );
  }
}

// ─── Console API ─────────────────────────────────────────────────────────────

class _ConsoleApiTab extends StatelessWidget {
  const _ConsoleApiTab();

  @override
  Widget build(BuildContext context) => const ConsoleTab();
}

// ─── Left panel ───────────────────────────────────────────────────────────────

class _LeftPanel extends StatelessWidget {
  final String? archivePath;
  final String? outputDir;
  final ExtractionStatus status;
  final List<ArchiveEntry> entries;
  final bool createSubfolder;
  final VoidCallback onPickFile;
  final Future<void> Function(List<String>) onDrop;
  final VoidCallback onPickOutput;
  final VoidCallback onExtract;
  final VoidCallback onReset;
  final ValueChanged<bool> onToggleSubfolder;

  const _LeftPanel({
    required this.archivePath,
    required this.outputDir,
    required this.status,
    required this.entries,
    required this.createSubfolder,
    required this.onPickFile,
    required this.onDrop,
    required this.onPickOutput,
    required this.onExtract,
    required this.onReset,
    required this.onToggleSubfolder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = theme.appColors;
    final l10n = AppLocalizations.of(context)!;
    final isExtracting = status == ExtractionStatus.extracting;
    final isDone = status == ExtractionStatus.done;
    final hasArchive = archivePath != null;

    return Container(
      color: c.bg,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drop zone
          Expanded(
            flex: 3,
            child: DropZoneWidget(
              hasFile: hasArchive,
              fileName: archivePath != null ? p.basename(archivePath!) : null,
              entryCount: entries.length,
              onDrop: onDrop,
              onTap: onPickFile,
              onClear: onReset,
            ),
          ),
          const SizedBox(height: 16),
          // Destination row
          _SectionLabel(l10n.sectionDestination),
          const SizedBox(height: 8),
          _DestRow(outputDir: outputDir, onPick: onPickOutput),
          const SizedBox(height: 6),
          _SubfolderRow(
            enabled: createSubfolder,
            archiveName:
                archivePath != null ? _subfolderName(archivePath!) : null,
            onToggle: onToggleSubfolder,
          ),
          const SizedBox(height: 24),
          // Action buttons
          if (!isDone) ...[
            _ActionButton(
              label: isExtracting ? l10n.btnExtracting : l10n.btnExtract,
              icon: isExtracting
                  ? Icons.hourglass_top_rounded
                  : Icons.unarchive_rounded,
              color: c.accent,
              enabled: hasArchive &&
                  !isExtracting &&
                  status != ExtractionStatus.previewing,
              onPressed: onExtract,
            ),
          ] else ...[
            _ActionButton(
              label: l10n.btnDone,
              icon: Icons.check_circle_rounded,
              color: c.success,
              enabled: false,
              onPressed: () {},
            ),
          ],
          const SizedBox(height: 10),
          _ActionButton(
            label: l10n.btnReset,
            icon: Icons.refresh_rounded,
            color: c.surface3,
            enabled: hasArchive || isDone,
            onPressed: onReset,
          ),
        ],
      ),
    );
  }
}

String _subfolderName(String archivePath) => archiveBaseName(archivePath);

class _SubfolderRow extends StatelessWidget {
  final bool enabled;
  final String? archiveName;
  final ValueChanged<bool> onToggle;

  const _SubfolderRow({
    required this.enabled,
    required this.archiveName,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => onToggle(!enabled),
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: enabled,
              onChanged: (v) => onToggle(v ?? false),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: c.accent,
              side: BorderSide(color: c.border, width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: TextStyle(fontSize: 12, color: c.textSecondary),
                children: [
                  TextSpan(text: '${l10n.subfolderCreate} '),
                  if (archiveName != null)
                    TextSpan(
                      text: '"$archiveName"',
                      style: TextStyle(
                        color: enabled ? c.accent : c.textTertiary,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  else
                    TextSpan(text: l10n.subfolderDefault),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);
  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 10,
        letterSpacing: 1.2,
        color: c.textTertiary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _DestRow extends StatelessWidget {
  final String? outputDir;
  final VoidCallback onPick;
  const _DestRow({required this.outputDir, required this.onPick});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onPick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: c.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: c.border),
        ),
        child: Row(
          children: [
            const Icon(Icons.folder_open_rounded,
                size: 16, color: Color(0xFFFFD60A)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                outputDir ?? l10n.destinationSameFolder,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: outputDir != null ? c.textPrimary : c.textTertiary,
                ),
              ),
            ),
            Icon(Icons.chevron_right_rounded, size: 14, color: c.textTertiary),
          ],
        ),
      ),
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
    required this.label,
    required this.icon,
    required this.color,
    required this.enabled,
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
                Text(label,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Right panel ──────────────────────────────────────────────────────────────

class _RightPanel extends StatelessWidget {
  final List<ArchiveEntry> entries;
  final List<LogEntry> logs;
  final ExtractionStatus status;
  final double progress;
  final String currentFile;
  final String? error;
  final void Function(ArchiveEntry)? onFileOpen;

  const _RightPanel({
    required this.entries,
    required this.logs,
    required this.status,
    required this.progress,
    required this.currentFile,
    required this.error,
    this.onFileOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // File tree (70%)
        Expanded(
          flex: 7,
          child: FileTreeWidget(
            entries: entries,
            status: status,
            error: error,
            onFileOpen: onFileOpen,
          ),
        ),
        Divider(height: 1, color: Theme.of(context).dividerColor),
        // Progress bar (only when extracting)
        if (status == ExtractionStatus.extracting ||
            status == ExtractionStatus.done)
          ExtractionProgressBar(
              progress: progress,
              currentFile: currentFile,
              done: status == ExtractionStatus.done),
        Divider(height: 1, color: Theme.of(context).dividerColor),
        // Log panel (30%)
        Expanded(
          flex: 3,
          child: LogPanel(logs: logs),
        ),
      ],
    );
  }
}

class _BinaryWarning extends StatelessWidget {
  final VoidCallback onDismiss;
  const _BinaryWarning({required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    final l10n = AppLocalizations.of(context)!;
    final msg = Platform.isMacOS
        ? 'brew install sevenzip'
        : Platform.isWindows
            ? 'Téléchargez 7-Zip sur 7-zip.org'
            : 'sudo apt install p7zip-full';

    return Container(
      color: c.warning.withOpacity(0.15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded, color: c.warning, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              l10n.binaryWarning(msg),
              style: TextStyle(color: c.warning, fontSize: 12),
            ),
          ),
          IconButton(
              onPressed: onDismiss,
              icon: Icon(Icons.close, size: 14, color: c.textSecondary)),
        ],
      ),
    );
  }
}
