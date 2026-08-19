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
            const Divider(height: 1, color: Colors.grey),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.all_inbox, color: Colors.black87, size: 22),
              title: const Text(
                'Toutes les boîtes',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
              ),
            ),
            const Divider(height: 1, color: Colors.grey),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.star_border, color: Colors.black87, size: 22),
              title: const Text(
                'Principal',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.local_offer_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Promotions',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.people_outline, color: Colors.black87, size: 22),
              title: const Text(
                'Réseaux sociaux',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.notifications_none, color: Colors.black87, size: 22),
              title: const Text(
                'Notifications',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.forum_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Forums',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Text(
                'Tous les libellés',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.star_outline, color: Colors.black87, size: 22),
              title: const Text(
                'Messages suivis',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.inbox_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'En attente',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.label_important_outline, color: Colors.black87, size: 22),
              title: const Text(
                'Important',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.shopping_bag_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Achats',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.send_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Envoyés',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.schedule_send_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Planifiés',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.outgoing_mail, color: Colors.black87, size: 22),
              title: const Text(
                'Boîte d\'envoi',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.description_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Brouillons',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.mail_outline, color: Colors.black87, size: 22),
              title: const Text(
                'Tous les messages',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.report_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Spam',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.delete_outline, color: Colors.black87, size: 22),
              title: const Text(
                'Corbeille',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.mark_email_read_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Gérer les abonnements',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.add, color: Colors.black87, size: 22),
              title: const Text(
                'Créer un libellé',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.apps, color: Colors.black87, size: 22),
              title: const Text(
                'Applications Google',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.calendar_today_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Agenda',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            ListTile(
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: const Icon(Icons.contacts_outlined, color: Colors.black87, size: 22),
              title: const Text(
                'Contacts',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
