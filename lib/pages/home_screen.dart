import 'package:flutter/material.dart';
import '../models/mail.dart';
import '../widgets/gmail_drawer.dart';
import '../widgets/mail_card.dart';

/// Écran principal de l'application Gmail.
///
/// Contient la barre d'application avec le bouton hamburger
/// et le [GmailDrawer] accessible depuis la barre latérale.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const mails = [
    Mail(
      sender: 'Équipe Gmail',
      subject: 'Bienvenue dans votre boîte de réception',
      preview: 'Découvrez les nouvelles fonctionnalités de Gmail.',
      date: '18 août',
      avatarColor: Color(0xFFEA4335),
    ),
    Mail(
      sender: 'ruben tonety',
      subject: 'Réunion de projet demain',
      preview: 'Bonjour, voici les derniers éléments à préparer.',
      date: '17 août',
      avatarColor: Color(0xFF4285F4),
    ),
    Mail(
      sender: 'Canva',
      subject: 'De nouvelles idées pour vos créations',
      preview: 'Explorez nos modèles et donnez vie à vos idées.',
      date: '16 août',
      avatarColor: Color(0xFF34A853),
      isRead: true,
    ),
    Mail(
      sender: 'Thomas Martin',
      subject: 'Re: Présentation commerciale',
      preview: 'La version finale est prête pour relecture.',
      date: '15 août',
      avatarColor: Color(0xFFFBBC04),
    ),
  ];

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
        title: const Text(
          'Boîte de réception',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            tooltip: 'Rechercher dans les mails',
            icon: const Icon(Icons.search, color: Colors.black54),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Color(0xFF4285F4),
              child: Text('A', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      drawer: const GmailDrawer(),
      body: ListView.separated(
        itemCount: mails.length,
        separatorBuilder: (context, index) => const Divider(height: 1, indent: 72),
        itemBuilder: (context, index) => MailCard(mail: mails[index]),
      ),
    );
  }
}
