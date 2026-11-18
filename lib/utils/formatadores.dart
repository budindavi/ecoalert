/// Funções de formatação reaproveitadas pelos componentes.
class Formatadores {
  Formatadores._();

  static String tempoDecorrido(DateTime data, {DateTime? agora}) {
    final diferenca = (agora ?? DateTime.now()).difference(data);
    if (diferenca.inMinutes < 1) return 'agora';
    if (diferenca.inMinutes < 60) return 'há ${diferenca.inMinutes} min';
    if (diferenca.inHours < 24) return 'há ${diferenca.inHours} h';
    return 'há ${diferenca.inDays} d';
  }

  /// 12400 -> "12,4 mil"
  static String numeroCompacto(int valor) {
    if (valor < 1000) return '$valor';
    final milhares = valor / 1000;
    final texto = milhares >= 10
        ? milhares.toStringAsFixed(0)
        : milhares.toStringAsFixed(1).replaceAll('.', ',');
    return '$texto mil';
  }

  static String horario(DateTime data) {
    String doisDigitos(int n) => n.toString().padLeft(2, '0');
    return '${doisDigitos(data.day)}/${doisDigitos(data.month)} às '
        '${doisDigitos(data.hour)}:${doisDigitos(data.minute)}';
  }
}
