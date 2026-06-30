import 'dart:convert';
import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class UpdateCheckResult {
  const UpdateCheckResult({
    required this.currentVersion,
    required this.latestVersion,
    required this.releaseUrl,
    required this.hasUpdate,
    this.asset,
    this.releaseNotes,
    this.publishedAt,
  });

  final String currentVersion;
  final String latestVersion;
  final Uri releaseUrl;
  final bool hasUpdate;
  final ReleaseAsset? asset;
  final String? releaseNotes;
  final DateTime? publishedAt;
}

class ReleaseAsset {
  const ReleaseAsset({
    required this.name,
    required this.downloadUrl,
    required this.size,
    required this.contentType,
  });

  final String name;
  final Uri downloadUrl;
  final int size;
  final String contentType;
}

class DownloadedUpdate {
  const DownloadedUpdate({
    required this.file,
    required this.asset,
  });

  final File file;
  final ReleaseAsset asset;
}

class GitHubReleaseUpdater {
  GitHubReleaseUpdater({
    HttpClient? httpClient,
    this.owner = 'romainpelletant',
    this.repo = 'mac7z',
  }) : _httpClient = httpClient ?? HttpClient();

  final HttpClient _httpClient;
  final String owner;
  final String repo;

  Uri get _latestReleaseUri =>
      Uri.https('api.github.com', '/repos/$owner/$repo/releases/latest');

  Future<UpdateCheckResult> checkForUpdates() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    _consoleLog(
      'Checking for updates (current=$currentVersion, repo=$owner/$repo)...',
    );

