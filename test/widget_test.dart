import 'package:ecoalert/main.dart';
import 'package:ecoalert/models/status_alerta.dart';
import 'package:ecoalert/models/tipo_risco.dart';
import 'package:ecoalert/repositories/alerta_repository.dart';
import 'package:ecoalert/widgets/alerta_card.dart';
import 'package:ecoalert/widgets/alerta_critico_card.dart';
import 'package:ecoalert/widgets/tipo_risco_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final repositorio = AlertaRepository.instancia;

  group('AlertaRepository', () {
    test('possui ao menos 5 alertas ordenados por criticidade', () {
      final alertas = repositorio.obterTodos();
      expect(alertas.length, greaterThanOrEqualTo(5));
      for (var i = 1; i < alertas.length; i++) {
        expect(alertas[i - 1].criticidade >= alertas[i].criticidade, isTrue);
      }
    });

    test('alertas críticos vêm do atributo destaque', () {
      final criticos = repositorio.obterCriticos();
      expect(criticos.length, greaterThanOrEqualTo(3));
      expect(criticos.every((a) => a.destaque), isTrue);
    });

    test('filtra por tipo de risco usando o enum', () {
      for (final tipo in TipoRisco.values) {
        final filtrados = repositorio.obterPorTipo(tipo);
        expect(filtrados, isNotEmpty);
        expect(filtrados.every((a) => a.tipos.contains(tipo)), isTrue);
      }
      expect(
        repositorio.obterPorTipo(null).length,
        repositorio.obterTodos().length,
      );
    });

    test('um alerta pode ter mais de um tipo de risco', () {
      expect(repositorio.obterTodos().any((a) => a.tipos.length > 1), isTrue);
    });

    test('acionar equipe muda o status do alerta', () {
      final alerta = repositorio
          .obterTodos()
          .firstWhere((a) => a.status == StatusAlerta.detectado);
      repositorio.acionarEquipe(alerta);
      expect(alerta.status, StatusAlerta.equipeAcionada);
    });
  });

  testWidgets('tela inicial mostra críticos e filtra por tipo de risco',
      (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.5;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const EcoAlertApp());
    await tester.pumpAndSettle();

    expect(find.text('EcoAlert'), findsOneWidget);
    expect(find.text('Alertas críticos'), findsOneWidget);
    expect(find.byType(AlertaCriticoCard), findsWidgets);
    expect(find.text('Todos'), findsOneWidget);

    final chip = find.widgetWithText(TipoRiscoChip, 'Enchente');
    await tester.ensureVisible(chip);
    await tester.pumpAndSettle();
    await tester.tap(chip);
    await tester.pumpAndSettle();

    final total = repositorio.obterPorTipo(TipoRisco.enchente).length;
    expect(find.text('Enchente · $total'), findsOneWidget);
    expect(find.byType(AlertaCard), findsNWidgets(total));
  });
}
