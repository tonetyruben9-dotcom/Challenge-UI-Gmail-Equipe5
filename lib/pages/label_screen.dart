import 'package:flutter/material.dart';

/// Écran de liste de mails pour chaque libellé du drawer Gmail.
///
/// Affiche le nom du libellé en titre et une liste vide avec une
/// illustration indiquant qu'il n'y a pas de messages.
class LabelScreen extends StatelessWidget {
  const LabelScreen({
    required this.label,
    required this.icon,
    super.key,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          label,
          style: const TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black54),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFF4285F4),
              child: Text('A', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 20),
            Text(
              'Aucun message dans\n$label',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 8),
            Text(
              'Les messages apparaîtront ici',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            ),
          ],
        ),
      ),
    );
  }
}
