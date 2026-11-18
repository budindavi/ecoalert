import 'package:flutter/material.dart';

import '../models/alerta.dart';
import '../theme/app_theme.dart';

/// Barra com 10 segmentos que representa a nota de criticidade do alerta.
class CriticidadeMedidor extends StatelessWidget {
  const CriticidadeMedidor({super.key, required this.alerta});

  final Alerta alerta;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('Criticidade', style: textos.titleMedium),
            ),
            Text(
              '${alerta.criticidade}/10 · ${alerta.nivel}',
              style: TextStyle(
                color: alerta.corCriticidade,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            for (var nivel = 1; nivel <= 10; nivel++)
              Expanded(
                child: Container(
                  height: 10,
                  margin: EdgeInsets.only(right: nivel == 10 ? 0 : 3),
                  decoration: BoxDecoration(
                    color: nivel <= alerta.criticidade
                        ? alerta.corCriticidade
                        : AppTheme.textoSuave.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
