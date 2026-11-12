import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData lassenDunesDataEn = DestinationData(
  id: 'dunes-peintes-lassen',
  name: "Painted Dunes & Lassen Park",
  emoji: '🎨',
  accent: const Color(0xFFFF7EB6),
  cover: 'assets/images/74.webp',
  gallery: const [
    'assets/images/73.jpg',
    'assets/images/70.jpg',
    'assets/images/71.jpg',
  ],
  didYouKnow:
  "The Painted Dunes find a fascinating cousin in the Landmannalaugar volcano, Iceland 🇮🇸.",
  intro:
  "Located in northern California, Lassen Volcanic National Park is an isolated land of snow-capped peaks and clear lakes. The Painted Dunes, formed by the oxidation of volcanic ash, offer vibrant hues of red, pink, and yellow, visible from the summit of Cinder Cone.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Autumn, or May to October'),
    QuickFact('🚗', 'Access', 'State Route 89'),
    QuickFact('🌅', 'Best light', 'Golden hour in autumn'),
  ],
  sections: const [
    InfoSection('🕒', "Hours and Crowds", [
      "🌅 Recommended times: The golden hour in autumn (15 min after sunset) for magical lighting.",
      "👥 Avoiding crowds: In summer, arrive early in the morning as the dunes are in the shade in the afternoon.",
      "Open almost all year, but with limited access depending on special events.",
    ]),
    InfoSection('🗓️', "Seasons and Advice", [
      "✅ Recommended season: Autumn for vibrant colors, or May to October for full access.",
      "❌ Period to avoid: November to May (heavy snowfall, roads closed).",
    ]),
    InfoSection('💰', "Fees and Passes", [
      "Entrance fee: 250 USD (valid for 4 occupants per car).",
      "America the Beautiful Pass: Recommended for unlimited access over 12 months.",
    ]),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before leaving.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "🚗 Access: Via State Route 89 (Lassen Volcanic Park Highway).",
      "⚠️ Safety: Check road openings; the park often closes in winter.",
    ]),
  ],
  warning:
  "Attention: Prices and hours may change. Check for updates before your departure.",
);

class LassenDunesPage extends StatelessWidget {
  final String title;
  const LassenDunesPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: lassenDunesDataEn, title: title, labels: DestinationLabels.en);
}