import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData monumentValleyDataEn = DestinationData(
  id: 'monument-valley',
  name: "Monument Valley",
  emoji: '🏜️',
  accent: const Color(0xFFE4572E),
  cover: 'assets/images/10.jpg',
  gallery: const [
    'assets/images/14.jpg',
    'assets/images/17.jpg',
    'assets/images/11.webp',
    'assets/images/12.webp',
    'assets/images/17.webp',
    'assets/images/18.jpg',
    'assets/images/19.webp',
  ],
  didYouKnow:
  "There is a place that recalls the beauty of these rock formations: the Wadi Rum desert, in Jordan 🇯🇴.",
  intro:
  "On the border between Arizona and Utah, Monument Valley displays its majestic rock formations in the heart of Navajo territory. Immortalized in countless films, this iconic landscape impresses with its mesas and sandstone spires. A grand setting for total immersion in a wild and sacred world.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Spring and Autumn'),
    QuickFact('💰', 'Park access', '10 dollars per person'),
    QuickFact('⏱️', 'Suggested time', 'Half a day'),
  ],
  sections: const [
    InfoSection('🕒', "Hours and Crowds", [
      "Open every day. March to August: 6:30 AM to 7:30 PM. The rest of the year: 8:00 AM to 5:00 PM.",
      "🌅 Recommended times: Sunrise is ideal for seeing the rocks glow, while sunset offers spectacular soft lighting.",
      "👥 Avoiding crowds: Prioritize off-season visits or early mornings to escape the crowds.",
    ]),
    InfoSection('🗓️', "Seasons and Crowds", [
      "✅ Recommended season: Spring and Autumn to enjoy mild temperatures.",
      "❌ Period to avoid: July and August, when the heat is intense and the site is very busy.",
    ]),
    InfoSection('💰', "Fees and Access", [
      "Park access: 10 dollars per person. Plan for half a day to explore the Visitor Center, the Valley Drive, and the viewpoints.",
    ], kind: SectionKind.text),
    InfoSection('🎒', "Practical Information", [
      "🌤️ Check the weather: storms can make the trails impassable.",
      "💧 Bring large water supplies; the climate is very dry.",
      "📸 Protect your photo equipment from sand.",
      "🧭 Download offline GPS maps; mobile coverage is unstable.",
      "👟 Wear closed, comfortable walking shoes.",
    ]),
  ],
  warning: "Attention: Hours and rates may change throughout the year.",
);

class MonumentValleyPage extends StatelessWidget {
  final String title;
  const MonumentValleyPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: monumentValleyDataEn, title: title, labels: DestinationLabels.en);
}