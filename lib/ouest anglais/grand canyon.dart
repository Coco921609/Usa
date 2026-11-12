import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData grandCanyonDataEn = DestinationData(
  id: 'grand-canyon',
  name: "The Grand Canyon",
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
  "There is a place similar to the Grand Canyon called Kings Canyon, Australia 🇦🇺. This site reminds us of the beauty of the rock formations.",
  intro:
  "Located in the heart of Arizona, the Grand Canyon is a geological wonder that fascinates travelers from around the world. Stretching over 450 km, this majestic site unveils a nature that is both wild and spectacular, enhanced by rocks with flamboyant hues oscillating between pink and orange.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'April-May or September-October'),
    QuickFact('💰', 'Vehicle (7 days)', '30 \$'),
    QuickFact('🕒', 'Opening', '24/7 all year round'),
  ],
  sections: const [
    InfoSection('🕒', "Opening Hours", [
      "The park is open 24/7 all year round. Visitor facilities operate from 7:00 AM to 6:00 PM (May to September) and 8:00 AM to 5:00 PM (low season).",
    ], kind: SectionKind.text),
    InfoSection('🌅', "Photo Tips: Sunrise and Sunset", [
      "For unforgettable photos, take advantage of the golden hour: arrive at least 45 minutes before sunrise or sunset to capture the changing light on the canyon walls.",
    ], kind: SectionKind.text),
    InfoSection('🗓️', "Seasons and Crowds", [
      "✅ Recommended season: Spring (April-May) or Autumn (September-October) for pleasant weather.",
      "❌ Period to avoid for crowds: July and August (very high traffic and intense heat).",
      "💡 Tip: Visit the North Rim if you are looking for peace and quiet; it is less crowded than the South Rim.",
    ]),
    InfoSection('💰', "Fees and Tickets (Cashless)", [
      "Vehicle (7 days)|30 \$",
      "Motorcycle|25 \$",
      "Individual|15 \$",
    ], kind: SectionKind.prices),
    InfoSection('🎒', "Practical Information", [
      "🌤️ Always check the weather before you leave.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
    ]),
  ],
  warning: "Attention: Hours and prices may change throughout the year.",
);

class GrandCanyonPage extends StatelessWidget {
  final String title;
  const GrandCanyonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: grandCanyonDataEn, title: title, labels: DestinationLabels.en);
}