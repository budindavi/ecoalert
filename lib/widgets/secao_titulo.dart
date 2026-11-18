import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Título padronizado para as seções da tela.
class SecaoTitulo extends StatelessWidget {
  const SecaoTitulo({
    super.key,
    required this.titulo,
    this.subtitulo,
    this.icone,
  });

  final String titulo;
  final String? subtitulo;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppTheme.espaco,
        AppTheme.espaco,
        AppTheme.espaco,
        8,
      ),
      child: Row(
        children: [
          if (icone != null) ...[
            Icon(icone, color: AppTheme.primaria),
            const SizedBox(width: 8),
          ],
          Expanded(child: Text(titulo, style: textos.titleLarge)),
          if (subtitulo != null) Text(subtitulo!, style: textos.bodySmall),
        ],
      ),
    );
  }
}
