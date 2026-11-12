import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData lassenDunesData = DestinationData(
  id: 'dunes-peintes-lassen',
  name: 'Painted Dunes & Parc de Lassen',
  emoji: '🎨',
  accent: const Color(0xFFFF7EB6),
  cover: 'assets/images/74.webp',
  gallery: const [
    'assets/images/73.jpg',
    'assets/images/70.jpg',
    'assets/images/71.jpg',
  ],
  didYouKnow:
  "Les Painted Dunes trouvent un cousin fascinant du côté du volcan Landmannalaugar, en Islande 🇮🇸.",
  intro:
  "Situé dans le nord de la Californie, le parc national volcanique de Lassen est une terre isolée de sommets enneigés et de lacs clairs. Les Painted Dunes, formées par l'oxydation de cendres volcaniques, offrent des teintes vibrantes de rouge, rose et jaune, visibles depuis le sommet du Cinder Cone.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Automne, ou mai à octobre'),
    QuickFact('🚗', 'Accès', 'Route d’État 89'),
    QuickFact('🌅', 'Meilleure lumière', 'Heure dorée en automne'),
  ],
  sections: const [
    InfoSection('🕒', 'Horaires et Fréquentation', [
      '🌅 Horaires recommandés : L\'heure dorée en automne (15 min après le coucher) pour une lumière magique.',
      '👥 Évitement : En été, arrivez tôt le matin car les dunes sont à l\'ombre l\'après-midi.',
      'Ouvert presque toute l\'année, mais avec des accès limités selon les événements spéciaux.',
    ]),
    InfoSection('🗓️', 'Saisons et Conseils', [
      '✅ Saison recommandée : Automne pour les couleurs éclatantes, ou mai à octobre pour l\'accès total.',
      '❌ Période à éviter : Novembre à mai (fortes chutes de neige, routes fermées).',
    ]),
    InfoSection('💰', 'Tarifs et Pass', [
      'Tarif d\'entrée : 250 USD (valable pour 4 occupants par voiture).',
      'Pass America the Beautiful : Recommandé pour un accès illimité sur 12 mois.',
    ]),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '🚗 Accès : Via la Route d’État 89 (Lassen Volcanic Park Highway).',
      '⚠️ Sécurité : Vérifiez les ouvertures de routes, le parc ferme souvent en hiver.',
    ]),
  ],
  warning:
  "Attention : les prix et les horaires peuvent changer. Vérifiez les mises à jour avant votre départ.",
);

class LassenDunesPage extends StatelessWidget {
  final String title;
  const LassenDunesPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: lassenDunesData, title: title);
}