import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const GmailApp());
}

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
