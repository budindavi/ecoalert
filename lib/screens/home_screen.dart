import 'package:flutter/material.dart';

import '../models/alerta.dart';
import '../models/tipo_risco.dart';
import '../repositories/alerta_repository.dart';
import '../theme/app_theme.dart';
import '../widgets/alerta_card.dart';
import '../widgets/alertas_criticos_lista.dart';
import '../widgets/lista_vazia.dart';
import '../widgets/painel_resumo.dart';
import '../widgets/secao_titulo.dart';
import '../widgets/tipos_risco_bar.dart';
import 'detalhe_alerta_screen.dart';
import 'sobre_screen.dart';

/// Tela principal: indicadores, alertas críticos, filtro por tipo de risco
/// e lista de alertas.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AlertaRepository _repositorio = AlertaRepository.instancia;

  /// `null` = opção "Todos".
  TipoRisco? _tipoSelecionado;
  List<Alerta> _alertas = [];
  List<Alerta> _criticos = [];

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  /// Busca no repositório os dados exibidos. A regra de filtragem fica aqui
  /// e no repositório, fora do método `build`.
  void _carregarDados() {
    _alertas = _repositorio.obterPorTipo(_tipoSelecionado);
    _criticos = _repositorio.obterCriticos();
  }

  void _selecionarTipo(TipoRisco? tipo) {
    setState(() {
      _tipoSelecionado = tipo;
      _carregarDados();
    });
  }

  Future<void> _abrirDetalhes(Alerta alerta) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => DetalheAlertaScreen(alerta: alerta),
      ),
    );
    // O status pode ter mudado na tela de detalhes (equipe acionada).
    setState(_carregarDados);
  }

  void _abrirSobre() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const SobreScreen()),
    );
  }

  String get _rotuloFiltro => _tipoSelecionado?.rotulo ?? 'Todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppTheme.espaco,
        title: const Row(
          children: [
            Icon(Icons.public),
            SizedBox(width: 8),
            Text('EcoAlert', style: TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Sobre o EcoAlert',
            icon: const Icon(Icons.info_outline),
            onPressed: _abrirSobre,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 24),
        // +1 para o cabeçalho; +1 para a mensagem quando a lista está vazia.
        itemCount: 1 + (_alertas.isEmpty ? 1 : _alertas.length),
        itemBuilder: (context, index) {
          if (index == 0) return _construirCabecalho();
          if (_alertas.isEmpty) {
            return const ListaVazia(
              mensagem: 'Nenhum alerta ativo para este tipo de risco.',
            );
          }
          final alerta = _alertas[index - 1];
          return Padding(
            padding: const EdgeInsets.fromLTRB(
              AppTheme.espaco,
              0,
              AppTheme.espaco,
              12,
            ),
            child: AlertaCard(
              alerta: alerta,
              onTap: () => _abrirDetalhes(alerta),
            ),
          );
        },
      ),
    );
  }

  Widget _construirCabecalho() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PainelResumo(
          ativos: _repositorio.totalAtivos,
          criticos: _repositorio.totalCriticos,
          pessoasEmRisco: _repositorio.pessoasEmRisco,
          satelites: _repositorio.totalSatelites,
        ),
        const SecaoTitulo(
          titulo: 'Alertas críticos',
          icone: Icons.warning_amber_rounded,
        ),
        AlertasCriticosLista(
          alertas: _criticos,
          onSelecionar: _abrirDetalhes,
        ),
        const SecaoTitulo(titulo: 'Tipos de risco', icone: Icons.tune),
        TiposRiscoBar(
          selecionado: _tipoSelecionado,
          onSelecionar: _selecionarTipo,
        ),
        SecaoTitulo(
          titulo: 'Alertas',
          icone: Icons.list_alt,
          subtitulo: '$_rotuloFiltro · ${_alertas.length}',
        ),
      ],
    );
  }
}
