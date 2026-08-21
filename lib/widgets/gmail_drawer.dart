import 'package:flutter/material.dart';
import '../pages/main_screen.dart';
import '../pages/label_screen.dart';
import '../pages/profile_screen.dart';

class GmailDrawer extends StatelessWidget {
  const GmailDrawer({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => screen));
  }

  void _navigateToLabel(BuildContext context, String label, IconData icon) {
    _navigateTo(context, LabelScreen(label: label, icon: icon));
  }

  void _navigateToHome(BuildContext context) {
    Navigator.of(context).pop();
  }

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
            _DrawerItem(
              icon: Icons.all_inbox,
              label: 'Toutes les boîtes',
              onTap: () => _navigateToHome(context),
            ),
            const Divider(height: 1, color: Colors.grey),
            _DrawerItem(
              icon: Icons.star_border,
              label: 'Principal',
              count: '55',
              onTap: () => _navigateToLabel(context, 'Principal', Icons.star_border),
            ),
            _DrawerItem(
              icon: Icons.local_offer_outlined,
              label: 'Promotions',
              count: '4nouv',
              onTap: () => _navigateToLabel(context, 'Promotions', Icons.local_offer_outlined),
            ),
            _DrawerItem(
              icon: Icons.people_outline,
              label: 'Réseaux sociaux',
              onTap: () => _navigateToLabel(context, 'Réseaux sociaux', Icons.people_outline),
            ),
            _DrawerItem(
              icon: Icons.notifications_none,
              label: 'Notifications',
              onTap: () => _navigateToLabel(context, 'Notifications', Icons.notifications_none),
            ),
            _DrawerItem(
              icon: Icons.forum_outlined,
              label: 'Forums',
              onTap: () => _navigateToLabel(context, 'Forums', Icons.forum_outlined),
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
            _DrawerItem(
              icon: Icons.star_outline,
              label: 'Messages suivis',
              count: '1',
              onTap: () => _navigateToLabel(context, 'Messages suivis', Icons.star_outline),
            ),
            _DrawerItem(
              icon: Icons.inbox_outlined,
              label: 'En attente',
              onTap: () => _navigateToLabel(context, 'En attente', Icons.inbox_outlined),
            ),
            _DrawerItem(
              icon: Icons.label_important_outline,
              label: 'Important',
              count: '62',
              onTap: () => _navigateToLabel(context, 'Important', Icons.label_important_outline),
            ),
            _DrawerItem(
              icon: Icons.shopping_bag_outlined,
              label: 'Achats',
              count: '45',
              onTap: () => _navigateToLabel(context, 'Achats', Icons.shopping_bag_outlined),
            ),
            _DrawerItem(
              icon: Icons.flight_takeoff,
              label: 'Déplacement',
              onTap: () => _navigateToLabel(context, 'Déplacement', Icons.flight_takeoff),
            ),
            _DrawerItem(
              icon: Icons.send_outlined,
              label: 'Envoyés',
              onTap: () => _navigateToLabel(context, 'Envoyés', Icons.send_outlined),
            ),
            _DrawerItem(
              icon: Icons.schedule_send_outlined,
              label: 'Planifié',
              onTap: () => _navigateToLabel(context, 'Planifié', Icons.schedule_send_outlined),
            ),
            _DrawerItem(
              icon: Icons.outgoing_mail,
              label: 'Boîte d\'envoi',
              onTap: () => _navigateToLabel(context, 'Boîte d\'envoi', Icons.outgoing_mail),
            ),
            _DrawerItem(
              icon: Icons.description_outlined,
              label: 'Brouillons',
              count: '1',
              onTap: () => _navigateToLabel(context, 'Brouillons', Icons.description_outlined),
            ),
            _DrawerItem(
              icon: Icons.mail_outline,
              label: 'Tous les messages',
              count: '642',
              onTap: () => _navigateToHome(context),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            _DrawerItem(
              icon: Icons.report_outlined,
              label: 'Spam',
              count: '4',
              onTap: () => _navigateToLabel(context, 'Spam', Icons.report_outlined),
            ),
            _DrawerItem(
              icon: Icons.delete_outline,
              label: 'Corbeille',
              onTap: () => _navigateToLabel(context, 'Corbeille', Icons.delete_outline),
            ),
            _DrawerItem(
              icon: Icons.mark_email_read_outlined,
              label: 'Gérer les abonnements',
              onTap: () => _navigateToLabel(context, 'Gérer les abonnements', Icons.mark_email_read_outlined),
            ),
            _DrawerItem(
              icon: Icons.add,
              label: 'Créer un libellé',
              onTap: () => _navigateToLabel(context, 'Créer un libellé', Icons.add),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            _DrawerItem(
              icon: Icons.apps,
              label: 'Applications Google',
              onTap: () => _navigateToLabel(context, 'Applications Google', Icons.apps),
            ),
            _DrawerItem(
              icon: Icons.calendar_today_outlined,
              label: 'Agenda',
              onTap: () => _navigateToLabel(context, 'Agenda', Icons.calendar_today_outlined),
            ),
            _DrawerItem(
              icon: Icons.contacts_outlined,
              label: 'Contacts',
              onTap: () => _navigateToLabel(context, 'Contacts', Icons.contacts_outlined),
            ),
            const SizedBox(height: 8),
            const Divider(height: 1, color: Colors.grey),
            _DrawerItem(
              icon: Icons.settings_outlined,
              label: 'Paramètres',
              onTap: () => _navigateTo(context, const ProfileScreen()),
            ),
            _DrawerItem(
              icon: Icons.help_outline,
              label: 'Aide et commentaires',
              onTap: () => _navigateToLabel(context, 'Aide et commentaires', Icons.help_outline),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.count,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? count;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Icon(icon, color: Colors.black87, size: 22),
      title: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (count != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                count!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
