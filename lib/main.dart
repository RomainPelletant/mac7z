import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'services/seven_zip_service.dart';
import 'services/temp_preview_manager.dart';

void _registerLicenses() {
  LicenseRegistry.addLicense(() async* {
    yield LicenseEntryWithLineBreaks(
      ['7-Zip'],
      '''7-Zip
Copyright (C) 1999-2023 Igor Pavlov.

7-Zip is free software distributed under the GNU LGPL license (version 2.1 or later).

Source code is available on https://www.7-zip.org/

The unRAR restriction:
The decompression engine for RAR archives was developed using source code
of unRAR program. All copyrights to original unRAR code are owned by
Alexander Roshal. The unRAR code may not be used to re-create the RAR
compression algorithm, which is proprietary. Distribution of modified
unRAR code in separate form or as a part of other software is permitted,
provided that it is clearly stated in the documentation and source comments
that the code may not be used to develop a RAR (WinRAR) compatible archiver.''',
    );
  });
}

void main(List<String> args) async {
  // Filter out macOS system args (like -psn_xxxx)
  final cleanArgs = args.where((a) => !a.startsWith('-psn_')).toList();

  // Check if this looks like a CLI command (pass the args to 7zip)
  if (cleanArgs.isNotEmpty && _isCliMode(cleanArgs)) {
    // Run in headless mode: execute 7zip with the provided args and exit
    await _runCliMode(cleanArgs);
    return;
  }

  // Normal GUI mode
  WidgetsFlutterBinding.ensureInitialized();
  _registerLicenses();
  TempPreviewManager.instance.init();
  runApp(const Unzipper7App());
}

/// Returns true if the arguments look like a 7zip command (not a file to open).
bool _isCliMode(List<String> args) {
  if (args.isEmpty) return false;
  final first = args.first;

  // Known 7zip commands: a b d e h i l rn t u x
  const commands = {'a', 'b', 'd', 'e', 'h', 'i', 'l', 'rn', 't', 'u', 'x'};
  return commands.contains(first) || first.startsWith('-');
}

/// Runs 7zip in headless mode with the provided arguments.
Future<void> _runCliMode(List<String> args) async {
  final binary = await SevenZipService.findBinary();
  if (binary == null) {
    stderr.writeln('7zip: command not found');
    stderr.writeln('  Install via: brew install sevenzip (macOS)');
    exit(127);
  }

  try {
    // Run 7zip with inherited stdio so output goes directly to terminal
    final process = await Process.start(
      binary,
      args,
      mode: ProcessStartMode.inheritStdio,
    );
    final exitCode = await process.exitCode;
    exit(exitCode);
  } catch (e) {
    stderr.writeln('Error: Failed to run 7zip: $e');
    exit(1);
  }
}
