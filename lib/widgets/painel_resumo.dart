import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/formatadores.dart';
import 'resumo_card.dart';

/// Cabeçalho da central com os indicadores gerais de monitoramento.
class PainelResumo extends StatelessWidget {
  const PainelResumo({
    super.key,
    required this.ativos,
    required this.criticos,
    required this.pessoasEmRisco,
    required this.satelites,
  });

  final int ativos;
  final int criticos;
  final int pessoasEmRisco;
  final int satelites;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        AppTheme.espaco,
        4,
        AppTheme.espaco,
        AppTheme.espaco,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.primaria,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.circle, size: 10, color: Color(0xFF69F0AE)),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Monitoramento orbital ativo',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            'Central de alertas climáticos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ResumoCard(
                  valor: '$ativos',
                  rotulo: 'Ativos',
                  icone: Icons.notifications_active_outlined,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ResumoCard(
                  valor: '$criticos',
                  rotulo: 'Críticos',
                  icone: Icons.warning_amber_rounded,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ResumoCard(
                  valor: Formatadores.numeroCompacto(pessoasEmRisco),
                  rotulo: 'Em risco',
                  icone: Icons.groups_outlined,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ResumoCard(
                  valor: '$satelites',
                  rotulo: 'Satélites',
                  icone: Icons.satellite_alt_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
