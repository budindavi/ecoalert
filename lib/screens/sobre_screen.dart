import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/fluxo_inteligencia.dart';

/// Apresenta a proposta do EcoAlert, o fluxo de inteligência e os ODS.
class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o EcoAlert')),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.espaco),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.raio),
            child: Image.asset(
              'assets/images/satelite.jpg',
              height: 180,
              fit: BoxFit.cover,
              semanticLabel: 'Satélite de observação da Terra em órbita',
            ),
          ),
          const SizedBox(height: AppTheme.espaco),
          Text('Tecnologia espacial a serviço da vida', style: textos.titleLarge),
          const SizedBox(height: 8),
          Text(
            'O EcoAlert conecta dados de satélites de agências globais à '
            'Defesa Civil e às equipes de campo. A plataforma reduz o tempo '
            'de resposta a eventos climáticos extremos em áreas urbanas '
            'vulneráveis e em zonas de preservação.',
            style: textos.bodyMedium,
          ),
          const SizedBox(height: 24),
          Text('Fluxo de inteligência', style: textos.titleMedium),
          const SizedBox(height: 12),
          const FluxoInteligencia(),
          const SizedBox(height: 24),
          Text('Objetivos de Desenvolvimento Sustentável', style: textos.titleMedium),
          const SizedBox(height: 8),
          const _OdsItem(
            numero: 11,
            titulo: 'Cidades e comunidades sustentáveis',
            descricao: 'Cidades mais seguras e preparadas contra desastres.',
            cor: Color(0xFFF99D26),
          ),
          const SizedBox(height: 8),
          const _OdsItem(
            numero: 13,
            titulo: 'Ação contra a mudança global do clima',
            descricao: 'Resposta rápida a riscos climáticos com inteligência de dados.',
            cor: Color(0xFF3F7E44),
          ),
        ],
      ),
    );
  }
}

class _OdsItem extends StatelessWidget {
  const _OdsItem({
    required this.numero,
    required this.titulo,
    required this.descricao,
    required this.cor,
  });

  final int numero;
  final String titulo;
  final String descricao;
  final Color cor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: cor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'ODS\n$numero',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(descricao, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
