import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Mensagem exibida quando um filtro não retorna alertas.
class ListaVazia extends StatelessWidget {
  const ListaVazia({super.key, required this.mensagem});

  final String mensagem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          const Icon(Icons.inbox_outlined, size: 48, color: AppTheme.textoSuave),
          const SizedBox(height: 8),
          Text(
            mensagem,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
