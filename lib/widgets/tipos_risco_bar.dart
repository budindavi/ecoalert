import 'package:flutter/material.dart';

import '../models/tipo_risco.dart';
import '../theme/app_theme.dart';
import 'tipo_risco_chip.dart';

/// Lista horizontal de tipos de risco com a opção "Todos" (valor `null`).
class TiposRiscoBar extends StatelessWidget {
  const TiposRiscoBar({
    super.key,
    required this.selecionado,
    required this.onSelecionar,
  });

  final TipoRisco? selecionado;
  final ValueChanged<TipoRisco?> onSelecionar;

  /// "Todos" (null) seguido de todos os valores do enum.
  static final List<TipoRisco?> _opcoes = [null, ...TipoRisco.values];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.espaco,
          vertical: 8,
        ),
        itemCount: _opcoes.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final tipo = _opcoes[index];
          return TipoRiscoChip(
            tipo: tipo,
            selecionado: tipo == selecionado,
            onTap: () => onSelecionar(tipo),
          );
        },
      ),
    );
  }
}
