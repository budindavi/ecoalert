import 'package:flutter/material.dart';

/// Identidade visual do EcoAlert.
class AppTheme {
  AppTheme._();

  static const Color primaria = Color(0xFF0B2545);
  static const Color secundaria = Color(0xFFFF6D00);
  static const Color fundo = Color(0xFFF2F4F8);
  static const Color texto = Color(0xFF15202B);
  static const Color textoSuave = Color(0xFF5B6675);

  static const double espaco = 16;
  static const double raio = 16;

  static ThemeData get tema {
    final esquema = ColorScheme.fromSeed(
      seedColor: primaria,
      primary: primaria,
      secondary: secundaria,
      surface: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: esquema,
      scaffoldBackgroundColor: fundo,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaria,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1.5,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raio),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: texto,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: texto,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: texto, height: 1.4),
        bodySmall: TextStyle(fontSize: 12.5, color: textoSuave),
      ),
    );
  }
}
