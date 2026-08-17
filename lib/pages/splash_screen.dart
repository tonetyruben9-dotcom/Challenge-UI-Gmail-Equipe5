import 'package:flutter/material.dart';
import 'home_screen.dart';

/// Écran de démarrage (splash screen) affiché à l'ouverture de l'app.
///
/// Affiche le logo Gmail et "Google Workspace" avec un effet de fondu,
/// puis redirige vers [HomeScreen] après 4 secondes.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Contrôleur d'animation pour l'effet de fondu (fade in)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    // Animation d'opacité de 0.0 (invisible) à 1.0 (visible)
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();

    // Redirection vers HomeScreen après 4 secondes de splash
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        // Transition en fondu vers l'écran d'accueil
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _opacityAnimation,
        child: Column(
          children: [
            const Spacer(flex: 3),
            Center(
              child: Image.asset(
                'assets/gmail_logo.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Google Workspace',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                letterSpacing: 0.5,
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
