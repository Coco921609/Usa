import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData yellowstoneData = DestinationData(
  id: 'yellowstone',
  name: 'Parc National de Yellowstone',
  emoji: '🌋',
  accent: const Color(0xFF7BE0A0),
  cover: 'assets/images/20.webp',
  gallery: const [
    'assets/images/27.webp',
    'assets/images/23.jpg',
    'assets/images/24.jpg',
    'assets/images/25.jpg',
    'assets/images/26.jpg',
    'assets/images/29.jpg',
    'assets/images/30.webp',
    'assets/images/31.jpg',
    'assets/images/34.webp',
    'assets/images/40.webp',
    'assets/images/38.webp',
    'assets/images/35.jpg',
    'assets/images/41.jpg',
  ],
  didYouKnow:
  "Les phénomènes géothermiques de Yellowstone trouvent un cousin fascinant du côté des geysers de Geysir, en Islande 🇮🇸.",
  intro:
  "Inauguré en 1872, Yellowstone demeure le premier parc national jamais créé au monde. Avec sa superficie de 9 000 km² et son altitude moyenne de 2 400 m, ce plateau repose sur une immense caldeira abritant un supervolcan toujours actif. Sous cette terre bouillonnante, où se concentrent deux tiers des geysers de la planète, se déploie une nature sauvage et imprévisible.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Septembre, ou mi-juin à fin août'),
    QuickFact('💰', 'Entrée (été)', '35 dollars par véhicule'),
    QuickFact('🕒', 'Ouverture', '24h/24 toute l’année'),
  ],
  sections: const [
    InfoSection('⭐', 'Les incontournables', [
      'Old Faithful : Le geyser légendaire, attraction incontournable attirant chaque été des millions de visiteurs.',
      'Grand Prismatic Spring : Plus grande source chaude des États-Unis et l\'une des plus vastes au monde, il offre un spectacle chromatique irréel.',
      'Grand Canyon de Yellowstone : Un site aux parois jaunes spectaculaires, façonné par une rivière tumultueuse.',
      'Lac de Yellowstone : Le plus vaste lac de montagne d\'Amérique du Nord, offrant un panorama grandiose.',
    ]),
    InfoSection('🗺️', 'Les 7 grands secteurs', [
      'Sud-ouest : Concentration géothermique majeure (Grand Prismatic, Old Faithful).',
      'Madison : Zone privilégiée pour observer la faune sauvage.',
      'Norris : Porcelain et Back Basin, réputés pour leurs sources aux couleurs fascinantes.',
      'Mammoth Hot Springs : Terrasses calcaires aux formes insolites.',
      'Tower Roosevelt : Paysages forestiers verdoyants et accès à la Lamar Valley.',
      'Canyon Village : Grand Canyon de la Yellowstone River et ses cascades impressionnantes.',
      'Sud-est : Parfait pour la randonnée et la pêche (Lake Yellowstone, West Thumb).',
    ]),
    InfoSection('💡', 'Le saviez-vous ? Grand Prismatic', [
      "La beauté fascinante du Grand Prismatic trouve un écho spectaculaire dans la piscine de Wai-O-Tapu, en Nouvelle-Zélande 🇳🇿.",
    ], kind: SectionKind.text),
    InfoSection('🕒', 'Grand Prismatic : Horaires et Fréquentation', [
      '🌅 Horaires recommandés : Privilégiez le milieu de journée pour une visibilité optimale des couleurs grâce à la lumière verticale qui dissipe la vapeur.',
      '👥 Évitement : Arrivez très tôt le matin ou en toute fin d\'après-midi pour éviter les parkings saturés en haute saison.',
    ]),
    InfoSection('🗓️', 'Grand Prismatic : Saisons et Conseils', [
      '✅ Saison recommandée : L\'été, pour profiter des couleurs éclatantes sous un ciel dégagé.',
      '❌ Période à éviter : Les journées très froides ou humides, où la vapeur masque quasiment tout le bassin.',
    ]),
    InfoSection('📍', 'Pourquoi choisir une excursion ?', [
      'Accès simplifié, transport organisé et conseils photo exclusifs.',
      'Gain de temps précieux pour combiner le site avec d\'autres geysers ou observer la faune locale.',
    ]),
    InfoSection('💰', 'Tarifs', [
      'Été (par véhicule)|35 dollars',
      'Hiver (par véhicule)|30 dollars',
    ], kind: SectionKind.prices),
    InfoSection('🎫', 'Pass acceptés', [
      'America the Beautiful Pass (Parcs nationaux)',
      'Pass Sénior',
      'Pass militaire',
      'Pass gratuit pour les élèves de 4e année (USA)',
    ]),
    InfoSection('🕒', 'Horaires et Fréquentation', [
      'Ouvert 24h/24 toute l\'année, avec des services variables selon la saison.',
      '🌅 Horaires recommandés : Privilégiez l\'aube et le crépuscule pour la lumière et l\'observation de la faune.',
      '👥 Évitement : Visitez les sites majeurs avant 9h00 ou après 18h00 pour éviter les foules.',
    ]),
    InfoSection('🗓️', 'Saisons et Affluence', [
      '✅ Saison recommandée : Septembre (tranquillité) ou mi-juin à fin août (accès complet).',
      '❌ Période à éviter : Juillet et août (pics d\'affluence et saturation des parkings).',
    ]),
    InfoSection('🎒', 'Informations Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
      '⚠️ Sécurité : Restez sur les sentiers ; l\'eau hydrothermale peut causer des brûlures graves.',
      '👣 Respect : Ne courez pas et ne touchez jamais les tapis hydrothermaux fragiles.',
    ]),
  ],
  note:
  "Note : Le site est inclus dans votre droit d'entrée au parc national de Yellowstone.",
);

class YellowstonePage extends StatelessWidget {
  final String title;
  const YellowstonePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: yellowstoneData, title: title);
}