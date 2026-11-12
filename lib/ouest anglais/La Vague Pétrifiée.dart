import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData wavePetrifiedDataEn = DestinationData(
  id: 'vague-petrifiee',
  name: "The Petrified Wave (The Wave)",
  emoji: '🌊',
  accent: const Color(0xFFFF7A59),
  cover: 'assets/images/81.webp',
  gallery: const [
    'assets/images/81.webp',
    'assets/images/82.jpg',
    'assets/images/83.jpg',
  ],
  didYouKnow:
  "The famous Wave Rock, in Australia 🇦🇺, finds a fascinating echo in our Petrified Wave.",
  intro:
  "A natural masterpiece sculpted by wind and erosion, the Petrified Wave features striking ochre and red streaks. This wild site in the American West is a fascinating optical illusion, a true sanctuary for photographers.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Spring and Autumn'),
    QuickFact('📍', 'Authorization', 'Lottery permit, strictly limited access'),
    QuickFact('🧭', 'Orientation', 'Bring a GPS'),
  ],
  sections: const [
    InfoSection('🌅', "Recommended Times (Light & Calm)", [
      "🌅 Sunrise / Sunset: Ideal moments to capture color contrasts and shadows.",
      "👥 Avoiding crowds: Visit mid-morning for even light, but avoid midday to prevent overheating.",
    ]),
    InfoSection('🗓️', "Seasons and Advice", [
      "✅ Recommended season: Spring and Autumn to avoid extreme temperatures.",
      "❌ Period to avoid: July and August (dangerous heat) and periods of heavy rain (muddy trails).",
    ]),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before you leave.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "📍 Authorization: The site requires a specific permit (lottery) as access is strictly limited.",
      "🧭 Orientation: The trail is not always clearly marked; bring a GPS.",
    ]),
  ],
  warning:
  "Attention: Prices, access conditions, and lottery procedures may change. Check official updates before your trip.",
);

class WavePetrifiedPage extends StatelessWidget {
  final String title;
  const WavePetrifiedPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: wavePetrifiedDataEn, title: title, labels: DestinationLabels.en);
}