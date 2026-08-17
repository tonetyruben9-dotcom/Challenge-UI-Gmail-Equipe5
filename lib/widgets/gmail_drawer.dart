import 'package:flutter/material.dart';

/// Menu latéral (drawer) de l'application Gmail.
///
/// Affiche le titre "Gmail" en rouge avec un séparateur en dessous.
class GmailDrawer extends StatelessWidget {
  const GmailDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
              child: const Text(
                'Gmail',
                style: TextStyle(
                  color: Color(0xFFEA4335),
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
