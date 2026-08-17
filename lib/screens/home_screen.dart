import 'package:flutter/material.dart';
import '../widgets/gmail_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black54),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

      ),
      drawer: const GmailDrawer(),
      body: const Center(
        child: Text('Boîte de réception'),
      ),
    );
  }
}
