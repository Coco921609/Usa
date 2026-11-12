import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData deathValleyData = DestinationData(
  id: 'death-valley',
  name: 'Death Valley',
  emoji: '🔥',
  accent: const Color(0xFFFFC857),
  cover: 'assets/images/44.webp',
  gallery: const [
    'assets/images/43.jpg',
    'assets/images/47.jpg',
    'assets/images/48.webp',
  ],
  didYouKnow:
  "Les paysages de dunes spectaculaires de la Vallée de la Mort rappellent la magie des dunes de Merzouga, dans le Sahara 🇲🇦.",
  intro:
  "Terre d'extrêmes, la Vallée de la Mort fascine par ses contrastes saisissants. Sous ce bassin situé en dessous du niveau de la mer, où la chaleur estivale bat des records, la vie déploie des trésors de résilience. Entre sommets enneigés, oasis luxuriantes et rares champs de fleurs sauvages, ce décor hostile révèle une diversité insoupçonnée malgré son nom évocateur.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Hiver et printemps'),
    QuickFact('💰', 'Véhicule privé', '30 dollars'),
    QuickFact('🕒', 'Ouverture', '24h/24, toute l’année'),
  ],
  sections: const [
    InfoSection('📍', 'Sites incontournables', [
      '🧂 Badwater Basin : L\'immensité blanche du célèbre désert de sel.',
      '🏜️ Mesquite Flat Sand Dunes : Des dunes de sable majestueuses.',
      '⛰️ Zabriskie Point : Des formations rocheuses aux teintes dorées incroyables.',
    ]),
    InfoSection('🕒', 'Horaires et Fréquentation', [
      'Parc ouvert 24h/24, toute l\'année.',
      '🌅 Horaires recommandés : Privilégiez le lever du soleil à Zabriskie Point ou le coucher sur les dunes pour des lumières inoubliables.',
      '👥 Évitement : Visitez les sites entre novembre et mars, très tôt le matin ou après 17h, pour éviter la chaleur extrême et la foule.',
    ]),
    InfoSection('🗓️', 'Saisons', [
      '✅ Saison recommandée : L\'hiver et le printemps. Les journées sont agréables, les nuits fraîches et le paysage sublime.',
      '❌ Période à éviter : L\'été (mai à septembre). La chaleur devient mortelle et les activités sont très limitées.',
    ]),
    InfoSection('💰', 'Tarifs', [
      'Véhicule privé|30 dollars',
      'Moto|25 dollars',
      'Individuel|15 dollars',
      'Pass annuel du parc|55 dollars',
    ], kind: SectionKind.prices),
    InfoSection('🎒', 'Conseils Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau (indispensable).',
      '📸 N\'oubliez pas votre appareil photo !',
      '🚗 Véhicule : Assurez-vous que votre système de refroidissement fonctionne parfaitement.',
      '👟 Équipement : Portez des vêtements légers, un chapeau et de la crème solaire haute protection.',
    ]),
  ],
  warning:
  "Attention : les horaires et les tarifs peuvent changer au cours de l'année.",
);

class DeathValleyPage extends StatelessWidget {
  final String title;
  const DeathValleyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: deathValleyData, title: title);
}