import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Etapas do fluxo de inteligência do EcoAlert: captação, triagem e ação.
class FluxoInteligencia extends StatelessWidget {
  const FluxoInteligencia({super.key});

  static const List<(IconData, String, String)> _etapas = [
    (Icons.satellite_alt, 'Captação', 'Satélites enviam anomalias'),
    (Icons.psychology_outlined, 'Triagem', 'Cruzamento com áreas de risco'),
    (Icons.emergency_share, 'Ação', 'Alerta para a Defesa Civil'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _etapas.length; i++) ...[
          Expanded(child: _Etapa(etapa: _etapas[i])),
          if (i < _etapas.length - 1)
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Icon(Icons.chevron_right, color: AppTheme.textoSuave),
            ),
        ],
      ],
    );
  }
}

class _Etapa extends StatelessWidget {
  const _Etapa({required this.etapa});

  final (IconData, String, String) etapa;

  @override
  Widget build(BuildContext context) {
    final (icone, titulo, descricao) = etapa;
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppTheme.primaria,
          child: Icon(icone, color: Colors.white, size: 22),
        ),
        const SizedBox(height: 6),
        Text(titulo, style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: 2),
        Text(
          descricao,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
