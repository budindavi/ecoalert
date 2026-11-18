import 'package:flutter/material.dart';

import '../models/alerta.dart';
import '../theme/app_theme.dart';
import '../utils/formatadores.dart';
import 'alerta_imagem.dart';
import 'criticidade_badge.dart';
import 'info_item.dart';

/// Card de alerta crítico exibido na lista horizontal de destaques.
class AlertaCriticoCard extends StatelessWidget {
  const AlertaCriticoCard({
    super.key,
    required this.alerta,
    required this.onTap,
    this.largura = 240,
  });

  final Alerta alerta;
  final VoidCallback onTap;
  final double largura;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return SizedBox(
      width: largura,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AlertaImagem(
                    caminho: alerta.imagem,
                    tipo: alerta.tipoPrincipal,
                    largura: largura,
                    altura: 120,
                    raio: 0,
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.secundaria,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            alerta.tipoPrincipal.icone,
                            size: 13,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            alerta.tipoPrincipal.rotulo,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: CriticidadeBadge(alerta: alerta, tamanho: 36),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        alerta.titulo,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textos.titleMedium?.copyWith(fontSize: 15),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InfoItem(
                              icone: Icons.place_outlined,
                              texto: alerta.municipio,
                            ),
                          ),
                          const SizedBox(width: 6),
                          InfoItem(
                            icone: Icons.groups_outlined,
                            texto: Formatadores.numeroCompacto(
                              alerta.pessoasEmRisco,
                            ),
                            cor: alerta.corCriticidade,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
