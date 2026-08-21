import 'package:flutter/material.dart';
import '../models/mail.dart';
import '../widgets/gmail_drawer.dart';
import '../widgets/mail_card.dart';
import 'mail_detail_screen.dart';
import 'compose_screen.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const _mails = [
    Mail(
      sender: 'LinkedIn',
      subject: '170 personnes ont consulté votre profil',
      preview: 'Découvrez qui a consulté votre profil cette semaine.',
      date: '20 août',
      avatarColor: Color(0xFF0077B5),
      body: 'Bonjour Koffi Levis,\n\n'
          '170 personnes ont consulté votre profil LinkedIn cette semaine. '
          'Découvrez qui a manifesté de l\'intérêt pour votre profil et '
          'connectez-vous avec de nouvelles opportunités.\n\nL\'équipe LinkedIn',
    ),
    Mail(
      sender: 'Vercel 5',
      subject: 'Failed production deployment on team',
      preview: 'Hello, akaletekoffilevis. There was an error during deployment.',
      date: '20 août',
      avatarColor: Color(0xFF000000),
      isRead: true,
      body: 'Hello, akaletekoffilevis.\n\n'
          'There was an error during the production deployment on your team '
          'project. The build failed with the following error:\n\n'
          'Module not found: Can\'t resolve \'./components/Header\'\n\n'
          'Please check your imports and try again.\n\nBest,\nThe Vercel Team',
    ),
    Mail(
      sender: 'E-learning SIG Niger',
      subject: 'Votre progression — E-learning SIG',
      preview: 'Bonjour Koffi Levis AKALETE, Module...',
      date: '20 août',
      avatarColor: Color(0xFFEA4335),
      body: 'Bonjour Koffi Levis AKALETE,\n\n'
          'Voici le résumé de votre progression dans la plateforme '
          'E-learning SIG Niger :\n\n'
          '- Modules complétés : 4/6\n'
          '- Progression : 60%\n\n'
          'Commencez dès maintenant votre premier module.\n\n'
          'L\'équipe E-learning SIG Niger',
    ),
    Mail(
      sender: 'ANVD - Bienvenue',
      subject: 'Bienvenue sur la plateforme ANVD !',
      preview: 'Bienvenue sur ANVD ! Bonjour AKALE...',
      date: '20 août',
      avatarColor: Color(0xFF0B57D0),
      isRead: true,
      body: 'Bienvenue sur ANVD !\n\n'
          'Bonjour AKALETE Koffi Levis,\n\n'
          'Nous sommes ravis de vous accueillir sur la plateforme '
          'ANVD (Agence Nigérienne de la Véhicule et du Digital).\n\n'
          'Commencez à explorer les fonctionnalités disponibles.\n\n'
          'L\'équipe ANVD',
    ),
    Mail(
      sender: 'ANVD - Vérification Email',
      subject: 'Code de vérification - Inscription',
      preview: 'Code de vérification - Inscription...',
      date: '20 août',
      avatarColor: Color(0xFF0B57D0),
      isRead: true,
      body: 'Code de vérification\n\n'
          'Bonjour,\n\n'
          'Votre code de vérification pour l\'inscription ANVD est : 482957\n\n'
          'Ce code expire dans 10 minutes.\n\n'
          'ANVD Niger - Agence Nigérienne de la Véhicule et du Digital',
    ),
    Mail(
      sender: 'Canva',
      subject: 'De nouvelles idées pour vos créations',
      preview: 'Explorez nos modèles et donnez vie à vos idées.',
      date: '19 août',
      avatarColor: Color(0xFF34A853),
      isRead: true,
      body: 'Découvrez nos nouveaux modèles de design pour vos projets. '
          'Créez des présentations, affiches et bien plus encore avec '
          'nos outils intuitifs.\n\nL\'équipe Canva',
    ),
    Mail(
      sender: 'Thomas Martin',
      subject: 'Re: Présentation commerciale',
      preview: 'La version finale est prête pour relecture.',
      date: '18 août',
      avatarColor: Color(0xFFFBBC04),
      body: 'Bonjour,\n\nLa version finale de la présentation commerciale '
          'est prête pour relecture. Vous trouverez le document en pièce '
          'jointe.\n\nMerci de me faire un retour d\'ici vendredi.\n\n'
          'Cordialement,\nThomas Martin',
    ),
    Mail(
      sender: 'Google Cloud',
      subject: 'Votre facture mensuelle',
      preview: 'Votre facture du mois d\'août est disponible.',
      date: '17 août',
      avatarColor: Color(0xFF4285F4),
      isRead: true,
      body: 'Bonjour,\n\nVotre facture mensuelle Google Cloud est disponible. '
          'Montant total : 12,50 €.\n\nConsultez les détails dans votre '
          'compte Google Cloud.\n\nL\'équipe Google Cloud',
    ),
    Mail(
      sender: 'ruben tonety',
      subject: 'Réunion de projet demain',
      preview: 'Bonjour, voici les derniers éléments à préparer.',
      date: '17 août',
      avatarColor: Color(0xFF4285F4),
      body: 'Bonjour à tous,\n\nN\'oubliez pas la réunion de projet demain '
          'à 10h. Voici les points à préparer :\n\n'
          '- Revoir les maquettes UI\n'
          '- Préparer la démo du sidebar\n'
          '- Vérifier les tests unitaires\n\n'
          'Cordialement,\nRuben',
    ),
  ];

  Widget _buildMailScreen() {
    return Column(
      children: [
        SizedBox(
          height: 44,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: const [
              _CategoryChip(label: 'Principale', selected: true),
              _CategoryChip(label: 'Promotions', selected: false),
              _CategoryChip(label: 'Réseaux sociaux', selected: false),
              _CategoryChip(label: 'Notifications', selected: false),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView.separated(
            itemCount: _mails.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 1, indent: 72),
            itemBuilder: (context, index) => MailCard(mail: _mails[index]),
          ),
        ),
      ],
    );
  }

  Widget _buildMeetScreen() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        _MeetOption(
          icon: Icons.link,
          title: 'Obtenir un lien de réunion à partager',
          onTap: () {},
        ),
        _MeetOption(
          icon: Icons.videocam,
          title: 'Démarrer une réunion instantanée',
          onTap: () {},
        ),
        _MeetOption(
          icon: Icons.calendar_today_outlined,
          title: 'Planifier dans Google Agenda',
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMailScreen = _selectedIndex == 0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black54),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F4),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Icon(Icons.search, color: Colors.grey.shade500, size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Rechercher dans les messages',
                      style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFF4285F4),
                child: Text(
                  'A',
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: const GmailDrawer(),
      body: isMailScreen ? _buildMailScreen() : _buildMeetScreen(),
      floatingActionButton: isMailScreen
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ComposeScreen()),
                );
              },
              backgroundColor: const Color(0xFFC2E7FF),
              elevation: 2,
              icon: const Icon(Icons.edit, color: Colors.black87, size: 22),
              label: const Text('Nouveau message', style: TextStyle(color: Colors.black87, fontSize: 15)),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        backgroundColor: Colors.white,
        elevation: 8,
        height: 64,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.mail_outline, size: 24),
            selectedIcon: Icon(Icons.mail, size: 24),
            label: 'Mail',
          ),
          NavigationDestination(
            icon: Icon(Icons.videocam_outlined, size: 24),
            selectedIcon: Icon(Icons.videocam, size: 24),
            label: 'Meet',
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFD3E3FD) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            color: selected ? const Color(0xFF001D35) : Colors.black54,
          ),
        ),
      ),
    );
  }
}

class _MeetOption extends StatelessWidget {
  const _MeetOption({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87, size: 24),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, color: Colors.black87),
      ),
      onTap: onTap,
    );
  }
}
