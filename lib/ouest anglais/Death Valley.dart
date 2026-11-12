import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData deathValleyDataEn = DestinationData(
  id: 'death-valley',
  name: "Death Valley",
  emoji: '🔥',
  accent: const Color(0xFFFFC857),
  cover: 'assets/images/44.webp',
  gallery: const [
    'assets/images/43.jpg',
    'assets/images/47.jpg',
    'assets/images/48.webp',
  ],
  didYouKnow:
  "The spectacular dune landscapes of Death Valley recall the magic of the Merzouga dunes in the Sahara 🇲🇦.",
  intro:
  "A land of extremes, Death Valley fascinates with its striking contrasts. Below this basin located below sea level, where summer heat breaks records, life displays treasures of resilience. Between snow-capped peaks, lush oases, and rare wildflower fields, this hostile setting reveals unsuspected diversity despite its evocative name.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Winter and Spring'),
    QuickFact('💰', 'Private vehicle', '30 dollars'),
    QuickFact('🕒', 'Opening', '24/7, all year round'),
  ],
  sections: const [
    InfoSection('📍', "Must-see Sites", [
      "🧂 Badwater Basin: The white vastness of the famous salt desert.",
      "🏜️ Mesquite Flat Sand Dunes: Majestic sand dunes.",
      "⛰️ Zabriskie Point: Rock formations with incredible golden hues.",
    ]),
    InfoSection('🕒', "Hours and Crowds", [
      "Park open 24/7, all year round.",
      "🌅 Recommended times: Prioritize sunrise at Zabriskie Point or sunset on the dunes for unforgettable lighting.",
      "👥 Avoiding crowds: Visit sites between November and March, very early in the morning or after 5 PM, to avoid extreme heat and crowds.",
    ]),
    InfoSection('🗓️', "Seasons", [
      "✅ Recommended season: Winter and Spring. The days are pleasant, the nights are cool, and the landscape is sublime.",
      "❌ Period to avoid: Summer (May to September). The heat becomes deadly and activities are very limited.",
    ]),
    InfoSection('💰', "Fees", [
      "Private vehicle|30 dollars",
      "Motorcycle|25 dollars",
      "Individual|15 dollars",
      "Annual park pass|55 dollars",
    ], kind: SectionKind.prices),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before you leave.",
      "💧 Bring plenty of water supplies (essential).",
      "📸 Don't forget your camera!",
      "🚗 Vehicle: Ensure your cooling system is functioning perfectly.",
      "👟 Equipment: Wear light clothing, a hat, and high-protection sunscreen.",
    ]),
  ],
  warning: "Attention: Hours and fees may change throughout the year.",
);

class DeathValleyPage extends StatelessWidget {
  final String title;
  const DeathValleyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: deathValleyDataEn, title: title, labels: DestinationLabels.en);
}