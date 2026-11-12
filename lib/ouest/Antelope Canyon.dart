import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData antelopeCanyonData = DestinationData(
  id: 'antelope-canyon',
  name: 'Antelope Canyon',
  emoji: '🏜️',
  accent: const Color(0xFFFF8A4C),
  cover: 'assets/images/57.webp',
  gallery: const [
    'assets/images/51.jpg',
    'assets/images/52.jpg',
    'assets/images/54.webp',
    'assets/images/55.jpg',
    'assets/images/56.jpg',
  ],
  didYouKnow:
  "La beauté fascinante d'Antelope Canyon trouve un écho spectaculaire dans les Gorges du Siq de Pétra, en Jordanie 🇯🇴.",
  intro:
  "Chef-d'œuvre sculpté par l'eau et le vent, Antelope Canyon est un site sacré situé sur les terres Navajo. Ses parois aux formes ondulantes et aux couleurs changeantes offrent l'un des spectacles naturels les plus photographiés au monde.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Novembre à février (basse saison)'),
    QuickFact('🎟️', 'Réservation', 'Plusieurs semaines à l’avance'),
    QuickFact('🕒', 'Durée de visite', '1h15 à 2h selon le canyon'),
  ],
  sections: const [
    InfoSection('🕒', 'Horaires et Durées des visites', [
      'Upper Antelope Canyon : 8h-18h (avril-sept), 9h-16h (oct-mars). Durée : 1h30 à 2h.',
      'Lower Antelope Canyon : 7h45-16h15. Durée : 1h15.',
      'Canyon X et autres : Départs entre 7h30 et 8h. Durée : environ 2h.',
      'Secret Antelope Canyon : Durée environ 3h30 (incluant Horseshoe Bend).',
      'Pour plusieurs canyons dans la même journée : prévoyez 6 à 8 heures.',
    ]),
    InfoSection('🌅', 'Horaires recommandés (Lumière & Calme)', [
      '📸 Pour les faisceaux de lumière : Mars à octobre, entre 10h et 13h (zénith solaire).',
      '🌅 Lever / Coucher du soleil : Idéal pour des teintes douces et une atmosphère magique.',
      '👥 Évitement : Privilégiez les visites tôt le matin ou en fin d\'après-midi.',
    ]),
    InfoSection('🗓️', 'Saisons : Recommandations', [
      '✅ Saison recommandée : La basse saison (novembre à février) pour éviter la foule.',
      '❌ Période à éviter : Haute saison (mai à septembre) avec des chaleurs jusqu\'à 37°C.',
    ]),
    InfoSection('🎒', 'Conseils Pratiques & Règlements', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '👣 Visite guidée : Obligatoire avec un guide Navajo agréé.',
      '🎟️ Réservation : Indispensable plusieurs semaines à l\'avance.',
      '⏰ Arrivée : 45 min avant votre créneau pour le briefing.',
      '👕 Équipement : Chaussures fermées, protection solaire/sable.',
      '⚠️ Restrictions : Sacs, trépieds et perches à selfie interdits.',
    ]),
  ],
  warning:
  "Attention : les horaires et les tarifs peuvent changer au cours de l'année. Vérifiez les mises à jour avant de réserver.",
  note:
  "Note : Antelope Canyon est un site protégé et sacré. Merci de respecter les consignes de vos guides Navajo.",
);

class AntelopeCanyonPage extends StatelessWidget {
  final String title;
  const AntelopeCanyonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: antelopeCanyonData, title: title);
}