import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData canyonlandsData = DestinationData(
  id: 'canyonlands',
  name: 'Parc National de Canyonlands',
  emoji: '🏜️',
  accent: const Color(0xFFE9A04B),
  cover: 'assets/images/61.webp',
  gallery: const [
    'assets/images/59.jpg',
    'assets/images/60.webp',
    'assets/images/61.webp',
    'assets/images/62.webp',
    'assets/images/63.jpg',
  ],
  didYouKnow:
  "Les formations rocheuses de Canyonlands trouvent un cousin fascinant du côté du massif des Bungle Bungle, en Australie 🇦🇺.",
  intro:
  "Canyonlands est une étendue sauvage de canyons, buttes et flèches sculptées par le fleuve Colorado et la rivière Green. Le parc est divisé en quatre districts distincts ; aucune route ne les relie. Chaque zone offre des opportunités uniques d’aventure.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Printemps et automne'),
    QuickFact('💰', 'Entrée', '35 dollars par véhicule (pass 7 jours)'),
    QuickFact('🕒', 'Horaires', '7h à 20h, centre d’accueil 9h à 17h'),
  ],
  sections: const [
    InfoSection('🗺️', 'Les Districts du Parc', [
      'Island in the Sky : La partie la plus visitée et accessible.',
      'The Maze : La zone la plus isolée, idéale pour une aventure hors des sentiers battus.',
      'The Needles : Le district idéal pour les passionnés de randonnée.',
    ]),
    InfoSection('🕒', 'Horaires et Fréquentation', [
      '🌅 Horaires recommandés : Privilégiez l\'aube et le crépuscule pour les lumières les plus spectaculaires.',
      '👥 Évitement : Visitez les sites majeurs en dehors des heures de forte chaleur et de forte affluence.',
      'Ouvert généralement de 7h à 20h. Centre d\'accueil : 9h à 17h.',
    ]),
    InfoSection('🗓️', 'Saisons et Conseils', [
      '✅ Saison recommandée : Printemps et automne pour des températures clémentes.',
      '❌ Période à éviter : Mi-été (chaleur extrême) et mi-hiver (horaires réduits et conditions difficiles).',
    ]),
    InfoSection('💰', 'Tarifs et Pass', [
      'Entrée : 35 dollars par véhicule (pass 7 jours).',
      'Pass America the Beautiful : Accès multi-parcs nationaux.',
      'Camping : Gratuit à Island in the Sky (sans réservation) ou campings payants (env. 20 dollars).',
    ]),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '🚗 Mobilité : Prévoyez de longs temps de trajet, aucun accès direct entre les districts.',
      '⚠️ Sécurité : Zone désertique, restez sur les pistes balisées.',
    ]),
  ],
  warning:
  "Attention : les prix et les horaires peuvent changer. Vérifiez les mises à jour avant votre départ.",
);

class CanyonlandsPage extends StatelessWidget {
  final String title;
  const CanyonlandsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: canyonlandsData, title: title);
}