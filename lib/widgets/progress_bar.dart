import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mac7z/l10n/app_localizations.dart';
import 'package:mac7z/theme/app_colors.dart';

class ExtractionProgressBar extends StatelessWidget {
  final double progress;
  final String currentFile;
  final bool done;

  const ExtractionProgressBar({
    super.key,
    required this.progress,
    required this.currentFile,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final c = Theme.of(context).appColors;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      color: done
          ? c.success.withOpacity(0.06)
          : c.accent.withOpacity(0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                done ? Icons.check_circle_rounded : Icons.unarchive_rounded,
                size: 14,
                color: done ? c.success : c.accent,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  done ? l10n.progressDone : (currentFile.isNotEmpty ? currentFile : l10n.progressExtracting),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: done ? c.success : c.textPrimary,
                  ),
                ),
              ),
              Text(
                progress > 0 ? '${progress.toInt()}%' : '',
                style: TextStyle(
                  fontFamily: 'Menlo',
                  fontSize: 11,
                  color: done ? c.success : c.accent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress / 100),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
              builder: (ctx, value, _) => LinearProgressIndicator(
                value: value > 0 ? value : null,
                minHeight: 4,
                backgroundColor: Colors.white.withOpacity(0.08),
                valueColor: AlwaysStoppedAnimation(
                  done ? c.success : c.accent,
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.2);
  }
}
