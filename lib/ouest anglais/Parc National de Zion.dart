import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData zionParkDataEn = DestinationData(
  id: 'zion',
  name: "Zion National Park",
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
  "The vertiginous beauty of Zion finds a fascinating cousin in the Zhangjiajie Mountains, in China 🇨🇳.",
  intro:
  "Follow trails walked for millennia. Behold immense cream, pink, and red sandstone cliffs rising into a brilliant blue sky. Discover the towering walls of a narrow canyon where you can hike with your feet in the water (The Narrows).",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Spring (blooming) and Autumn'),
    QuickFact('💰', 'Entrance', '35 dollars per vehicle (7 days)'),
    QuickFact('🚌', 'Free shuttle', 'March 7 to November 28, 2026'),
  ],
  sections: const [
    InfoSection('🕒', "Hours and Crowds", [
      "🌅 Recommended times: Early morning (before 8 AM) or late afternoon for the softest light.",
      "👥 Avoiding crowds: The park is very busy; visit major sites outside of peak periods for more serenity.",
      "Open 24/7, 365 days a year. Free shuttle in the canyon from March 7 to November 28, 2026.",
    ]),
    InfoSection('🗓️', "Seasons and Advice", [
      "✅ Recommended season: Spring (blooming) and Autumn (ideal temperatures).",
      "❌ Period to avoid: Mid-summer (extreme heat) and periods with risks of flash floods in narrow canyons.",
    ]),
    InfoSection('💰', "Fees and Passes", [
      "Entrance|35 dollars per vehicle (7 days)",
      "Non-US Citizen Surcharge (as of 2026)|100 dollars per person",
      "America the Beautiful Pass (non-residents)|250 dollars per year",
    ], kind: SectionKind.prices),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before you leave.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "👣 Equipment: For The Narrows, plan for appropriate water shoes.",
      "⚠️ Safety: Stay informed about flash flood risks.",
    ]),
  ],
  warning:
  "Attention: Prices, additional fees, and hours may change. Check official updates before your visit.",
);

class ZionParkPage extends StatelessWidget {
  final String title;
  const ZionParkPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: zionParkDataEn, title: title, labels: DestinationLabels.en);
}