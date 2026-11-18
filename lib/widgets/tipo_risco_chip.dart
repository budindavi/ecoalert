import 'package:flutter/material.dart';

import '../models/tipo_risco.dart';
import '../theme/app_theme.dart';

/// Chip de tipo de risco, usado no filtro e na tela de detalhes.
///
/// [tipo] nulo representa a opção "Todos".
class TipoRiscoChip extends StatelessWidget {
  const TipoRiscoChip({
    super.key,
    required this.tipo,
    this.selecionado = false,
    this.onTap,
  });

  final TipoRisco? tipo;
  final bool selecionado;
  final VoidCallback? onTap;

  String get _rotulo => tipo?.rotulo ?? 'Todos';
  IconData get _icone => tipo?.icone ?? Icons.public;
  Color get _cor => tipo?.cor ?? AppTheme.primaria;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onTap != null,
      selected: selecionado,
      label: 'Tipo de risco $_rotulo',
      child: Material(
        color: selecionado ? _cor : Colors.white,
        borderRadius: BorderRadius.circular(24),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: selecionado ? _cor : _cor.withValues(alpha: 0.35),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _icone,
                  size: 18,
                  color: selecionado ? Colors.white : _cor,
                ),
                const SizedBox(width: 6),
                Text(
                  _rotulo,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: selecionado ? Colors.white : AppTheme.texto,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
