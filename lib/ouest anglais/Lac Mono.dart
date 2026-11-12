import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData monoLakeDataEn = DestinationData(
  id: 'lac-mono',
  name: "Mono Lake, California",
  emoji: '🌊',
  accent: const Color(0xFF4FC3F7),
  cover: 'assets/images/94.webp',
  gallery: const [
    'assets/images/93.jpg',
    'assets/images/91.webp',
    'assets/images/90.webp',
  ],
  didYouKnow:
  "The strange formations of Mono Lake find a fascinating echo in the Chimneys of Lake Abbe, in Djibouti 🇩🇯.",
  intro:
  "Mono Lake is an ancient and fascinating saltwater lake, nestled at the foot of the Sierra Nevada. Famous for its spectacular tufa limestone columns and its unique ecosystem, it offers an almost extraterrestrial landscape.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Spring and Autumn'),
    QuickFact('🌅', 'Best moment', 'Sunrise or sunset'),
    QuickFact('🧢', 'Protection', 'Hat and sun protection'),
  ],
  sections: const [
    InfoSection('🌅', "Recommended Times (Light & Calm)", [
      "🌅 Sunrise / Sunset: Unmissable moments to see the tufa towers stand out beautifully against the sky.",
      "👥 Avoiding crowds: Prioritize weekday mornings to avoid crowds of passing tourists.",
    ]),
    InfoSection('🗓️', "Seasons and Advice", [
      "✅ Recommended season: Spring and Autumn for mild temperatures and sublime light.",
      "❌ Period to avoid: Mid-summer (high heat and insects) and winter (access sometimes difficult depending on snow).",
    ]),
    InfoSection('🎒', "Practical Tips", [
      "🌤️ Always check the weather before you leave.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "🥾 Walking: Bring good shoes for walking on the sandy trails around the formations.",
      "⚠️ Protection: Bring a hat and sun protection, shade is rare on the lake shores.",
    ]),
  ],
  warning:
  "Attention: Prices and access conditions to protected areas may change. Check for the latest local updates.",
);

class MonoLakePage extends StatelessWidget {
  final String title;
  const MonoLakePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: monoLakeDataEn, title: title, labels: DestinationLabels.en);
}