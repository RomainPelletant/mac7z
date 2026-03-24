import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as p;

/// Manages the lifecycle of temporary directories created for single-file
/// previews (double-click → extract → open with default app).
///
/// Strategy (three layers):
///   1. **Periodic sweep** — every 30 s, deletes dirs older than [_maxAge]
///      (2 min). Gives any app plenty of time to read the file into memory.
///   2. **App lifecycle** — deletes all tracked dirs when the app is detached
///      (terminated normally or sent to background on mobile).
///   3. **Orphan cleanup** — on startup, removes leftover `mac7z_open_*` dirs
///      from previous crashes.
class TempPreviewManager with WidgetsBindingObserver {
  TempPreviewManager._();

  /// Singleton instance — call [init] once in [main].
  static final instance = TempPreviewManager._();

  static const _prefix = 'mac7z_open_';
  static const _maxAge = Duration(minutes: 2);

  final _dirs = <_TempEntry>[];
  Timer? _sweepTimer;
  bool _initialised = false;

  // ── Public API ──────────────────────────────────────────────────────────────

  /// Registers the lifecycle observer and starts the sweep timer.
  /// Must be called after [WidgetsFlutterBinding.ensureInitialized].
  void init() {
    if (_initialised) return;
    _initialised = true;
    WidgetsBinding.instance.addObserver(this);
    _sweepTimer = Timer.periodic(const Duration(seconds: 30), (_) => _sweep());
    _cleanOrphans();
  }

  /// Cancels the timer, removes the observer, and deletes all tracked dirs.
  void dispose() {
    _sweepTimer?.cancel();
    _sweepTimer = null;
    WidgetsBinding.instance.removeObserver(this);
    _deleteAll();
    _initialised = false;
  }

  /// Creates a new named temp directory and registers it for cleanup.
  /// Returns the [Directory] — pass its path to [SevenZipService.extractSingleFile].
  Future<Directory> createDir() async {
    final dir = await Directory.systemTemp.createTemp(_prefix);
    _dirs.add(_TempEntry(dir: dir, createdAt: DateTime.now()));
    return dir;
  }

  // ── WidgetsBindingObserver ──────────────────────────────────────────────────

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // detached = app is about to be destroyed (macOS Cmd+Q, window close, etc.)
    if (state == AppLifecycleState.detached) {
      _deleteAll();
    }
  }

  // ── Internal ────────────────────────────────────────────────────────────────

  /// Deletes dirs created more than [_maxAge] ago.
  void _sweep() {
    final cutoff = DateTime.now().subtract(_maxAge);
    _dirs.removeWhere((entry) {
      if (entry.createdAt.isBefore(cutoff)) {
        _delete(entry.dir);
        return true;
      }
      return false;
    });
  }

  /// Immediately deletes all tracked dirs and clears the list.
  void _deleteAll() {
    for (final entry in _dirs) {
      _delete(entry.dir);
    }
    _dirs.clear();
  }

  /// Removes leftover `mac7z_open_*` dirs from a previous crash.
  void _cleanOrphans() {
    try {
      for (final entity in Directory.systemTemp.listSync()) {
        if (entity is Directory &&
            p.basename(entity.path).startsWith(_prefix)) {
          _delete(entity);
        }
      }
    } catch (_) {
      // systemTemp not accessible — ignore
    }
  }

  static void _delete(Directory dir) {
    dir.exists().then((exists) {
      if (exists) dir.delete(recursive: true).catchError((_) {});
    }).catchError((_) {});
  }
}

class _TempEntry {
  final Directory dir;
  final DateTime createdAt;
  _TempEntry({required this.dir, required this.createdAt});
}
