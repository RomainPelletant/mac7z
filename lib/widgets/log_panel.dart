import 'package:flutter/material.dart';
import 'package:mac7z/l10n/app_localizations.dart';
import 'package:mac7z/theme/app_colors.dart';
import '../models/archive_entry.dart';

class LogPanel extends StatefulWidget {
  final List<LogEntry> logs;
  const LogPanel({super.key, required this.logs});

  @override
  State<LogPanel> createState() => _LogPanelState();
}

class _LogPanelState extends State<LogPanel> {
  final _scrollController = ScrollController();

  @override
  void didUpdateWidget(LogPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.logs.length != oldWidget.logs.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    return Container(
      color: c.logBg,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: c.bg,
            child: Row(
              children: [
                Icon(Icons.terminal_rounded, size: 13, color: c.textTertiary),
                const SizedBox(width: 8),
                Text(
                  l10n.logPanelTitle,
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: c.textTertiary, letterSpacing: 0.5),
                ),
                const Spacer(),
                Text(
                  l10n.logPanelEntryCount(widget.logs.length),
                  style: TextStyle(fontSize: 10, color: c.surface3),
                ),
              ],
            ),
          ),
          // Log entries
          Expanded(
            child: widget.logs.isEmpty
                ? Center(child: Text(l10n.logPanelEmpty, style: TextStyle(color: c.surface3, fontSize: 12)))
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: widget.logs.length,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (ctx, i) {
                      final log = widget.logs[i];
                      return _LogRow(log: log);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _LogRow extends StatelessWidget {
  final LogEntry log;
  const _LogRow({required this.log});

  Color get _color {
    final c = Color(0xFF636366); // fallback, will be overridden by context
    switch (log.level) {
      case LogLevel.success: return const Color(0xFF30D158);
      case LogLevel.warning: return const Color(0xFFFFD60A);
      case LogLevel.error: return const Color(0xFFFF453A);
      default: return c;
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    final messageColor = () {
      switch (log.level) {
        case LogLevel.success: return c.success;
        case LogLevel.warning: return c.warning;
        case LogLevel.error: return c.error;
        default: return c.textTertiary;
      }
    }();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            log.timeFormatted,
            style: TextStyle(fontFamily: 'Menlo', fontSize: 10, color: c.surface3),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              log.message,
              style: TextStyle(fontFamily: 'Menlo', fontSize: 11, color: messageColor, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
