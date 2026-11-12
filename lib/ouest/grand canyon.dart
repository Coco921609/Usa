import 'package:flutter/material.dart';
import 'destination_template.dart';

final DestinationData grandCanyonData = DestinationData(
  id: 'grand-canyon',
  name: 'Le Grand Canyon',
  emoji: '🏜️',
  accent: const Color(0xFFFF9A62),
  cover: 'assets/images/6.jpg',
  gallery: const [
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/8.webp',
    'assets/images/9.jpg',
  ],
  didYouKnow:
  "Il existe un endroit pareil au Grand Canyon : Kings Canyon, en Australie 🇦🇺. Ce site rappelle la beauté des formations rocheuses.",
  intro:
  "Situé en plein cœur de l'Arizona, le Grand Canyon est une merveille géologique qui fascine les voyageurs du monde entier. S'étendant sur plus de 450 km, ce site majestueux dévoile une nature à la fois sauvage et spectaculaire, sublimée par des roches aux teintes flamboyantes oscillant entre le rose et l'orange.",
  facts: const [
    QuickFact('🗓️', 'Saison recommandée', 'Avril-mai ou septembre-octobre'),
    QuickFact('💰', 'Véhicule (7 jours)', '30 \$'),
    QuickFact('🕒', 'Ouverture', '24h/24 toute l’année'),
  ],
  sections: const [
    InfoSection('🕒', 'Horaires d\'ouverture', [
      "Le parc est ouvert 24h/24 toute l'année. Les installations pour les visiteurs fonctionnent de 7h00 à 18h00 (mai à septembre) et de 8h00 à 17h00 (basse saison).",
    ], kind: SectionKind.text),
    InfoSection('🌅', 'Conseils photo : Lever et Coucher', [
      "Pour des photos inoubliables, privilégiez l'heure dorée : arrivez au moins 45 minutes avant le lever ou le coucher du soleil pour capturer les changements de lumière sur les parois.",
    ], kind: SectionKind.text),
    InfoSection('🗓️', 'Saisons et Affluence', [
      '✅ Saison recommandée : Printemps (avril-mai) ou Automne (septembre-octobre) pour un climat agréable.',
      '❌ Période à éviter pour la foule : Juillet et Août (très haute affluence et chaleur intense).',
      '💡 Astuce : Visitez la Rive Nord (North Rim) si vous cherchez le calme, elle est moins fréquentée que la Rive Sud.',
    ]),
    InfoSection('💰', 'Tarifs et Billets (sans espèces)', [
      'Véhicule (7 jours)|30 \$',
      'Moto|25 \$',
      'Individuel|15 \$',
    ], kind: SectionKind.prices),
    InfoSection('🎒', 'Informations Pratiques', [
      '🌤️ Vérifiez toujours la météo avant de partir.',
      '💧 Prévoyez d\'importantes réserves d\'eau.',
      '📸 N\'oubliez pas votre appareil photo !',
    ]),
  ],
  warning:
  "Attention : les horaires et prix peuvent changer au cours de l'année.",
);

class GrandCanyonPage extends StatelessWidget {
  final String title;
  const GrandCanyonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      DestinationPage(data: grandCanyonData, title: title);
}