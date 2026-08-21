import 'package:flutter/material.dart';
import '../models/mail.dart';
import '../widgets/gmail_drawer.dart';
import '../widgets/mail_card.dart';

/// Écran principal de l'application Gmail.
///
/// Affiche la barre de recherche, les onglets catégories,
/// la liste des mails et le bouton "Nouveau message".
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const mails = [
    Mail(
      sender: 'Équipe Gmail',
      subject: 'Bienvenue dans votre boîte de réception',
      preview: 'Découvrez les nouvelles fonctionnalités de Gmail.',
      date: '18 août',
      avatarColor: Color(0xFFEA4335),
      body:
          'Bonjour,\n\nBienvenue dans votre nouvelle boîte de réception Gmail. '
          'Découvrez toutes les nouvelles fonctionnalités disponibles pour '
          'vous aider à gérer vos emails plus efficacement.\n\nL\'équipe Gmail',
    ),
    Mail(
      sender: 'ruben tonety',
      subject: 'Réunion de projet demain',
      preview: 'Bonjour, voici les derniers éléments à préparer.',
      date: '17 août',
      avatarColor: Color(0xFF4285F4),
      body:
          'Bonjour à tous,\n\nN\'oubliez pas la réunion de projet demain '
          'à 10h. Voici les points à préparer :\n\n'
          '- Revoir les maquettes UI\n'
          '- Préparer la démo du sidebar\n'
          '- Vérifier les tests unitaires\n\n'
          'Cordialement,\nRuben',
    ),
    Mail(
      sender: 'Canva',
      subject: 'De nouvelles idées pour vos créations',
      preview: 'Explorez nos modèles et donnez vie à vos idées.',
      date: '16 août',
      avatarColor: Color(0xFF34A853),
      isRead: true,
      body:
          'Découvrez nos nouveaux modèles de design pour vos projets. '
          'Créez des présentations, affiches et bien plus encore avec '
          'nos outils intuitifs.',
    ),
    Mail(
      sender: 'Thomas Martin',
      subject: 'Re: Présentation commerciale',
      preview: 'La version finale est prête pour relecture.',
      date: '15 août',
      avatarColor: Color(0xFFFBBC04),
      body:
          'Bonjour,\n\nLa version finale de la présentation commerciale '
          'est prête pour relecture. Vous trouverez le document en pièce '
          'jointe.\n\nMerci de me faire un retour d\'ici vendredi.\n\n'
          'Cordialement,\nThomas Martin',
    ),
    Mail(
      sender: 'Google Cloud',
      subject: 'Votre facture mensuelle',
      preview: 'Votre facture du mois d\'août est disponible.',
      date: '14 août',
      avatarColor: Color(0xFF4285F4),
      isRead: true,
      body:
          'Bonjour,\n\nVotre facture mensuelle Google Cloud est disponible. '
          'Montant total : 12,50 €.\n\nConsultez les détails dans votre '
          'compte Google Cloud.\n\nL\'équipe Google Cloud',
    ),
    Mail(
      sender: 'LinkedIn',
      subject: 'Nouvelles opportunités pour vous',
      preview: 'Découvrez 5 nouvelles offres correspondant à votre profil.',
      date: '13 août',
      avatarColor: Color(0xFF0077B5),
      isRead: true,
      body:
          'Bonjour Akalete,\n\n5 nouvelles offres d\'emploi correspondent '
          'à votre profil et à vos préférences de recherche. '
          'Connectez-vous pour en savoir plus.\n\nL\'équipe LinkedIn',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
          title: Container(
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
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Color(0xFF4285F4),
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: const GmailDrawer(),
      body: Column(
        children: [
          Container(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
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
              itemCount: mails.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, index) => MailCard(mail: mails[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFFC2E7FF),
        elevation: 2,
        icon: const Icon(Icons.edit, color: Colors.black87, size: 22),
        label: const Text(
          'Nouveau message',
          style: TextStyle(color: Colors.black87, fontSize: 15),
        ),
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
