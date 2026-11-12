import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData pageAndPowellDataEn = DestinationData(
  id: 'page-lac-powell',
  name: "Page and Lake Powell, Arizona",
  emoji: '📍',
  accent: const Color(0xFF35B8E0),
  cover: 'assets/images/99.jpg',
  gallery: const [
    'assets/images/96.jpg',
    'assets/images/97.jpg',
    'assets/images/100.jpg',
    'assets/images/101.webp',
  ],
  didYouKnow:
  "The vast blue of Lake Powell finds a historic echo on the shores of Lake Nasser, in Egypt 🇪🇬.",
  intro:
  "Located in northern Arizona, the town of Page is a key stop on any road trip. Renowned for its grand landscapes, it houses wonders such as Antelope Canyon, Lake Powell, and the famous Horseshoe Bend.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Spring and Autumn'),
    QuickFact('🌅', 'Best moment', 'Sunrise or sunset at Horseshoe Bend'),
    QuickFact('🎟️', 'Reservations', 'Several months in advance'),
  ],
  sections: const [
    InfoSection('🌅', "Recommended Times (Light & Calm)", [
      "🌅 Sunrise / Sunset: Ideal at Horseshoe Bend for spectacular contrasts between the river and the canyon walls.",
      "👥 Avoiding crowds: Visit view points early in the morning or after 5 PM to avoid the crowds from tour buses.",
    ]),
    InfoSection('🗓️', "Seasons and Advice", [
      "✅ Recommended season: Spring and Autumn for pleasant temperatures on the lake.",
      "❌ Period to avoid: Mid-summer due to the stifling heat that limits outdoor activities.",
    ]),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before you leave.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "🛶 Activities: Rent a kayak to discover the narrow canyons of Lake Powell.",
      "🎟️ Reservations: Book your tours (especially Antelope Canyon) several months in advance.",
    ]),
  ],
  warning:
  "Attention: Prices, access fees, and weather conditions may change. Check for updates before your departure.",
);

class PageAndPowellPage extends StatelessWidget {
  final String title;
  const PageAndPowellPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: pageAndPowellDataEn, title: title, labels: DestinationLabels.en);
}