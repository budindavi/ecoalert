import 'package:flutter/material.dart';

import '../models/status_alerta.dart';

/// Selo colorido com a etapa atual do alerta.
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status, this.compacto = false});

  final StatusAlerta status;
  final bool compacto;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compacto ? 8 : 10,
        vertical: compacto ? 3 : 5,
      ),
      decoration: BoxDecoration(
        color: status.cor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(status.icone, size: compacto ? 12 : 15, color: status.cor),
          const SizedBox(width: 4),
          Text(
            status.rotulo,
            style: TextStyle(
              color: status.cor,
              fontSize: compacto ? 11 : 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
