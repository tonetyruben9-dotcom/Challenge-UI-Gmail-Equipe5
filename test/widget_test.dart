import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gmail/main.dart';
import 'package:gmail/models/mail.dart';
import 'package:gmail/pages/splash_screen.dart';
import 'package:gmail/pages/main_screen.dart';
import 'package:gmail/pages/mail_detail_screen.dart';
import 'package:gmail/widgets/gmail_drawer.dart';
import 'package:gmail/widgets/mail_card.dart';

void main() {
  group('GmailApp', () {
    testWidgets('should render MaterialApp', (WidgetTester tester) async {
      await tester.pumpWidget(const GmailApp());
      expect(find.byType(MaterialApp), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('should have debugShowCheckedModeBanner set to false', (WidgetTester tester) async {
      await tester.pumpWidget(const GmailApp());
      final MaterialApp app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.debugShowCheckedModeBanner, false);
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('should have app title set to Gmail', (WidgetTester tester) async {
      await tester.pumpWidget(const GmailApp());
      final MaterialApp app = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app.title, 'Gmail');
      await tester.pump(const Duration(seconds: 5));
    });
  });

  group('SplashScreen', () {
    testWidgets('should display Google Workspace text', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
      await tester.pump();
      expect(find.text('Google Workspace'), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('should display an image', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
      await tester.pump();
      expect(find.byType(Image), findsOneWidget);
      await tester.pump(const Duration(seconds: 5));
    });

    testWidgets('should have white background', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SplashScreen()));
      await tester.pump();
      final Scaffold scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.white);
      await tester.pump(const Duration(seconds: 5));
    });
  });

  group('MainScreen', () {
    testWidgets('should display search bar text', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      expect(find.text('Rechercher dans les messages'), findsWidgets);
    });

    testWidgets('should have a hamburger menu button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should open drawer when menu button is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      expect(find.text('Gmail'), findsOneWidget);
    });

    testWidgets('should have a drawer', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      final Scaffold scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.drawer, isNotNull);
    });

    testWidgets('should display category tabs', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      expect(find.text('Principale'), findsOneWidget);
      expect(find.text('Promotions'), findsOneWidget);
      expect(find.text('Réseaux sociaux'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
    });

    testWidgets('should display the inbox mail list', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));

      expect(find.byType(MailCard), findsWidgets);
      expect(find.text('LinkedIn'), findsOneWidget);
      expect(find.text('170 personnes ont consulté votre profil'), findsOneWidget);
    });

    testWidgets('should display Nouveau message FAB', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      expect(find.text('Nouveau message'), findsOneWidget);
      expect(find.byIcon(Icons.edit), findsOneWidget);
    });

    testWidgets('should have bottom navigation with Mail and Meet', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      expect(find.text('Mail'), findsOneWidget);
      expect(find.text('Meet'), findsOneWidget);
    });

    testWidgets('should switch to Meet screen on Meet tab tap', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      await tester.tap(find.text('Meet'));
      await tester.pumpAndSettle();
      expect(find.text('Obtenir un lien de réunion à partager'), findsOneWidget);
      expect(find.text('Démarrer une réunion instantanée'), findsOneWidget);
      expect(find.text('Planifier dans Google Agenda'), findsOneWidget);
    });

    testWidgets('should hide FAB on Meet screen', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MainScreen()));
      await tester.tap(find.text('Meet'));
      await tester.pumpAndSettle();
      expect(find.text('Nouveau message'), findsNothing);
    });
  });

  group('MailCard', () {
    testWidgets('should display sender initials and mail details', (WidgetTester tester) async {
      const mail = Mail(
        sender: 'Jean Martin',
        subject: 'Objet du message',
        preview: 'Extrait du message',
        date: 'Aujourd\'hui',
        avatarColor: Colors.blue,
      );

      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: MailCard(mail: mail))));

      expect(find.text('JM'), findsOneWidget);
      expect(find.text('Jean Martin'), findsOneWidget);
      expect(find.text('Objet du message'), findsOneWidget);
      expect(find.text('Extrait du message'), findsOneWidget);
      expect(find.text('Aujourd\'hui'), findsOneWidget);
    });

    testWidgets('should navigate to MailDetailScreen on tap', (WidgetTester tester) async {
      const mail = Mail(
        sender: 'Test User',
        subject: 'Test Subject',
        preview: 'Test preview',
        date: 'Today',
        avatarColor: Colors.blue,
        body: 'Full body content',
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: MailCard(mail: mail)),
      ));

      await tester.tap(find.byType(MailCard));
      await tester.pumpAndSettle();

      expect(find.byType(MailDetailScreen), findsOneWidget);
      expect(find.text('Test Subject'), findsOneWidget);
      expect(find.text('Full body content'), findsOneWidget);
    });
  });

  group('MailDetailScreen', () {
    testWidgets('should display mail subject and body', (WidgetTester tester) async {
      const mail = Mail(
        sender: 'Test Sender',
        subject: 'Test Subject',
        preview: 'Preview text',
        date: '20 août',
        avatarColor: Colors.red,
        body: 'This is the full body of the email.',
      );

      await tester.pumpWidget(MaterialApp(
        home: MailDetailScreen(mail: mail),
      ));

      expect(find.text('Test Subject'), findsOneWidget);
      expect(find.text('This is the full body of the email.'), findsOneWidget);
      expect(find.text('Test Sender'), findsOneWidget);
    });

    testWidgets('should display reply and forward buttons', (WidgetTester tester) async {
      const mail = Mail(
        sender: 'Sender',
        subject: 'Subject',
        preview: 'Preview',
        date: '20 août',
        avatarColor: Colors.blue,
      );

      await tester.pumpWidget(MaterialApp(
        home: MailDetailScreen(mail: mail),
      ));

      expect(find.text('Répondre'), findsOneWidget);
      expect(find.text('Transférer'), findsOneWidget);
    });

    testWidgets('should navigate back on back button tap', (WidgetTester tester) async {
      const mail = Mail(
        sender: 'Sender',
        subject: 'Subject',
        preview: 'Preview',
        date: '20 août',
        avatarColor: Colors.blue,
      );

      await tester.pumpWidget(MaterialApp(
        home: MailDetailScreen(mail: mail),
      ));

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.byType(MailDetailScreen), findsNothing);
    });
  });

  group('GmailDrawer', () {
    testWidgets('should display Gmail text in red', (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(key: scaffoldKey, drawer: const GmailDrawer()),
      ));
      scaffoldKey.currentState!.openDrawer();
      await tester.pumpAndSettle();

      final Text gmailText = tester.widget<Text>(find.text('Gmail'));
      expect(gmailText.style?.color, const Color(0xFFEA4335));
    });

    testWidgets('should display a divider below Gmail text', (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(key: scaffoldKey, drawer: const GmailDrawer()),
      ));
      scaffoldKey.currentState!.openDrawer();
      await tester.pumpAndSettle();

      expect(find.byType(Divider), findsWidgets);
    });

    testWidgets('should have white background', (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(key: scaffoldKey, drawer: const GmailDrawer()),
      ));
      scaffoldKey.currentState!.openDrawer();
      await tester.pumpAndSettle();

      final Drawer drawer = tester.widget<Drawer>(find.byType(Drawer));
      expect(drawer.backgroundColor, Colors.white);
    });

    testWidgets('should display all main menu items', (WidgetTester tester) async {
      final scaffoldKey = GlobalKey<ScaffoldState>();
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(key: scaffoldKey, drawer: const GmailDrawer()),
      ));
      scaffoldKey.currentState!.openDrawer();
      await tester.pumpAndSettle();

      expect(find.text('Toutes les boîtes'), findsOneWidget);
      expect(find.text('Principal'), findsOneWidget);
      expect(find.text('Promotions'), findsOneWidget);
      expect(find.text('Réseaux sociaux'), findsOneWidget);
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Forums'), findsOneWidget);
      expect(find.text('Tous les libellés'), findsOneWidget);
    });
  });
}
