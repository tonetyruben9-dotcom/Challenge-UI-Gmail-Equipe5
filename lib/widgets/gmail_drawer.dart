import 'package:flutter/material.dart';

/// Menu latéral (drawer) de l'application Gmail.
///
/// Affiche le titre "Gmail" en rouge avec les catégories de navigation
/// et les liens de la boîte de réception fidèles au UI Gmail.
class GmailDrawer extends StatelessWidget {
  const GmailDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
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
            const Divider(height: 1, color: Colors.grey),
            _buildItem(Icons.all_inbox, 'Toutes les boîtes', bold: true),
            const Divider(height: 1, color: Colors.grey),
            _buildItem(Icons.star_border, 'Principal'),
            _buildItem(Icons.local_offer_outlined, 'Promotions'),
            _buildItem(Icons.people_outline, 'Réseaux sociaux'),
            _buildItem(Icons.notifications_none, 'Notifications'),
            _buildItem(Icons.forum_outlined, 'Forums'),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            _buildSectionTitle('Tous les libellés'),
            _buildItem(Icons.label_outline, 'Messages suivis'),
            _buildItem(Icons.inbox_outlined, 'En attente'),
            _buildItem(Icons.star_outline, 'Important'),
            _buildItem(Icons.send_outlined, 'Envoyés'),
            _buildItem(Icons.schedule_send_outlined, 'Envois programmés'),
            _buildItem(Icons.description_outlined, 'Brouillons'),
            _buildItem(Icons.mail_outline, 'Tous les messages'),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            _buildItem(Icons.report_outlined, 'Spam'),
            _buildItem(Icons.delete_outline, 'Corbeille'),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            _buildSectionTitle('Labels'),
            _buildItem(Icons.check_circle_outline, 'À valider'),
            _buildItem(Icons.payment, 'Paiement'),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            _buildItem(Icons.apps, 'Applications Google'),
            _buildItem(Icons.calendar_today_outlined, 'Agenda'),
            _buildItem(Icons.contacts_outlined, 'Contacts'),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            _buildItem(Icons.settings_outlined, 'Paramètres'),
            _buildItem(Icons.help_outline, 'Aide et commentaires'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  static Widget _buildItem(IconData icon, String label, {bool bold = false}) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Icon(icon, color: Colors.black87, size: 22),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
          color: Colors.black87,
        ),
      ),
    );
  }

  static Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
