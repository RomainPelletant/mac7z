import 'package:flutter/foundation.dart';
import 'archive_backend.dart';
import 'seven_zip_service.dart';
import 'dart_archive_backend.dart';

/// Singleton [ValueNotifier] that holds the active [BackendType].
///
/// Call [BackendProvider.instance.current] to get the active [ArchiveBackend].
/// Listen to [BackendProvider.instance] to rebuild when the backend changes.
///
/// Example:
/// ```dart
/// final backend = BackendProvider.instance.current;
/// await backend.listContents(path);
/// ```
class BackendProvider extends ValueNotifier<BackendType> {
  BackendProvider._() : super(BackendType.bundled);

  static final BackendProvider instance = BackendProvider._();

  /// The active [ArchiveBackend] for the current [value].
  ArchiveBackend get current {
    switch (value) {
      case BackendType.bundled:
        return SevenZipService(preferSystem: false);
      case BackendType.system:
        return SevenZipService(preferSystem: true);
      case BackendType.dartArchive:
        return DartArchiveBackend();
    }
  }

  /// Convenience: changes backend type and notifies listeners.
  void setBackend(BackendType type) => value = type;
}
