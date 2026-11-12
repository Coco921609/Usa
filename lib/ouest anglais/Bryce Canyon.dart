import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData bryceCanyonDataEn = DestinationData(
  id: 'bryce-canyon',
  name: "Bryce Canyon National Park",
  emoji: '🧗',
  accent: const Color(0xFFFF6B5E),
  cover: 'assets/images/67.jpg',
  gallery: const [
    'assets/images/64.jpg',
    'assets/images/65.jpg',
    'assets/images/66.jpg',
    'assets/images/68.jpg',
  ],
  didYouKnow:
  "The famous Fairy Chimneys of Cappadocia, in Turkey 🇹🇷, find a spectacular cousin here with our hoodoos.",
  intro:
  "Hoodoos (irregular columns of rock) exist on every continent, but this is where the largest concentration is found on Earth. Located on a high plateau at the top of the Grand Staircase, the park offers fantastic dark skies and indescribable geological wonders.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'May to September'),
    QuickFact('💰', 'Entrance', '35 dollars per vehicle'),
    QuickFact('🕒', 'Opening', '24/7, 365 days a year'),
  ],
  sections: const [
    InfoSection('🕒', "Hours and Crowds", [
      "🌅 Recommended times: Arrive for sunrise at Sunrise Point or stay for sunset at Sunset Point.",
      "👥 Avoiding crowds: Prioritize less-frequented trails like Fairyland Loop to avoid the main amphitheater crowds.",
      "Open 24/7, 365 days a year. Visitor Center: 8:00 AM–8:00 PM (summer), 8:00 AM–4:30 PM (winter).",
    ]),
    InfoSection('🗓️', "Seasons and Advice", [
      "✅ Recommended season: May to September for full access to roads and trails.",
      "❌ Period to avoid: Deep winter for high-altitude hiking, unless you are equipped for snow.",
    ]),
    InfoSection('💰', "Fees", [
      "Vehicle (7 days)|35 dollars",
      "Pedestrian or cyclist|20 dollars",
    ], kind: SectionKind.prices),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before leaving.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "🚌 Free shuttle: Use it from April to October (8 AM-6 PM/8 PM) for easy travel.",
      "👟 Hiking: Bring good shoes (Navajo Loop/Queen's Garden are must-sees).",
    ]),
  ],
  warning:
  "Attention: Prices and seasonal services may change. Check for updates before your departure.",
);

class BryceCanyonPage extends StatelessWidget {
  final String title;
  const BryceCanyonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: bryceCanyonDataEn, title: title, labels: DestinationLabels.en);
}