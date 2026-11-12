import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData bryceCanyonData = DestinationData(
  id: 'bryce-canyon',
  name: 'Bryce Canyon National Park',
  emoji: '🧗',
  accent: const Color(0xFFFF6B5E),
  cover: 'assets/images/67.jpg',
  gallery: const [
    'assets/images/64.jpg',
    'assets/images/65.jpg',
    'assets/images/66.jpg',
    'assets/images/68.jpg',
  ],
  didYouKnow:
  "Les célèbres Cheminées de Fée de Cappadoce, en Turquie 🇹🇷, trouvent un cousin spectaculaire ici avec nos hoodoos.",
  intro:
  "Les hoodoos (colonnes irrégulières de roche) existent sur tous les continents, mais c’est ici que la plus grande concentration se trouve sur Terre. Situé sur un haut plateau au sommet du Grand Escalier, le parc offre des ciels sombres fantastiques et des merveilles géologiques indescriptibles.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Mai à septembre'),
    QuickFact('💰', 'Entrée', '35 dollars par véhicule'),
    QuickFact('🕒', 'Ouverture', '24h/24, 365 jours par an'),
  ],
  sections: const [
    InfoSection('🕒', 'Horaires et Fréquentation', [
      '🌅 Horaires recommandés : Arrivez pour le lever du soleil à Sunrise Point ou restez pour le coucher à Sunset Point.',
      '👥 Évitement : Privilégiez les sentiers moins fréquentés comme Fairyland Loop pour éviter la foule de l\'amphithéâtre principal.',
      'Ouvert 24h/24, 365 jours par an. Visitor Center : 8h00–20h00 (été), 8h00–16h30 (hiver).',
    ]),
    InfoSection('🗓️', 'Saisons et Conseils', [
      '✅ Saison recommandée : Mai à septembre pour un accès total aux routes et sentiers.',
      '❌ Période à éviter : Hiver profond pour les randonnées en altitude, sauf si vous êtes équipé pour la neige.',
    ]),
    InfoSection('💰', 'Tarifs', [
      'Véhicule (7 jours)|35 dollars',
      'Piéton ou cycliste|20 dollars',
    ], kind: SectionKind.prices),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '🚌 Navette gratuite : Utilisez-la d\'avril à octobre (8h-18h/20h) pour circuler facilement.',
      '👟 Randonnée : Prévoyez de bonnes chaussures (Navajo Loop/Queen\'s Garden sont incontournables).',
    ]),
  ],
  warning:
  "Attention : les prix et les services saisonniers peuvent changer. Vérifiez les mises à jour avant votre départ.",
);

class BryceCanyonPage extends StatelessWidget {
  final String title;
  const BryceCanyonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: bryceCanyonData, title: title);
}