import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData antelopeCanyonDataEn = DestinationData(
  id: 'antelope-canyon',
  name: "Antelope Canyon",
  emoji: '🏜️',
  accent: const Color(0xFFFF8A4C),
  cover: 'assets/images/57.webp',
  gallery: const [
    'assets/images/51.jpg',
    'assets/images/52.jpg',
    'assets/images/54.webp',
    'assets/images/55.jpg',
    'assets/images/56.jpg',
  ],
  didYouKnow:
  "The fascinating beauty of Antelope Canyon finds a spectacular echo in the Siq Gorges of Petra, Jordan 🇯🇴.",
  intro:
  "A masterpiece sculpted by water and wind, Antelope Canyon is a sacred site located on Navajo lands. Its undulating walls and changing colors offer one of the most photographed natural spectacles in the world.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'Off-season (November to February)'),
    QuickFact('🎟️', 'Booking', 'Several weeks in advance'),
    QuickFact('🕒', 'Visit duration', '1h15 to 2h depending on the canyon'),
  ],
  sections: const [
    InfoSection('🕒', "Visit Schedules and Durations", [
      "Upper Antelope Canyon: 8 AM-6 PM (Apr-Sep), 9 AM-4 PM (Oct-Mar). Duration: 1h30 to 2h.",
      "Lower Antelope Canyon: 7:45 AM-4:15 PM. Duration: 1h15.",
      "Canyon X and others: Departures between 7:30 AM and 8 AM. Duration: approx. 2h.",
      "Secret Antelope Canyon: Duration approx. 3h30 (including Horseshoe Bend).",
      "For multiple canyons in the same day: allow 6 to 8 hours.",
    ]),
    InfoSection('🌅', "Recommended Times (Light & Calm)", [
      "📸 For light beams: March to October, between 10 AM and 1 PM (solar zenith).",
      "🌅 Sunrise / Sunset: Ideal for soft hues and a magical atmosphere.",
      "👥 Avoiding crowds: Prioritize early morning or late afternoon visits.",
    ]),
    InfoSection('🗓️', "Seasons: Recommendations", [
      "✅ Recommended season: Off-season (November to February) to avoid crowds.",
      "❌ Period to avoid: Peak season (May to September) with temperatures up to 37°C.",
    ]),
    InfoSection('🎒', "Practical Tips & Regulations", [
      "🌤️ Always check the weather before leaving.",
      "💧 Bring plenty of water supplies.",
      "📸 Don't forget your camera!",
      "👣 Guided tour: Mandatory with a licensed Navajo guide.",
      "🎟️ Booking: Essential several weeks in advance.",
      "⏰ Arrival: 45 min before your slot for the briefing.",
      "👕 Equipment: Closed-toe shoes, sun/sand protection.",
      "⚠️ Restrictions: Bags, tripods, and selfie sticks are prohibited.",
    ]),
  ],
  warning:
  "Attention: Schedules and rates may change throughout the year. Check for updates before booking.",
  note:
  "Note: Antelope Canyon is a protected and sacred site. Please respect your Navajo guides' instructions.",
);

class AntelopeCanyonPage extends StatelessWidget {
  final String title;
  const AntelopeCanyonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: antelopeCanyonDataEn, title: title, labels: DestinationLabels.en);
}