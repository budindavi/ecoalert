import 'package:flutter/material.dart';

import '../models/tipo_risco.dart';

/// Imagem de um alerta com cantos arredondados.
///
/// Se o arquivo não for encontrado, mostra o ícone do tipo de risco para não
/// quebrar o layout.
class AlertaImagem extends StatelessWidget {
  const AlertaImagem({
    super.key,
    required this.caminho,
    required this.tipo,
    this.largura,
    this.altura,
    this.raio = 12,
  });

  final String caminho;
  final TipoRisco tipo;
  final double? largura;
  final double? altura;
  final double raio;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(raio),
      child: Image.asset(
        caminho,
        width: largura,
        height: altura,
        fit: BoxFit.cover,
        semanticLabel: 'Imagem do alerta de ${tipo.rotulo}',
        errorBuilder: (context, erro, stackTrace) => Container(
          width: largura,
          height: altura,
          color: tipo.cor.withValues(alpha: 0.15),
          alignment: Alignment.center,
          child: Icon(tipo.icone, color: tipo.cor, size: 36),
        ),
      ),
    );
  }
}
