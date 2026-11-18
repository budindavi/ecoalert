import 'package:flutter/material.dart';

import '../models/alerta.dart';
import '../models/status_alerta.dart';
import '../repositories/alerta_repository.dart';
import '../theme/app_theme.dart';
import '../utils/formatadores.dart';
import '../widgets/alerta_imagem.dart';
import '../widgets/criticidade_medidor.dart';
import '../widgets/info_item.dart';
import '../widgets/status_badge.dart';
import '../widgets/tipo_risco_chip.dart';

/// Detalhes de um alerta, com a ação de acionar a equipe de campo.
class DetalheAlertaScreen extends StatefulWidget {
  const DetalheAlertaScreen({super.key, required this.alerta});

  final Alerta alerta;

  @override
  State<DetalheAlertaScreen> createState() => _DetalheAlertaScreenState();
}

class _DetalheAlertaScreenState extends State<DetalheAlertaScreen> {
  final AlertaRepository _repositorio = AlertaRepository.instancia;

  Alerta get _alerta => widget.alerta;

  bool get _podeAcionar =>
      _alerta.status == StatusAlerta.detectado ||
      _alerta.status == StatusAlerta.emTriagem;

  void _acionarEquipe() {
    setState(() => _repositorio.acionarEquipe(_alerta));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'Equipe de campo acionada para ${_alerta.municipio}.',
          ),
        ),
      );
  }

  String get _rotuloBotao {
    switch (_alerta.status) {
      case StatusAlerta.detectado:
      case StatusAlerta.emTriagem:
        return 'Acionar equipe de campo';
      case StatusAlerta.equipeAcionada:
        return 'Equipe a caminho';
      case StatusAlerta.controlado:
        return 'Ocorrência controlada';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do alerta')),
      body: ListView(
        padding: const EdgeInsets.all(AppTheme.espaco),
        children: [
          Hero(
            tag: 'alerta-${_alerta.id}',
            child: AlertaImagem(
              caminho: _alerta.imagem,
              tipo: _alerta.tipoPrincipal,
              largura: double.infinity,
              altura: 220,
              raio: AppTheme.raio,
            ),
          ),
          const SizedBox(height: AppTheme.espaco),
          Row(
            children: [
              StatusBadge(status: _alerta.status),
              const Spacer(),
              Text(
                Formatadores.tempoDecorrido(_alerta.detectadoEm),
                style: textos.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(_alerta.titulo, style: textos.titleLarge),
          const SizedBox(height: AppTheme.espaco),
          CriticidadeMedidor(alerta: _alerta),
          const SizedBox(height: AppTheme.espaco),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.espaco),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoItem(
                    icone: Icons.place_outlined,
                    texto: _alerta.municipio,
                  ),
                  const SizedBox(height: 8),
                  InfoItem(
                    icone: Icons.terrain_outlined,
                    texto: _alerta.areaVulneravel,
                    maxLinhas: 2,
                  ),
                  const SizedBox(height: 8),
                  InfoItem(
                    icone: Icons.satellite_alt_outlined,
                    texto:
                        '${_alerta.fonte.nome} (${_alerta.fonte.agencia})',
                  ),
                  const SizedBox(height: 8),
                  InfoItem(
                    icone: Icons.schedule,
                    texto:
                        'Detectado em ${Formatadores.horario(_alerta.detectadoEm)}',
                  ),
                  const SizedBox(height: 8),
                  InfoItem(
                    icone: Icons.groups_outlined,
                    texto: '${_alerta.pessoasEmRisco} pessoas na área de risco',
                    cor: _alerta.corCriticidade,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppTheme.espaco),
          Text('Tipos de risco', style: textos.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tipo in _alerta.tipos) TipoRiscoChip(tipo: tipo),
            ],
          ),
          const SizedBox(height: AppTheme.espaco),
          Text('Análise do motor de triagem', style: textos.titleMedium),
          const SizedBox(height: 8),
          Text(_alerta.descricao, style: textos.bodyMedium),
          const SizedBox(height: 24),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppTheme.espaco,
            8,
            AppTheme.espaco,
            AppTheme.espaco,
          ),
          child: FilledButton.icon(
            onPressed: _podeAcionar ? _acionarEquipe : null,
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              backgroundColor: AppTheme.secundaria,
            ),
            icon: Icon(
              _podeAcionar ? Icons.emergency_share : _alerta.status.icone,
            ),
            label: Text(_rotuloBotao),
          ),
        ),
      ),
    );
  }
}
