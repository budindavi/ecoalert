import 'package:flutter/material.dart';

import 'fonte_orbital.dart';
import 'status_alerta.dart';
import 'tipo_risco.dart';

/// Alerta gerado a partir de uma anomalia captada por satélite e cruzada
/// com o cadastro de áreas vulneráveis.
class Alerta {
  Alerta({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.imagem,
    required this.municipio,
    required this.areaVulneravel,
    required this.fonte,
    required this.detectadoEm,
    required this.criticidade,
    required this.pessoasEmRisco,
    required this.tipos,
    required this.status,
    this.destaque = false,
  })  : assert(tipos.isNotEmpty, 'O alerta precisa de ao menos um tipo de risco.'),
        assert(
          criticidade >= 1 && criticidade <= 10,
          'A criticidade vai de 1 a 10.',
        );

  final int id;
  final String titulo;
  final String descricao;

  /// Caminho do arquivo em `assets/images`.
  final String imagem;
  final String municipio;

  /// Área do cadastro geográfico afetada (encosta, mata seca, várzea...).
  final String areaVulneravel;
  final FonteOrbital fonte;
  final DateTime detectadoEm;

  /// Nota de criticidade atribuída pelo motor de triagem (1 a 10).
  final int criticidade;
  final int pessoasEmRisco;

  /// Um alerta pode envolver mais de um tipo de risco.
  final List<TipoRisco> tipos;

  StatusAlerta status;

  /// Alertas críticos exibidos na seção de destaques.
  final bool destaque;

  TipoRisco get tipoPrincipal => tipos.first;

  bool envolve(TipoRisco tipo) => tipos.contains(tipo);

  String get nivel {
    if (criticidade >= 9) return 'Extremo';
    if (criticidade >= 7) return 'Alto';
    if (criticidade >= 4) return 'Moderado';
    return 'Baixo';
  }

  Color get corCriticidade {
    if (criticidade >= 9) return const Color(0xFFB71C1C);
    if (criticidade >= 7) return const Color(0xFFE65100);
    if (criticidade >= 4) return const Color(0xFFF9A825);
    return const Color(0xFF2E7D32);
  }
}
