import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData monoLakeData = DestinationData(
  id: 'lac-mono',
  name: 'Lac Mono, Californie',
  emoji: '🌊',
  accent: const Color(0xFF4FC3F7),
  cover: 'assets/images/94.webp',
  gallery: const [
    'assets/images/93.jpg',
    'assets/images/91.webp',
    'assets/images/90.webp',
  ],
  didYouKnow:
  "Les formations étranges du lac Mono trouvent un écho fascinant dans les Cheminées du Lac Abhé, à Djibouti 🇩🇯.",
  intro:
  "Le lac Mono est un lac salé ancien et fascinant, niché au pied de la Sierra Nevada. Célèbre pour ses colonnes de tuf calcaire spectaculaires et son écosystème unique, il offre un paysage presque extraterrestre.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Printemps et automne'),
    QuickFact('🌅', 'Moment idéal', 'Lever ou coucher du soleil'),
    QuickFact('🧢', 'Protection', 'Chapeau et protection solaire'),
  ],
  sections: const [
    InfoSection('🌅', 'Horaires recommandés (Lumière & Calme)', [
      '🌅 Lever / Coucher du soleil : Moment immanquable pour voir les tours de tuf se détacher magnifiquement sur le ciel.',
      '👥 Évitement : Privilégiez les matinées en semaine pour éviter les foules de touristes de passage.',
    ]),
    InfoSection('🗓️', 'Saisons et Conseils', [
      '✅ Saison recommandée : Printemps et automne pour des températures clémentes et une lumière sublime.',
      '❌ Période à éviter : Mi-été (forte chaleur et insectes) et hiver (accès parfois difficile selon la neige).',
    ]),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '🥾 Marche : Prévoyez de bonnes chaussures pour marcher sur les sentiers sableux autour des formations.',
      '⚠️ Protection : Prévoyez un chapeau et une protection solaire, l\'ombre est rare sur les rives du lac.',
    ]),
  ],
  warning:
  "Attention : les prix et les conditions d'accès aux zones protégées peuvent changer. Vérifiez les dernières mises à jour locales.",
);

class MonoLakePage extends StatelessWidget {
  final String title;
  const MonoLakePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: monoLakeData, title: title);
}