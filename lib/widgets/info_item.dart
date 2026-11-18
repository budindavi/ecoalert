import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Linha com ícone + texto, usada para informações complementares.
class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.icone,
    required this.texto,
    this.cor = AppTheme.textoSuave,
    this.maxLinhas = 1,
  });

  final IconData icone;
  final String texto;
  final Color cor;
  final int maxLinhas;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Icon(icone, size: 15, color: cor),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            texto,
            maxLines: maxLinhas,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: cor),
          ),
        ),
      ],
    );
  }
}
