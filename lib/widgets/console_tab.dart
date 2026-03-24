import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mac7z/theme/app_colors.dart';

/// Static documentation page explaining how to use mac7z as a 7zip CLI
/// pass-through from the macOS Terminal.
class ConsoleTab extends StatelessWidget {
  const ConsoleTab({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Container(
      color: c.bg,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 36),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 740),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Hero(),
                SizedBox(height: 36),
                _Section(
                  title: 'CONFIGURATION',
                  children: [
                    _SetupBlock(),
                  ],
                ),
                SizedBox(height: 32),
                _Section(
                  title: 'COMMANDES PRINCIPALES',
                  children: [
                    _CommandRow(
                      cmd: 'mac7z l archive.zip',
                      description: 'Lister le contenu d\'une archive',
                    ),
                    _CommandRow(
                      cmd: 'mac7z x archive.7z',
                      description: 'Extraire avec les chemins complets',
                    ),
                    _CommandRow(
                      cmd: 'mac7z x archive.7z -o~/Bureau/dest',
                      description: 'Extraire vers un dossier spécifique',
                    ),
                    _CommandRow(
                      cmd: 'mac7z e archive.tar.gz',
                      description: 'Extraire à plat (sans sous-dossiers)',
                    ),
                    _CommandRow(
                      cmd: 'mac7z a sortie.7z fichier1 dossier2',
                      description: 'Créer ou mettre à jour une archive',
                    ),
                    _CommandRow(
                      cmd: 'mac7z a sortie.zip src/ -tzip',
                      description: 'Créer une archive ZIP',
                    ),
                    _CommandRow(
                      cmd: 'mac7z t archive.7z',
                      description: 'Tester l\'intégrité de l\'archive',
                    ),
                    _CommandRow(
                      cmd: 'mac7z d archive.zip old.txt',
                      description: 'Supprimer un fichier d\'une archive',
                    ),
                    _CommandRow(
                      cmd: 'mac7z i',
                      description: 'Afficher les informations sur 7zip',
                    ),
                  ],
                ),
                SizedBox(height: 32),
                _Section(
                  title: 'OPTIONS COURANTES',
                  children: [
                    _OptionRow(flag: '-p{motdepasse}', description: 'Protéger l\'archive par mot de passe'),
                    _OptionRow(flag: '-mhe=on', description: 'Chiffrer aussi les noms de fichiers (7z seulement)'),
                    _OptionRow(flag: '-mx={0-9}', description: 'Niveau de compression (0 = aucun, 9 = ultra)'),
                    _OptionRow(flag: '-mmt=on', description: 'Activer la compression multi-thread'),
                    _OptionRow(flag: '-v{taille}', description: 'Découper en volumes (ex : -v100m pour 100 Mo)'),
                    _OptionRow(flag: '-r', description: 'Traitement récursif des sous-dossiers'),
                    _OptionRow(flag: '-y', description: 'Répondre "oui" à toutes les confirmations'),
                    _OptionRow(flag: '-o{chemin}', description: 'Dossier de destination pour l\'extraction'),
                    _OptionRow(flag: '-x!{pattern}', description: 'Exclure des fichiers (ex : -x!*.log)'),
                  ],
                ),
                SizedBox(height: 32),
                _Section(
                  title: 'EXEMPLES AVANCÉS',
                  children: [
                    _ExampleBlock(
                      label: 'Archive chiffrée avec noms masqués',
                      cmd: 'mac7z a secrets.7z docs/ -p"MonMotDePasse" -mhe=on',
                    ),
                    _ExampleBlock(
                      label: 'Archive découpée en volumes de 50 Mo',
                      cmd: 'mac7z a backup.7z ~/Documents -v50m',
                    ),
                    _ExampleBlock(
                      label: 'Compression ultra (lente, fichier minimal)',
                      cmd: 'mac7z a ultra.7z src/ -mx=9 -mmt=on',
                    ),
                    _ExampleBlock(
                      label: 'Extraire un seul fichier',
                      cmd: 'mac7z e archive.zip "dossier/rapport.pdf" -o~/Bureau',
                    ),
                    _ExampleBlock(
                      label: 'Lister avec détails techniques',
                      cmd: 'mac7z l -slt archive.7z',
                    ),
                  ],
                ),
                SizedBox(height: 32),
                _InfoNote(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Hero ─────────────────────────────────────────────────────────────────────

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: c.accent.withOpacity(0.12),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: c.accent.withOpacity(0.25)),
          ),
          child: Icon(Icons.terminal_rounded, size: 32, color: c.accent),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Console API',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: c.textPrimary,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'mac7z passe tous ses arguments directement au binaire 7zip intégré. '
                'Utilisez-le depuis Terminal exactement comme vous utiliseriez 7zz.',
                style: TextStyle(
                  fontSize: 13,
                  color: c.textSecondary,
                  height: 1.55,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Section ──────────────────────────────────────────────────────────────────

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _Section({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
            color: c.textTertiary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: c.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.06)),
          ),
          child: Column(
            children: [
              for (int i = 0; i < children.length; i++) ...[
                children[i],
                if (i < children.length - 1)
                  Divider(height: 1, color: Colors.white.withOpacity(0.06)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Setup block ──────────────────────────────────────────────────────────────

class _SetupBlock extends StatelessWidget {
  const _SetupBlock();

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    final isLinux = Platform.isLinux;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Créez un alias dans votre shell pour utiliser mac7z comme commande '
            'standard dans le Terminal :',
            style: TextStyle(fontSize: 13, color: c.textSecondary, height: 1.6),
          ),
          const SizedBox(height: 14),
          _CodeBlock(
            code: isLinux
                ? 'alias mac7z="/opt/mac7z/mac7z"'
                : 'alias mac7z="/Applications/mac7z.app/Contents/MacOS/mac7z"',
          ),
          const SizedBox(height: 10),
          Text(
            isLinux
                ? 'Ajoutez cette ligne à votre ~/.bashrc (ou ~/.zshrc) pour '
                    'la rendre permanente. Une fois configuré, toutes les commandes '
                    '7zip standard fonctionnent en remplaçant 7zz par mac7z.'
                : 'Ajoutez cette ligne à votre ~/.zshrc (ou ~/.bash_profile) pour '
                    'la rendre permanente. Une fois configuré, toutes les commandes '
                    '7zip standard fonctionnent en remplaçant 7zz par mac7z.',
            style: TextStyle(fontSize: 12, color: c.textTertiary, height: 1.6),
          ),
        ],
      ),
    );
  }
}