    try {
      final response = await _getJson(_latestReleaseUri);
      final latestVersion =
          _normalizeVersion((response['tag_name'] ?? '') as String);
      if (latestVersion.isEmpty) {
        throw const UpdateException(
          'Reponse GitHub invalide: tag_name manquant.',
        );
      }

      final releaseUrl = Uri.parse((response['html_url'] ?? '') as String);
      final releaseNotes = response['body'] as String?;
      final publishedAtRaw = response['published_at'] as String?;
      final publishedAt =
          publishedAtRaw == null ? null : DateTime.tryParse(publishedAtRaw);

      final assetsJson = (response['assets'] as List<dynamic>? ?? const [])
          .whereType<Map<String, dynamic>>()
          .toList();
      final asset = _selectBestAsset(assetsJson);
      final hasUpdate = _compareVersions(latestVersion, currentVersion) > 0;

      _consoleLog(
        'Update check result: latest=$latestVersion, hasUpdate=$hasUpdate, asset=${asset?.name ?? 'none'}',
      );

      return UpdateCheckResult(
        currentVersion: currentVersion,
        latestVersion: latestVersion,
        releaseUrl: releaseUrl,
        hasUpdate: hasUpdate,
        asset: asset,
        releaseNotes: releaseNotes,
        publishedAt: publishedAt,
      );
    } catch (e) {
      _consoleLog('Update check failed: $e');
      rethrow;
    }
  }

  Future<DownloadedUpdate> downloadUpdate(
    ReleaseAsset asset, {
    void Function(int receivedBytes, int totalBytes)? onProgress,
  }) async {
    final request = await _httpClient.getUrl(asset.downloadUrl);
    request.headers.set(HttpHeaders.userAgentHeader, 'mac7z-updater');
    request.followRedirects = true;

    final response = await request.close();
    if (response.statusCode != HttpStatus.ok) {
      throw UpdateException(
        'Telechargement impossible (${response.statusCode}).',
      );
    }

    final updatesDir = await _ensureUpdatesDirectory();
    final targetPath = p.join(updatesDir.path, asset.name);
    final targetFile = File(targetPath);
    if (await targetFile.exists()) {
      await targetFile.delete();
    }

    final sink = targetFile.openWrite();
    final totalBytes =
        response.contentLength > 0 ? response.contentLength : asset.size;
    var receivedBytes = 0;

    await for (final chunk in response) {
      sink.add(chunk);
      receivedBytes += chunk.length;
      onProgress?.call(receivedBytes, totalBytes);
    }

    await sink.close();
    return DownloadedUpdate(file: targetFile, asset: asset);
  }

  Future<void> launchInstaller(DownloadedUpdate update) async {
    final path = update.file.path;

    if (Platform.isMacOS) {
      await _run('open', [path]);
      return;
    }

    if (Platform.isLinux) {
      final command = await _findLinuxOpenCommand();
      if (command == null) {
        throw const UpdateException(
          'Impossible d’ouvrir le fichier telecharge automatiquement.',
        );
      }
      await _run(command.$1, [...command.$2, path]);
      return;
    }

    throw const UpdateException(
      'Plateforme non supportee pour la mise a jour.',
    );
  }

  Future<Map<String, dynamic>> _getJson(Uri uri) async {
    final request = await _httpClient.getUrl(uri);
    request.headers
        .set(HttpHeaders.acceptHeader, 'application/vnd.github+json');
    request.headers.set(HttpHeaders.userAgentHeader, 'mac7z-updater');

    final response = await request.close();
    final body = await utf8.decodeStream(response);

    if (response.statusCode != HttpStatus.ok) {
      throw UpdateException(
        'Verification impossible (${response.statusCode}).',
      );
    }

    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw const UpdateException('Reponse GitHub invalide.');
    }
    return decoded;
  }

  ReleaseAsset? _selectBestAsset(List<Map<String, dynamic>> assets) {
    final scored = assets
        .map(_releaseAssetFromJson)
        .whereType<ReleaseAsset>()
        .map(
          (asset) => (
            asset: asset,
            score: _scoreAsset(asset.name.toLowerCase()),
          ),
        )
        .where((entry) => entry.score > 0)
        .toList()
      ..sort((a, b) => b.score.compareTo(a.score));

    return scored.isEmpty ? null : scored.first.asset;
  }

  ReleaseAsset? _releaseAssetFromJson(Map<String, dynamic> json) {
    final name = json['name'] as String?;
    final url = json['browser_download_url'] as String?;
    if (name == null || url == null) return null;

    return ReleaseAsset(
      name: name,
      downloadUrl: Uri.parse(url),
      size: (json['size'] as num?)?.toInt() ?? 0,
      contentType: (json['content_type'] as String?) ?? '',
    );
  }

  int _scoreAsset(String name) {
    final isMac = Platform.isMacOS;
    final isLinux = Platform.isLinux;
    final isArm64 = _isArm64;
    final archMatches = isArm64
        ? ['arm64', 'aarch64', 'apple-silicon']
        : ['x64', 'x86_64', 'amd64', 'intel'];
    final archOpposites = isArm64
        ? ['x64', 'x86_64', 'amd64', 'intel']
        : ['arm64', 'aarch64', 'apple-silicon'];

    var score = 0;

    if (isMac && name.endsWith('.dmg')) score += 60;
    if (isLinux && name.endsWith('.deb')) score += 60;
    if (isLinux && name.endsWith('.tar.gz')) score += 40;

    if (isMac && name.contains('mac')) score += 25;
    if (isLinux && name.contains('linux')) score += 25;

    if (archMatches.any(name.contains)) score += 20;
    if (archOpposites.any(name.contains)) score -= 40;

    if (!isLinux && name.endsWith('.deb')) score = 0;
    if (!isMac && name.endsWith('.dmg')) score = 0;

    return score;
  }

  bool get _isArm64 {
    final arch = Platform.version.toLowerCase();
    return arch.contains('arm64') || arch.contains('aarch64');
  }

  String _normalizeVersion(String value) {
    final trimmed = value.trim();
    return trimmed.startsWith('v') ? trimmed.substring(1) : trimmed;
  }

  int _compareVersions(String a, String b) {
    final aParts = _parseVersion(a);
    final bParts = _parseVersion(b);
    final maxLength =
        aParts.length > bParts.length ? aParts.length : bParts.length;

    for (var i = 0; i < maxLength; i++) {
      final left = i < aParts.length ? aParts[i] : 0;
      final right = i < bParts.length ? bParts[i] : 0;
      if (left != right) return left.compareTo(right);
    }
    return 0;
  }

  List<int> _parseVersion(String version) {
    final core = version.split('-').first;
    return core.split('.').map((part) => int.tryParse(part) ?? 0).toList();
  }

  Future<Directory> _ensureUpdatesDirectory() async {
    final baseDir = Platform.isMacOS || Platform.isLinux
        ? await getApplicationSupportDirectory()
        : await getTemporaryDirectory();
    final updatesDir = Directory(p.join(baseDir.path, 'updates'));
    await updatesDir.create(recursive: true);
    return updatesDir;
  }

  Future<(String, List<String>)?> _findLinuxOpenCommand() async {
    const candidates = [
      ('xdg-open', <String>[]),
      ('gio', <String>['open']),
    ];

    for (final candidate in candidates) {
      if (await _commandExists(candidate.$1)) {
        return candidate;
      }
    }
    return null;
  }

  Future<bool> _commandExists(String command) async {
    final result = await Process.run('which', [command]);
    return result.exitCode == 0;
  }

  Future<void> _run(String executable, List<String> arguments) async {
    final result = await Process.run(executable, arguments);
    if (result.exitCode != 0) {
      throw UpdateException(
        'Commande echouee: $executable ${arguments.join(' ')}',
      );
    }
  }

  void _consoleLog(String message) {
    stdout.writeln('[mac7z][updater] $message');
  }
}

class UpdateException implements Exception {
  const UpdateException(this.message);

  final String message;

  @override
  String toString() => message;
}
