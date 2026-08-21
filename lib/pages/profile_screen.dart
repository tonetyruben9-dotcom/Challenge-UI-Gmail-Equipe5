import 'package:flutter/material.dart';

/// Écran Profil et Paramètres façon Gmail.
///
/// Conforme aux images de référence : 2 comptes, gestion, règles.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        title: const Text(
          'Paramètres',
          style: TextStyle(color: Colors.black87, fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _AccountTile(
            initials: 'K',
            name: 'Akalete Koffi Levis',
            email: '.akalete20@gmail.com',
            avatarColor: const Color(0xFF34A853),
            isSelected: true,
          ),
          _AccountTile(
            initials: 'A',
            name: 'Akalete Koffi Levis',
            email: 'koffilevis21@gmail.com',
            avatarColor: const Color(0xFF4285F4),
            isSelected: false,
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.person_add_alt_outlined, color: Colors.black87, size: 22),
            title: const Text(
              'Ajouter un autre compte',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fonction non disponible dans cette démo')),
              );
            },
          ),
          const Divider(height: 1, indent: 56),
          ListTile(
            leading: const Icon(Icons.settings_outlined, color: Colors.black87, size: 22),
            title: const Text(
              'Gérer les comptes sur cet appareil',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            onTap: () {},
          ),
          const Divider(height: 1, indent: 56),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Gestion du compte non disponible dans cette démo')),
                );
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Gérer votre compte Google', style: TextStyle(fontSize: 14)),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Divider(height: 1),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Règles de confidentialité + Conditions d\'utilisation',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({
    required this.initials,
    required this.name,
    required this.email,
    required this.avatarColor,
    required this.isSelected,
  });

  final String initials;
  final String name;
  final String email;
  final Color avatarColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: avatarColor,
        child: Text(
          initials,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87),
      ),
      subtitle: Text(
        email,
        style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
      ),
      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Color(0xFF4285F4), size: 22)
          : null,
      onTap: () {},
    );
  }
}
