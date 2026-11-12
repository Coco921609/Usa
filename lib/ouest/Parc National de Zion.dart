import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData zionParkData = DestinationData(
  id: 'zion',
  name: 'Parc National de Zion',
  emoji: '🧗',
  accent: const Color(0xFFF08A6C),
  cover: 'assets/images/86.webp',
  gallery: const [
    'assets/images/84.webp',
    'assets/images/85.webp',
    'assets/images/87.jpg',
    'assets/images/88.jpg',
  ],
  didYouKnow:
  "La beauté vertigineuse de Zion trouve un cousin fascinant du côté des Montagnes de Zhangjiajie, en Chine 🇨🇳.",
  intro:
  "Suivez les sentiers parcourus depuis des millénaires. Regardez d’immenses falaises de grès crème, rose et rouge s’élever dans un ciel bleu éclatant. Découvrez les hautes parois étirées d'un canyon étroit où vous pourrez marcher les pieds dans l'eau (The Narrows).",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Printemps (floraison) et automne'),
    QuickFact('💰', 'Entrée', '35 dollars par véhicule (7 jours)'),
    QuickFact('🚌', 'Navette gratuite', 'Du 7 mars au 28 novembre 2026'),
  ],
  sections: const [
    InfoSection('🕒', 'Horaires et Fréquentation', [
      '🌅 Horaires recommandés : Tôt le matin (avant 8h) ou en fin d\'après-midi pour les lumières les plus douces.',
      '👥 Évitement : Le parc est très fréquenté ; visitez les sites majeurs en dehors des périodes de pointe pour plus de sérénité.',
      'Ouvert 24h/24, 365 jours par an. Navette gratuite dans le canyon du 7 mars au 28 novembre 2026.',
    ]),
    InfoSection('🗓️', 'Saisons et Conseils', [
      '✅ Saison recommandée : Printemps (floraison) et automne (températures idéales).',
      '❌ Période à éviter : Mi-été (chaleurs extrêmes) et périodes de risques d\'inondations soudaines dans les canyons étroits.',
    ]),
    InfoSection('💰', 'Tarifs et Pass', [
      'Entrée|35 dollars par véhicule (7 jours)',
      'Surtaxe non-américains (dès 2026)|100 dollars par personne',
      'Pass America the Beautiful (non-résidents)|250 dollars par an',
    ], kind: SectionKind.prices),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '👣 Équipement : Pour The Narrows, prévoyez des chaussures aquatiques adaptées.',
      '⚠️ Sécurité : Renseignez-vous sur les risques d\'inondations soudaines (flash floods).',
    ]),
  ],
  warning:
  "Attention : les prix, frais additionnels et horaires peuvent changer. Vérifiez les mises à jour officielles avant votre visite.",
);

class ZionParkPage extends StatelessWidget {
  final String title;
  const ZionParkPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: zionParkData, title: title);
}