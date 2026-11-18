import 'package:flutter/material.dart';

import '../models/alerta.dart';

/// Selo com a nota de criticidade (1 a 10) e a cor do nível de risco.
class CriticidadeBadge extends StatelessWidget {
  const CriticidadeBadge({super.key, required this.alerta, this.tamanho = 40});

  final Alerta alerta;
  final double tamanho;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Criticidade ${alerta.criticidade} de 10, nível ${alerta.nivel}',
      child: Container(
        width: tamanho,
        height: tamanho,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: alerta.corCriticidade,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Text(
          '${alerta.criticidade}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: tamanho * 0.42,
          ),
        ),
      ),
    );
  }
}
