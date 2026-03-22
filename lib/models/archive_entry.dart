import 'package:flutter/material.dart';

enum ExtractionStatus { idle, previewing, extracting, done, error }

class ArchiveEntry {
  final String path;
  final int size;
  final bool isDirectory;
  final DateTime? modified;

  const ArchiveEntry({
    required this.path,
    required this.size,
    required this.isDirectory,
    this.modified,
  });

  String get name => path.split('/').last;
  String get extension => isDirectory ? '' : (name.contains('.') ? name.split('.').last.toLowerCase() : '');

  String get sizeFormatted {
    if (isDirectory) return '—';
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024) return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  IconData get icon {
    if (isDirectory) return Icons.folder_rounded;
    switch (extension) {
      case 'pdf': return Icons.picture_as_pdf_rounded;
      case 'jpg': case 'jpeg': case 'png': case 'gif': case 'webp': case 'svg':
        return Icons.image_rounded;
      case 'mp4': case 'mov': case 'avi': case 'mkv':
        return Icons.movie_rounded;
      case 'mp3': case 'wav': case 'flac': case 'aac':
        return Icons.audio_file_rounded;
      case 'zip': case '7z': case 'rar': case 'tar': case 'gz':
        return Icons.folder_zip_rounded;
      case 'dart': case 'py': case 'js': case 'ts': case 'swift': case 'kt':
      case 'java': case 'cpp': case 'c': case 'rs': case 'go':
        return Icons.code_rounded;
      case 'txt': case 'md': case 'log':
        return Icons.article_rounded;
      case 'doc': case 'docx': case 'xls': case 'xlsx': case 'ppt': case 'pptx':
        return Icons.description_rounded;
      default: return Icons.insert_drive_file_rounded;
    }
  }

  Color iconColor(BuildContext context) {
    if (isDirectory) return const Color(0xFFFFD60A);
    switch (extension) {
      case 'pdf': return const Color(0xFFFF453A);
      case 'jpg': case 'jpeg': case 'png': case 'gif': case 'webp': case 'svg':
        return const Color(0xFF30D158);
      case 'mp4': case 'mov': case 'avi': case 'mkv':
        return const Color(0xFFFF9F0A);
      case 'mp3': case 'wav': case 'flac': case 'aac':
        return const Color(0xFFBF5AF2);
      case 'zip': case '7z': case 'rar': case 'tar': case 'gz':
        return const Color(0xFF64D2FF);
      case 'dart': case 'py': case 'js': case 'ts': case 'swift': case 'kt':
      case 'java': case 'cpp': case 'c': case 'rs': case 'go':
        return const Color(0xFF0A84FF);
      default: return const Color(0xFF98989D);
    }
  }
}

class LogEntry {
  final DateTime time;
  final String message;
  final LogLevel level;

  const LogEntry({required this.time, required this.message, required this.level});

  String get timeFormatted =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}';
}

enum LogLevel { info, success, warning, error }
