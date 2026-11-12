import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData flyGeyserDataEn = DestinationData(
  id: 'fly-geyser',
  name: "Fly Geyser, Nevada",
  emoji: '♨️',
  accent: const Color(0xFF4DD6B0),
  cover: 'assets/images/77.webp',
  gallery: const [
    'assets/images/75.jpg',
    'assets/images/76.webp',
    'assets/images/78.jpg',
    'assets/images/79.jpg',
  ],
  didYouKnow:
  "The Fly Geyser finds a fascinating echo in the hot springs of Hveravellir, Iceland 🇮🇸.",
  intro:
  "An artificial geyser formed accidentally in 1964 during a drilling project, it erupts continuously, creating a spectacular cone. Its vibrant colors (green, red, orange, yellow) come from thermophilic algae and minerals. Located in the Black Rock Desert, it remains an isolated and protected jewel.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Spring and Autumn'),
    QuickFact('📍', 'Location', 'Black Rock Desert, ~32 km north of Gerlach'),
    QuickFact('🔒', 'Access', 'Private property, regulated access'),
  ],
  sections: const [
    InfoSection('🌅', "Recommended Times (Light & Calm)", [
      "🌅 Sunrise and late afternoon: Ideal for grazing light that enhances the colors.",
      "🌤️ Clear sky after rain: Contrasts are striking then.",
      "👥 Avoiding crowds: Prioritize organized guided tours to access the private site.",
    ]),
    InfoSection('🗓️', "Seasons and Advice", [
      "✅ Recommended season: Spring and Autumn for pleasant temperature conditions.",
      "❌ Period to avoid: Mid-summer for the extreme heat of the Nevada desert.",
    ]),
    InfoSection('📍', "Access and Organization", [
      "Location: Black Rock Desert, ~32 km north of Gerlach (Washoe County).",
      "Private property: The geyser is located at Fly Ranch, access is regulated.",
      "Advice: Include this stop via a specialized agency to facilitate limited access.",
    ]),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before leaving.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "⚠️ Accessibility: Do not attempt to get there without prior authorization.",
      "🚗 Logistics: Plan a consistent itinerary, the site is very isolated.",
    ]),
  ],
  warning:
  "Attention: Access conditions and rates may change. Always check for updates before your departure.",
);

class FlyGeyserPage extends StatelessWidget {
  final String title;
  const FlyGeyserPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: flyGeyserDataEn, title: title, labels: DestinationLabels.en);
}