// ─── Command row ──────────────────────────────────────────────────────────────

class _CommandRow extends StatelessWidget {
  final String cmd;
  final String description;
  const _CommandRow({required this.cmd, required this.description});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: SelectableText(
              cmd,
              style: TextStyle(
                fontFamily: 'Menlo',
                fontSize: 12,
                color: c.codeText,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 4,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: c.textSecondary,
                height: 1.5,
              ),
            ),
          ),
          _CopyButton(text: cmd),
        ],
      ),
    );
  }
}

// ─── Option row ───────────────────────────────────────────────────────────────

class _OptionRow extends StatelessWidget {
  final String flag;
  final String description;
  const _OptionRow({required this.flag, required this.description});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 190,
            child: SelectableText(
              flag,
              style: TextStyle(
                fontFamily: 'Menlo',
                fontSize: 12,
                color: c.warning,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 12,
                color: c.textSecondary,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Example block ────────────────────────────────────────────────────────────

class _ExampleBlock extends StatelessWidget {
  final String label;
  final String cmd;
  const _ExampleBlock({required this.label, required this.cmd});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: c.textTertiary, height: 1.4),
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Expanded(child: _CodeBlock(code: cmd)),
              const SizedBox(width: 8),
              _CopyButton(text: cmd),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Code block ───────────────────────────────────────────────────────────────

class _CodeBlock extends StatelessWidget {
  final String code;
  const _CodeBlock({required this.code});

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: c.logBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: SelectableText(
        code,
        style: TextStyle(
          fontFamily: 'Menlo',
          fontSize: 12,
          color: c.textPrimary,
          height: 1.45,
        ),
      ),
    );
  }
}

// ─── Copy button ──────────────────────────────────────────────────────────────

class _CopyButton extends StatefulWidget {
  final String text;
  const _CopyButton({required this.text});

  @override
  State<_CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<_CopyButton> {
  bool _copied = false;

  Future<void> _copy() async {
    await Clipboard.setData(ClipboardData(text: widget.text));
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Tooltip(
      message: _copied ? 'Copié !' : 'Copier',
      child: InkWell(
        onTap: _copy,
        borderRadius: BorderRadius.circular(6),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: _copied
                ? c.success.withOpacity(0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            _copied ? Icons.check_rounded : Icons.copy_rounded,
            size: 14,
            color: _copied ? c.success : c.textTertiary,
          ),
        ),
      ),
    );
  }
}

// ─── Info note ────────────────────────────────────────────────────────────────

class _InfoNote extends StatelessWidget {
  const _InfoNote();

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).appColors;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: c.accent.withOpacity(0.07),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: c.accent.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, size: 16, color: c.accent),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'mac7z embarque son propre binaire 7zz. Les arguments sont transmis '
              'tels quels, sans modification. Toute commande valide pour 7zz '
              'fonctionne de manière identique avec mac7z.',
              style: TextStyle(
                fontSize: 12,
                color: c.accent,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
