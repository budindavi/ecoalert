import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const EcoAlertApp());
}

class EcoAlertApp extends StatelessWidget {
  const EcoAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoAlert',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      home: const HomeScreen(),
    );
  }
}
