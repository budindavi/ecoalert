import '../models/alerta.dart';
import '../models/fonte_orbital.dart';
import '../models/status_alerta.dart';
import '../models/tipo_risco.dart';

/// Fonte única dos alertas do aplicativo.
///
/// Simula, em memória, a saída do motor de triagem do EcoAlert. As telas
/// consultam este repositório e nunca criam nem filtram dados por conta
/// própria.
class AlertaRepository {
  AlertaRepository._();

  /// Instância compartilhada: todas as telas enxergam os mesmos objetos.
  static final AlertaRepository instancia = AlertaRepository._();

  static const _imagens = 'assets/images';

  static DateTime _minutosAtras(int minutos) =>
      DateTime.now().subtract(Duration(minutes: minutos));

  final List<Alerta> _alertas = [
    Alerta(
      id: 1,
      titulo: 'Movimento de massa em encosta crítica',
      descricao:
          'O radar do Sentinel-1 identificou deslocamento do solo de 4 cm em '
          '48 h, somado a 180 mm de chuva acumulada. A encosta está cadastrada '
          'como área de risco alto, com moradias na base.',
      imagem: '$_imagens/deslizamento.jpg',
      municipio: 'Petrópolis - RJ',
      areaVulneravel: 'Encosta do Morro da Oficina',
      fonte: FonteOrbital.sentinel1,
      detectadoEm: _minutosAtras(12),
      criticidade: 10,
      pessoasEmRisco: 1850,
      tipos: [TipoRisco.deslizamento, TipoRisco.tempestade],
      status: StatusAlerta.emTriagem,
      destaque: true,
    ),
    Alerta(
      id: 2,
      titulo: 'Transbordamento iminente do Rio Taquari',
      descricao:
          'A leitura hidrológica indica alta de 2,3 m em 6 h no nível do rio. '
          'O modelo projeta que a água chega às ruas da várzea em cerca de '
          '5 horas.',
      imagem: '$_imagens/alagamento.jpg',
      municipio: 'Lajeado - RS',
      areaVulneravel: 'Várzea do Bairro Centenário',
      fonte: FonteOrbital.sentinel2,
      detectadoEm: _minutosAtras(25),
      criticidade: 9,
      pessoasEmRisco: 12400,
      tipos: [TipoRisco.enchente],
      status: StatusAlerta.detectado,
      destaque: true,
    ),
    Alerta(
      id: 3,
      titulo: 'Foco de queimada avançando sobre mata seca',
      descricao:
          'Anomalia térmica com 14 focos ativos em uma frente de 6 km. O vento '
          'leva o fogo na direção de uma comunidade ribeirinha.',
      imagem: '$_imagens/queimada.jpg',
      municipio: 'Altamira - PA',
      areaVulneravel: 'Mata seca da Volta Grande do Xingu',
      fonte: FonteOrbital.aquaModis,
      detectadoEm: _minutosAtras(40),
      criticidade: 9,
      pessoasEmRisco: 3200,
      tipos: [TipoRisco.queimada, TipoRisco.qualidadeDoAr],
      status: StatusAlerta.equipeAcionada,
      destaque: true,
    ),
    Alerta(
      id: 4,
      titulo: 'Pluma de fumaça densa sobre área urbana',
      descricao:
          'Os dados atmosféricos mostram fumaça de incêndios no Pantanal '
          'cobrindo a cidade. A projeção indica qualidade do ar péssima nas '
          'próximas 24 h.',
      imagem: '$_imagens/fumaca.jpg',
      municipio: 'Corumbá - MS',
      areaVulneravel: 'Perímetro urbano e escolas',
      fonte: FonteOrbital.goes16,
      detectadoEm: _minutosAtras(75),
      criticidade: 8,
      pessoasEmRisco: 9800,
      tipos: [TipoRisco.qualidadeDoAr, TipoRisco.queimada],
      status: StatusAlerta.emTriagem,
      destaque: true,
    ),
    Alerta(
      id: 5,
      titulo: 'Célula de tempestade severa em formação',
      descricao:
          'O satélite geoestacionário mostra nuvens com topo a -70 °C e '
          'crescimento rápido. Há risco de granizo, ventos acima de 90 km/h e '
          'alagamentos repentinos.',
      imagem: '$_imagens/tempestade.jpg',
      municipio: 'Curitiba - PR',
      areaVulneravel: 'Bacia do Rio Belém',
      fonte: FonteOrbital.goes16,
      detectadoEm: _minutosAtras(18),
      criticidade: 7,
      pessoasEmRisco: 5400,
      tipos: [TipoRisco.tempestade, TipoRisco.enchente],
      status: StatusAlerta.detectado,
    ),
    Alerta(
      id: 6,
      titulo: 'Ilha de calor extremo no centro urbano',
      descricao:
          'O sensor térmico registrou superfície acima de 52 °C em bairros de '
          'pouca arborização. Idosos e trabalhadores ao ar livre correm mais '
          'risco.',
      imagem: '$_imagens/calor.jpg',
      municipio: 'Cuiabá - MT',
      areaVulneravel: 'Bairros Centro-Sul e Porto',
      fonte: FonteOrbital.landsat9,
      detectadoEm: _minutosAtras(160),
      criticidade: 6,
      pessoasEmRisco: 48000,
      tipos: [TipoRisco.ondaDeCalor],
      status: StatusAlerta.emTriagem,
    ),
    Alerta(
      id: 7,
      titulo: 'Seca severa isola comunidades ribeirinhas',
      descricao:
          'As imagens mostram o leito do rio 70% abaixo da média. Barcos de '
          'abastecimento não conseguem chegar às comunidades.',
      imagem: '$_imagens/seca.jpg',
      municipio: 'Tefé - AM',
      areaVulneravel: 'Lago de Tefé e comunidades do entorno',
      fonte: FonteOrbital.amazonia1,
      detectadoEm: _minutosAtras(300),
      criticidade: 7,
      pessoasEmRisco: 2600,
      tipos: [TipoRisco.seca],
      status: StatusAlerta.equipeAcionada,
    ),
    Alerta(
      id: 8,
      titulo: 'Cicatrizes de deslizamento após chuva',
      descricao:
          'A comparação entre imagens de antes e depois mostrou 3 novas '
          'cicatrizes de deslizamento perto de áreas habitadas. A vistoria '
          'em campo já foi agendada.',
      imagem: '$_imagens/deslizamento_satelite.jpg',
      municipio: 'Petrópolis - RJ',
      areaVulneravel: 'Encostas do Alto da Serra',
      fonte: FonteOrbital.sentinel2,
      detectadoEm: _minutosAtras(420),
      criticidade: 6,
      pessoasEmRisco: 450,
      tipos: [TipoRisco.deslizamento],
      status: StatusAlerta.equipeAcionada,
    ),
    Alerta(
      id: 9,
      titulo: 'Anomalia térmica em zona de preservação',
      descricao:
          'Foco isolado detectado no parque nacional. A brigada confirmou que '
          'o incêndio foi controlado e a área segue em monitoramento.',
      imagem: '$_imagens/termica.png',
      municipio: 'Alto Paraíso de Goiás - GO',
      areaVulneravel: 'Parque Nacional da Chapada dos Veadeiros',
      fonte: FonteOrbital.cbers4a,
      detectadoEm: _minutosAtras(900),
      criticidade: 5,
      pessoasEmRisco: 300,
      tipos: [TipoRisco.queimada],
      status: StatusAlerta.controlado,
    ),
    Alerta(
      id: 10,
      titulo: 'Queda de árvores após vendaval',
      descricao:
          'Uma rajada de vento de 85 km/h derrubou árvores e afetou a rede '
          'elétrica. As vias foram liberadas pelas equipes de campo.',
      imagem: '$_imagens/arvore.jpg',
      municipio: 'São Paulo - SP',
      areaVulneravel: 'Zona Sul - Santo Amaro',
      fonte: FonteOrbital.goes16,
      detectadoEm: _minutosAtras(1300),
      criticidade: 4,
      pessoasEmRisco: 700,
      tipos: [TipoRisco.tempestade],
      status: StatusAlerta.controlado,
    ),
  ];

