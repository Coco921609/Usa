import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData pageAndPowellData = DestinationData(
  id: 'page-lac-powell',
  name: 'Page et le Lac Powell, Arizona',
  emoji: '📍',
  accent: const Color(0xFF35B8E0),
  cover: 'assets/images/99.jpg',
  gallery: const [
    'assets/images/96.jpg',
    'assets/images/97.jpg',
    'assets/images/100.jpg',
    'assets/images/101.webp',
  ],
  didYouKnow:
  "L'immensité bleue du lac Powell trouve un écho historique sur les rives du Lac Nasser, en Égypte 🇪🇬.",
  intro:
  "Située au nord de l’Arizona, la ville de Page est une étape clé lors d’un road trip. Réputée pour ses paysages grandioses, elle abrite des merveilles comme Antelope Canyon, le lac Powell et le célèbre Horseshoe Bend.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Printemps et automne'),
    QuickFact('🌅', 'Moment idéal', 'Lever ou coucher du soleil à Horseshoe Bend'),
    QuickFact('🎟️', 'Réservation', 'Plusieurs mois à l’avance'),
  ],
  sections: const [
    InfoSection('🌅', 'Horaires recommandés (Lumière & Calme)', [
      '🌅 Lever / Coucher du soleil : Idéal à Horseshoe Bend pour des contrastes spectaculaires entre le fleuve et les parois rocheuses.',
      '👥 Évitement : Visitez les points de vue tôt le matin ou après 17h pour éviter la foule des tours organisés.',
    ]),
    InfoSection('🗓️', 'Saisons et Conseils', [
      '✅ Saison recommandée : Printemps et automne pour des températures agréables sur le lac.',
      '❌ Période à éviter : Mi-été pour la chaleur écrasante qui limite les activités en extérieur.',
    ]),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '🛶 Activités : Louez un kayak pour découvrir les canyons étroits du lac Powell.',
      '🎟️ Réservations : Réservez vos visites (Antelope Canyon surtout) plusieurs mois à l\'avance.',
    ]),
  ],
  warning:
  "Attention : les prix, les frais d'accès et les conditions météorologiques peuvent changer. Vérifiez les mises à jour avant votre départ.",
);

class PageAndPowellPage extends StatelessWidget {
  final String title;
  const PageAndPowellPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: pageAndPowellData, title: title);
}