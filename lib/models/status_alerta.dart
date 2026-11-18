import 'package:flutter/material.dart';

/// Etapas do fluxo de inteligência: captação, triagem e ação imediata.
enum StatusAlerta {
  detectado('Detectado', Icons.satellite_alt, Color(0xFFD32F2F)),
  emTriagem('Em triagem', Icons.manage_search, Color(0xFFEF6C00)),
  equipeAcionada('Equipe acionada', Icons.emergency_share, Color(0xFF1565C0)),
  controlado('Controlado', Icons.verified_outlined, Color(0xFF2E7D32));

  const StatusAlerta(this.rotulo, this.icone, this.cor);

  final String rotulo;
  final IconData icone;
  final Color cor;

  bool get ativo => this != StatusAlerta.controlado;
}
