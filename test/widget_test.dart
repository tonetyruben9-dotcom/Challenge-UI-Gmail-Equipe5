import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gmail/main.dart';
import 'package:gmail/models/mail.dart';
import 'package:gmail/pages/splash_screen.dart';
import 'package:gmail/pages/home_screen.dart';
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

  group('HomeScreen', () {
    testWidgets('should display Boîte de réception text', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      expect(find.text('Boîte de réception'), findsOneWidget);
    });

    testWidgets('should have a hamburger menu button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('should open drawer when menu button is tapped', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      expect(find.text('Gmail'), findsOneWidget);
    });

    testWidgets('should have a drawer', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
      final Scaffold scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.drawer, isNotNull);
    });

    testWidgets('should display the inbox mail list', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      expect(find.byType(MailCard), findsNWidgets(4));
      expect(find.text('ruben tonety'), findsOneWidget);
      expect(find.text('Réunion de projet demain'), findsOneWidget);
      expect(find.text('Bonjour, voici les derniers éléments à préparer.'), findsOneWidget);
      expect(find.text('17 août'), findsOneWidget);
    });
  });

  group('MailCard', () {
    testWidgets('should display sender initials and mail details', (WidgetTester tester) async {
      const mail = Mail(
        sender: 'Jean Martin',
        subject: 'Objet du message',
        preview: 'Extrait du message',
        date: 'Aujourd’hui',
        avatarColor: Colors.blue,
      );

      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: MailCard(mail: mail))));

      expect(find.text('JM'), findsOneWidget);
      expect(find.text('Jean Martin'), findsOneWidget);
      expect(find.text('Objet du message'), findsOneWidget);
      expect(find.text('Extrait du message'), findsOneWidget);
      expect(find.text('Aujourd’hui'), findsOneWidget);
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

      expect(find.byType(Divider), findsOneWidget);
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
  });
}
