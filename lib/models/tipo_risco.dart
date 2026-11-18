import 'package:flutter/material.dart';

/// Origem da anomalia captada pelos satélites.
enum TipoAnomalia { termica, atmosferica, hidrologica }

/// Categorias de risco climático monitoradas pelo EcoAlert.
///
/// Cada valor carrega rótulo, ícone, cor e o tipo de anomalia que o satélite
/// detecta. As regras de filtragem usam o próprio enum, nunca strings.
enum TipoRisco {
  queimada(
    'Queimada',
    Icons.local_fire_department_outlined,
    Color(0xFFE65100),
    TipoAnomalia.termica,
  ),
  enchente(
    'Enchente',
    Icons.flood_outlined,
    Color(0xFF1565C0),
    TipoAnomalia.hidrologica,
  ),
  deslizamento(
    'Deslizamento',
    Icons.landslide_outlined,
    Color(0xFF6D4C41),
    TipoAnomalia.hidrologica,
  ),
  tempestade(
    'Tempestade',
    Icons.thunderstorm_outlined,
    Color(0xFF5E35B1),
    TipoAnomalia.atmosferica,
  ),
  ondaDeCalor(
    'Onda de calor',
    Icons.thermostat_outlined,
    Color(0xFFD32F2F),
    TipoAnomalia.termica,
  ),
  seca('Seca', Icons.water_drop_outlined, Color(0xFFF9A825), TipoAnomalia.hidrologica),
  qualidadeDoAr(
    'Qualidade do ar',
    Icons.air,
    Color(0xFF546E7A),
    TipoAnomalia.atmosferica,
  );

  const TipoRisco(this.rotulo, this.icone, this.cor, this.anomalia);

  final String rotulo;
  final IconData icone;
  final Color cor;
  final TipoAnomalia anomalia;
}
