import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

/// Point d'entrée de l'application Gmail.
///
/// Configure le thème Material 3 et lance l'écran splash.
void main() {
  runApp(const GmailApp());
}

/// Widget racine de l'application Gmail.
///
/// Définit le thème basé sur Material 3 avec une couleur seed bleue.
class GmailApp extends StatelessWidget {
  const GmailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
