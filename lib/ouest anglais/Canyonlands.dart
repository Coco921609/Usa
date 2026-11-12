import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData canyonlandsDataEn = DestinationData(
  id: 'canyonlands',
  name: "Canyonlands National Park",
  emoji: '🏜️',
  accent: const Color(0xFFE9A04B),
  cover: 'assets/images/61.webp',
  gallery: const [
    'assets/images/59.jpg',
    'assets/images/60.webp',
    'assets/images/61.webp',
    'assets/images/62.webp',
    'assets/images/63.jpg',
  ],
  didYouKnow:
  "The rock formations of Canyonlands find a fascinating cousin in the Bungle Bungle Range, Australia 🇦🇺.",
  intro:
  "Canyonlands is a wilderness of canyons, buttes, and spires carved by the Colorado and Green Rivers. The park is divided into four distinct districts; no roads connect them. Each area offers unique opportunities for adventure.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Spring and Autumn'),
    QuickFact('💰', 'Entrance', '35 dollars per vehicle (7-day pass)'),
    QuickFact('🕒', 'Hours', '7 AM to 8 PM, Visitor Center 9 AM to 5 PM'),
  ],
  sections: const [
    InfoSection('🗺️', "Park Districts", [
      "Island in the Sky: The most visited and accessible part.",
      "The Maze: The most isolated area, perfect for off-the-beaten-path adventure.",
      "The Needles: The ideal district for hiking enthusiasts.",
    ]),
    InfoSection('🕒', "Hours and Crowds", [
      "🌅 Recommended times: Prioritize dawn and dusk for the most spectacular lighting.",
      "👥 Avoiding crowds: Visit major sites outside of peak heat and peak hours.",
      "Generally open from 7 AM to 8 PM. Visitor Center: 9 AM to 5 PM.",
    ]),
    InfoSection('🗓️', "Seasons and Advice", [
      "✅ Recommended season: Spring and Autumn for mild temperatures.",
      "❌ Period to avoid: Mid-summer (extreme heat) and mid-winter (reduced hours and difficult conditions).",
    ]),
    InfoSection('💰', "Fees and Passes", [
      "Entrance: 35 dollars per vehicle (7-day pass).",
      "America the Beautiful Pass: Multi-national park access.",
      "Camping: Free at Island in the Sky (no reservation) or paid campgrounds (approx. 20 dollars).",
    ]),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before leaving.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "🚗 Mobility: Plan for long travel times; there is no direct access between districts.",
      "⚠️ Safety: Desert zone, stay on marked trails.",
    ]),
  ],
  warning:
  "Attention: Prices and hours may change. Check for updates before your departure.",
);

class CanyonlandsPage extends StatelessWidget {
  final String title;
  const CanyonlandsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: canyonlandsDataEn, title: title, labels: DestinationLabels.en);
}