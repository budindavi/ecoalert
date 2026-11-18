import 'package:flutter/material.dart';

import '../models/alerta.dart';
import '../theme/app_theme.dart';
import 'alerta_critico_card.dart';

/// Lista horizontal dos alertas críticos (destaques).
class AlertasCriticosLista extends StatelessWidget {
  const AlertasCriticosLista({
    super.key,
    required this.alertas,
    required this.onSelecionar,
  });

  final List<Alerta> alertas;
  final ValueChanged<Alerta> onSelecionar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 222,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.espaco),
        itemCount: alertas.length,
        itemBuilder: (context, index) {
          final alerta = alertas[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index == alertas.length - 1 ? 0 : 12,
              bottom: 4,
            ),
            child: AlertaCriticoCard(
              alerta: alerta,
              onTap: () => onSelecionar(alerta),
            ),
          );
        },
      ),
    );
  }
}
