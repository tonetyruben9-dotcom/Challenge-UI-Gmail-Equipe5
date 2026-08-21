# Challenge UI - Équipe 5 - Gmail

## Membres
- Koffi Lévis Akalete 🇳🇪
- KITIO FRANCK ADOVILLE 🇨🇲
- Tonety Guelahibi Esli Ruben 🇨🇮

## Application reproduite
Gmail

## Technologies
- Flutter
- Dart

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
- Écran de recherche
- Bouton "Nouveau message" (FAB)
- Données fictives (pas de backend)

## Widgets principaux
- Column
- Row
- Stack
- ListView / ListView.separated
- Scaffold
- AppBar
- Drawer
- NavigationBar
- FloatingActionButton
- CircleAvatar
- Card / InkWell
- FadeTransition
- PageRouteBuilder

## Difficultés rencontrées
- Le build Gradle prenait beaucoup de temps (timeout après 10 minutes)
- La conformité exacte du layout Gmail (position de l'avatar, onglets, bottom bar)
- La navigation complexe entre le drawer et tous les écrans
- Analyse OCR des images de référence pour reproduire fidèlement le UI

## Solutions
- Utilisation de `flutter clean` et `flutter pub get` avant chaque build
- Création d'un écran `LabelScreen` réutilisable pour chaque item du drawer
- Séparation de l'avatar hors de la barre de recherche conformément au design Gmail
- Extraction du texte des images de référence pour la conformité

## Screenshots
![Inbox](screenshots/01_inbox.png)
![Drawer](screenshots/02_drawer.png)
![Mail Detail](screenshots/03_mail_detail.png)
![Compose](screenshots/04_compose.png)
![Search](screenshots/05_search.png)
![Profile](screenshots/06_profile.png)
![Meet](screenshots/07_meet.png)
![Label](screenshots/08_label_principale.png)

## Vidéo
À venir

## APK
`Gmail-Equipe5.apk` dans le dossier racine du projet
