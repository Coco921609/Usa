import 'package:flutter/material.dart';
import '../destination_template.dart';

final DestinationData yellowstoneDataEn = DestinationData(
  id: 'yellowstone',
  name: "Yellowstone National Park",
  emoji: '🌋',
  accent: const Color(0xFF7BE0A0),
  cover: 'assets/images/20.webp',
  gallery: const [
    'assets/images/27.webp',
    'assets/images/23.jpg',
    'assets/images/24.jpg',
    'assets/images/25.jpg',
    'assets/images/26.jpg',
    'assets/images/29.jpg',
    'assets/images/30.webp',
    'assets/images/31.jpg',
    'assets/images/34.webp',
    'assets/images/40.webp',
    'assets/images/38.webp',
    'assets/images/35.jpg',
    'assets/images/41.jpg',
  ],
  didYouKnow:
  "The geothermal phenomena of Yellowstone find a fascinating cousin in the geysers of Geysir, in Iceland 🇮🇸.",
  intro:
  "Inaugurated in 1872, Yellowstone remains the first national park ever created in the world. With an area of 9,000 km² and an average altitude of 2,400 m, this plateau rests on an immense caldera housing a still-active supervolcano. Beneath this bubbling land, where two-thirds of the planet's geysers are concentrated, lies a wild and unpredictable nature.",
  facts: const [
    QuickFact('🗓️', 'Recommended season', 'September, or mid-June to late August'),
    QuickFact('💰', 'Entrance (summer)', '35 dollars per vehicle'),
    QuickFact('🕒', 'Opening', '24/7 all year'),
  ],
  sections: const [
    InfoSection('⭐', "Must-sees", [
      "Old Faithful: The legendary geyser, a must-see attraction that draws millions of visitors every summer.",
      "Grand Prismatic Spring: The largest hot spring in the United States and one of the largest in the world, it offers an unreal chromatic spectacle.",
      "Grand Canyon of the Yellowstone: A site with spectacular yellow walls, carved by a tumultuous river.",
      "Yellowstone Lake: The largest mountain lake in North America, offering a magnificent panorama.",
    ]),
    InfoSection('🗺️', "The 7 Major Sectors", [
      "Southwest: Major geothermal concentration (Grand Prismatic, Old Faithful).",
      "Madison: Prime area for wildlife viewing.",
      "Norris: Porcelain and Back Basin, famous for their fascinatingly colored springs.",
      "Mammoth Hot Springs: Limestone terraces with unusual shapes.",
      "Tower Roosevelt: Lush forest landscapes and access to Lamar Valley.",
      "Canyon Village: Grand Canyon of the Yellowstone River and its impressive waterfalls.",
      "Southeast: Perfect for hiking and fishing (Yellowstone Lake, West Thumb).",
    ]),
    InfoSection('💡', "Did you know? Grand Prismatic", [
      "The fascinating beauty of Grand Prismatic finds a spectacular echo in the Wai-O-Tapu pool, in New Zealand 🇳🇿.",
    ], kind: SectionKind.text),
    InfoSection('🕒', "Grand Prismatic: Hours and Crowds", [
      "🌅 Recommended times: Prioritize midday for optimal visibility of colors thanks to vertical light that dissipates the steam.",
      "👥 Avoiding crowds: Arrive very early in the morning or very late in the afternoon to avoid saturated parking lots in high season.",
    ]),
    InfoSection('🗓️', "Grand Prismatic: Seasons and Advice", [
      "✅ Recommended season: Summer, to enjoy the vibrant colors under a clear sky.",
      "❌ Period to avoid: Very cold or humid days, when the steam masks almost the entire basin.",
    ]),
    InfoSection('📍', "Why choose an excursion?", [
      "Simplified access, organized transport, and exclusive photo tips.",
      "Valuable time saved to combine the site with other geysers or observe local wildlife.",
    ]),
    InfoSection('💰', "Fees", [
      "Summer (per vehicle)|35 dollars",
      "Winter (per vehicle)|30 dollars",
    ], kind: SectionKind.prices),
    InfoSection('🎫', "Accepted Passes", [
      "America the Beautiful Pass (National Parks)",
      "Senior Pass",
      "Military Pass",
      "Free 4th Grade Pass (USA)",
    ]),
    InfoSection('🕒', "Hours and Crowds", [
      "Open 24/7 all year, with services varying by season.",
      "🌅 Recommended times: Prioritize dawn and dusk for light and wildlife observation.",
      "👥 Avoiding crowds: Visit major sites before 9:00 AM or after 6:00 PM to avoid crowds.",
    ]),
    InfoSection('🗓️', "Seasons and Crowds", [
      "✅ Recommended season: September (tranquility) or mid-June to late August (full access).",
      "❌ Period to avoid: July and August (peak attendance and saturated parking).",
    ]),
    InfoSection('🎒', "Practical Information", [
      "🌤️ Always check the weather before you leave.",
      "💧 Bring large water supplies.",
      "📸 Don't forget your camera!",
      "⚠️ Safety: Stay on the trails; hydrothermal water can cause severe burns.",
      "👣 Respect: Do not run and never touch fragile hydrothermal mats.",
    ]),
  ],
  note:
  "Note: The site is included in your Yellowstone National Park entrance fee.",
);

class YellowstonePage extends StatelessWidget {
  final String title;
  const YellowstonePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => DestinationPage(
      data: yellowstoneDataEn, title: title, labels: DestinationLabels.en);
}