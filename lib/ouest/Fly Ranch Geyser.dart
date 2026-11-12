import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData flyGeyserData = DestinationData(
  id: 'fly-geyser',
  name: 'Fly Geyser, Nevada',
  emoji: '♨️',
  accent: const Color(0xFF4DD6B0),
  cover: 'assets/images/77.webp',
  gallery: const [
    'assets/images/75.jpg',
    'assets/images/76.webp',
    'assets/images/78.jpg',
    'assets/images/79.jpg',
  ],
  didYouKnow:
  "Le Fly Geyser trouve un écho fascinant dans les sources chaudes de Hveravellir, en Islande 🇮🇸.",
  intro:
  "Geyser artificiel formé accidentellement en 1964 lors d'un forage, il jaillit en continu, créant un cône spectaculaire. Ses couleurs vives (vert, rouge, orange, jaune) proviennent d'algues thermophiles et de minéraux. Situé dans le désert de Black Rock, il reste un joyau isolé et protégé.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Printemps et automne'),
    QuickFact('📍', 'Localisation', 'Désert de Black Rock, ~32 km au nord de Gerlach'),
    QuickFact('🔒', 'Accès', 'Propriété privée, accès réglementé'),
  ],
  sections: const [
    InfoSection('🌅', 'Horaires recommandés (Lumière & Calme)', [
      '🌅 Lever du soleil et fin d\'après-midi : Idéal pour les lumières rasantes qui subliment les couleurs.',
      '🌤️ Ciel clair après pluie : Les contrastes sont alors saisissants.',
      '👥 Évitement : Privilégiez les visites guidées organisées pour accéder au site privé.',
    ]),
    InfoSection('🗓️', 'Saisons et Conseils', [
      '✅ Saison recommandée : Printemps et automne pour des conditions de température agréables.',
      '❌ Période à éviter : Mi-été pour la chaleur extrême du désert du Nevada.',
    ]),
    InfoSection('📍', 'Accès et Organisation', [
      'Localisation : Désert de Black Rock, ~32 km au nord de Gerlach (Comté de Washoe).',
      'Propriété privée : Le geyser se trouve au Fly Ranch, l\'accès est réglementé.',
      'Conseil : Intégrez cette étape via une agence spécialisée pour faciliter les accès limités.',
    ]),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '⚠️ Accessibilité : Ne tentez pas de vous y rendre sans autorisation préalable.',
      '🚗 Logistique : Prévoyez une cohérence d\'itinéraire, le site est très isolé.',
    ]),
  ],
  warning:
  "Attention : les conditions d'accès et les tarifs peuvent changer. Vérifiez toujours les mises à jour avant votre départ.",
);

class FlyGeyserPage extends StatelessWidget {
  final String title;
  const FlyGeyserPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: flyGeyserData, title: title);
}