  /// Todos os alertas, do mais crítico para o menos crítico.
  List<Alerta> obterTodos() {
    final ordenados = List<Alerta>.of(_alertas)
      ..sort((a, b) => b.criticidade.compareTo(a.criticidade));
    return List.unmodifiable(ordenados);
  }

  /// Alertas de um tipo de risco. `null` representa a opção "Todos".
  List<Alerta> obterPorTipo(TipoRisco? tipo) {
    if (tipo == null) return obterTodos();
    return obterTodos().where((a) => a.envolve(tipo)).toList();
  }

  /// Alertas marcados como destaque (críticos).
  List<Alerta> obterCriticos() =>
      obterTodos().where((a) => a.destaque).toList();

  int get totalAtivos => _alertas.where((a) => a.status.ativo).length;

  int get totalCriticos => _alertas.where((a) => a.destaque).length;

  int get pessoasEmRisco => _alertas
      .where((a) => a.status.ativo)
      .fold(0, (soma, a) => soma + a.pessoasEmRisco);

  int get totalSatelites => _alertas.map((a) => a.fonte).toSet().length;

  /// Ação imediata: aciona a equipe de campo para o alerta.
  void acionarEquipe(Alerta alerta) {
    if (alerta.status == StatusAlerta.detectado ||
        alerta.status == StatusAlerta.emTriagem) {
      alerta.status = StatusAlerta.equipeAcionada;
    }
  }
}
