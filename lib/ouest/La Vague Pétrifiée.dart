import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData wavePetrifieeData = DestinationData(
  id: 'vague-petrifiee',
  name: 'La Vague Pétrifiée (The Wave)',
  emoji: '🌊',
  accent: const Color(0xFFFF7A59),
  cover: 'assets/images/81.webp',
  gallery: const [
    'assets/images/81.webp',
    'assets/images/82.jpg',
    'assets/images/83.jpg',
  ],
  didYouKnow:
  "La célèbre Wave Rock, en Australie 🇦🇺, trouve un écho fascinant dans notre Vague Pétrifiée.",
  intro:
  "Chef-d'œuvre naturel sculpté par le vent et l'érosion, la Vague Pétrifiée présente des stries ocre et rouges saisissantes. Ce site sauvage de l'Ouest américain est une illusion d'optique fascinante, véritable sanctuaire pour les photographes.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Printemps et automne'),
    QuickFact('📍', 'Autorisation', 'Permis par loterie, accès limité'),
    QuickFact('🧭', 'Orientation', 'Prévoyez un GPS'),
  ],
  sections: const [
    InfoSection('🌅', 'Horaires recommandés (Lumière & Calme)', [
      '🌅 Lever / Coucher du soleil : Moments idéaux pour capturer les contrastes de couleurs et les ombres portées.',
      '👥 Évitement : Visitez en milieu de matinée pour une lumière homogène, mais évitez la mi-journée pour la surchauffe.',
    ]),
    InfoSection('🗓️', 'Saisons et Conseils', [
      '✅ Saison recommandée : Printemps et automne pour éviter les températures extrêmes.',
      '❌ Période à éviter : Juillet et août (chaleur dangereuse) et périodes de fortes pluies (sentiers boueux).',
    ]),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '📍 Autorisation : Le site nécessite un permis spécifique (loterie) car l\'accès est strictement limité.',
      '🧭 Orientation : Le sentier n\'est pas toujours clairement balisé, prévoyez un GPS.',
    ]),
  ],
  warning:
  "Attention : les prix, les conditions d'accès et les modalités de loterie peuvent changer. Vérifiez les mises à jour officielles avant votre voyage.",
);

class WavePetrifieePage extends StatelessWidget {
  final String title;
  const WavePetrifieePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: wavePetrifieeData, title: title);
}