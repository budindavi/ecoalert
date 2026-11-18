import 'package:flutter/material.dart';

import '../models/alerta.dart';
import '../utils/formatadores.dart';
import 'alerta_imagem.dart';
import 'criticidade_badge.dart';
import 'info_item.dart';
import 'status_badge.dart';

/// Card de um alerta na lista principal (vertical).
class AlertaCard extends StatelessWidget {
  const AlertaCard({super.key, required this.alerta, required this.onTap});

  final Alerta alerta;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    final tipo = alerta.tipoPrincipal;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Hero(
                    tag: 'alerta-${alerta.id}',
                    child: AlertaImagem(
                      caminho: alerta.imagem,
                      tipo: tipo,
                      largura: 92,
                      altura: 100,
                    ),
                  ),
                  Positioned(
                    right: -6,
                    bottom: -6,
                    child: CriticidadeBadge(alerta: alerta, tamanho: 34),
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(tipo.icone, size: 16, color: tipo.cor),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            tipo.rotulo,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textos.bodySmall?.copyWith(
                              color: tipo.cor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        StatusBadge(status: alerta.status, compacto: true),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      alerta.titulo,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textos.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    InfoItem(
                      icone: Icons.place_outlined,
                      texto: alerta.municipio,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: InfoItem(
                            icone: Icons.satellite_alt_outlined,
                            texto:
                                '${alerta.fonte.nome} · ${Formatadores.tempoDecorrido(alerta.detectadoEm)}',
                          ),
                        ),
                        const SizedBox(width: 6),
                        InfoItem(
                          icone: Icons.groups_outlined,
                          texto: Formatadores.numeroCompacto(
                            alerta.pessoasEmRisco,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
