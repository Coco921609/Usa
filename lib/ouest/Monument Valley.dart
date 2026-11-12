import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData monumentValleyData = DestinationData(
  id: 'monument-valley',
  name: 'Monument Valley',
  emoji: '🏜️',
  accent: const Color(0xFFE4572E),
  cover: 'assets/images/10.jpg',
  gallery: const [
    'assets/images/14.jpg',
    'assets/images/17.jpg',
    'assets/images/11.webp',
    'assets/images/12.webp',
    'assets/images/17.webp',
    'assets/images/18.jpg',
    'assets/images/19.webp',
  ],
  didYouKnow:
  "Il existe un endroit qui rappelle la beauté de ces formations rocheuses : le désert du Wadi Rum, en Jordanie 🇯🇴.",
  intro:
  "À la frontière entre l'Arizona et l'Utah, Monument Valley déploie ses majestueuses formations rocheuses au cœur du territoire des Navajos. Immortalisé dans d'innombrables films, ce paysage emblématique impressionne par ses mesas et cheminées de grès. Un décor grandiose pour une immersion totale dans un univers sauvage et sacré.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Printemps et automne'),
    QuickFact('💰', 'Accès au parc', '10 dollars par personne'),
    QuickFact('⏱️', 'Durée conseillée', 'Une demi-journée'),
  ],
  sections: const [
    InfoSection('🕒', 'Horaires et Fréquentation', [
      'Ouvert tous les jours. De mars à août : 6h30 à 19h30. Le reste de l\'année : 8h à 17h.',
      '🌅 Horaires recommandés : Le lever du soleil est idéal pour voir les roches s\'embraser, tandis que le coucher offre une lumière douce spectaculaire.',
      '👥 Évitement : Privilégiez les visites hors saison ou en début de matinée pour échapper à la foule.',
    ]),
    InfoSection('🗓️', 'Saisons et Affluence', [
      '✅ Saison recommandée : Le printemps et l\'automne pour bénéficier de températures clémentes.',
      '❌ Période à éviter : Juillet et août, où la chaleur est intense et le site très fréquenté.',
    ]),
    InfoSection('💰', 'Tarifs et Accès', [
      'Accès au parc : 10 dollars par personne. Prévoir une demi-journée pour explorer le Visitor Center, la Valley Drive et les points de vue.',
    ], kind: SectionKind.text),
    InfoSection('🎒', 'Informations Pratiques', [
      '🌤️ Vérifiez la météo : les orages peuvent rendre les pistes impraticables.',
      '💧 Prévoyez de grandes réserves d\'eau, le climat est très sec.',
      '📸 Protégez votre matériel photo contre le sable.',
      '🧭 Téléchargez vos cartes GPS hors-ligne, le réseau mobile est instable.',
      '👟 Portez des chaussures de marche fermées et confortables.',
    ]),
  ],
  warning:
  "Attention : les horaires et les tarifs peuvent être modifiés au cours de l'année.",
);

class MonumentValleyPage extends StatelessWidget {
  final String title;
  const MonumentValleyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: monumentValleyData, title: title);
}