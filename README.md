# Challenge UI Flutter — Gmail

## Équipe 5 — Gmail

### Membres
1. Koffi Lévis Akalete
2. KITIO FRANCK ADOVILLE
3. Tonety Guelahibi Esli Ruben

## Application reproduite
Gmail (Android)

## Technologies
- Flutter
- Dart
- Material 3

## Fonctionnalités UI
- Splash screen avec logo Gmail et animation de fondu
- Barre de recherche avec icône de menu hamburger et avatar
- Onglets catégories (Principale, Promotions, Réseaux sociaux, Notifications)
- Liste des mails avec avatar, nom, sujet, aperçu, date et étoile
- Écran de lecture d'un mail (sujet, contenu, boutons Répondre/Transférer)
- Menu latéral (drawer) avec tous les libellés Gmail
- Navigation entre tous les écrans du drawer
- Barre de navigation inférieure (Mail + Meet)
- Écran Meet (Rejoindre une réunion)
- Écran Profil / Paramètres
- Bouton "Nouveau message" (FAB)
- Données fictives (pas de backend)

## Widgets principaux
- `Scaffold` — Structure de base des écrans
- `AppBar` — Barre d'application avec recherche
- `Drawer` — Menu latéral
- `NavigationBar` — Barre de navigation inférieure
- `ListView` / `ListView.separated` — Listes de mails et de libellés
- `FloatingActionButton` — Bouton "Nouveau message"
- `CircleAvatar` — Avatars des expéditeurs
- `Card` / `InkWell` — Éléments cliquables
- `PageRouteBuilder` — Transitions de navigation
- `FadeTransition` — Animation du splash screen

## Organisation du code
```
lib/
├── main.dart                    # Point d'entrée
├── pages/
│   ├── splash_screen.dart       # Écran de démarrage
│   ├── main_screen.dart         # Écran principal avec bottom nav
│   ├── mail_detail_screen.dart  # Lecture d'un mail
│   ├── label_screen.dart        # Page pour chaque libellé du drawer
│   ├── profile_screen.dart      # Profil / Paramètres
│   └── compose_screen.dart      # Composition d'un mail
├── models/
│   └── mail.dart                # Modèle de données Mail
└── widgets/
    ├── gmail_drawer.dart        # Menu latéral complet
    └── mail_card.dart           # Carte d'un mail dans la liste
```

## Difficultés rencontrées
- Le build Gradle prenait beaucoup de temps (timeout après 10 minutes)
- L'analyse OCR des images de référence pour reproduire fidèlement le UI
- La navigation complexe entre le drawer et tous les écrans
- La conformité exacte du layout Gmail (position de l'avatar, onglets, bottom bar)

## Solutions apportées
- Utilisation de `flutter clean` et `flutter pub get` avant chaque build
- Utilisation de Tesseract OCR pour extraire le texte des images de référence
- Création d'un écran `LabelScreen` réutilisable pour chaque item du drawer
- Séparation de l'avatar hors de la barre de recherche conformément au design Gmail

## Tests
25 tests unitaires et d'intégration couvrant :
- `GmailApp` — MaterialApp, titre, debug banner
- `SplashScreen` — Texte, image, fond blanc
- `MainScreen` — Recherche, menu, onglets, FAB, bottom nav, navigation Meet
- `MailCard` — Affichage, navigation vers MailDetailScreen
- `MailDetailScreen` — Contenu, boutons, retour
- `GmailDrawer` — Couleur Gmail, dividers, fond blanc, items principaux
