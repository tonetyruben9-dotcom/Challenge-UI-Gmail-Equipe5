import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gmail/pages/main_screen.dart';
import 'package:gmail/pages/compose_screen.dart';
import 'package:gmail/pages/mail_detail_screen.dart';
import 'package:gmail/pages/profile_screen.dart';
import 'package:gmail/pages/label_screen.dart';
import 'package:gmail/pages/search_screen.dart';
import 'package:gmail/models/mail.dart';

const _dir = '../screenshots';

const testMail = Mail(
  sender: 'LinkedIn',
  subject: '170 personnes ont consulté votre profil',
  preview: 'Découvrez qui a consulté votre profil cette semaine.',
  date: '20 août',
  avatarColor: Color(0xFF0077B5),
  body: 'Bonjour Koffi Levis,\n\n170 personnes ont consulté votre profil.',
);

void main() {
  testWidgets('inbox', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(home: const MainScreen()));
    await tester.pump();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('$_dir/01_inbox.png'));
  });

  testWidgets('drawer', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(home: const MainScreen()));
    await tester.pump();
    final state = tester.state<ScaffoldState>(find.byType(Scaffold).first);
    state.openDrawer();
    await tester.pumpAndSettle();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('$_dir/02_drawer.png'));
  });

  testWidgets('mail detail', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(home: const MailDetailScreen(mail: testMail)));
    await tester.pump();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('$_dir/03_mail_detail.png'));
  });

  testWidgets('compose', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(home: const ComposeScreen()));
    await tester.pump();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('$_dir/04_compose.png'));
  });

  testWidgets('search', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(home: const SearchScreen()));
    await tester.pump();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('$_dir/05_search.png'));
  });

  testWidgets('profile', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(home: const ProfileScreen()));
    await tester.pump();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('$_dir/06_profile.png'));
  });

  testWidgets('meet', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final main = MainScreen();
    await tester.pumpWidget(MaterialApp(home: main));
    await tester.pump();
    final meetTab = find.text('Meet');
    await tester.tap(meetTab);
    await tester.pump();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('$_dir/07_meet.png'));
  });

  testWidgets('label principale', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(MaterialApp(home: const LabelScreen(label: 'Principale', icon: Icons.inbox)));
    await tester.pump();
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('$_dir/08_label_principale.png'));
  });
}
