import 'package:flutter/material.dart';
import 'package:usa/est_detail_base.dart';

class VoyageursNationalParkPage extends StatelessWidget {
  final String title;
  final bool isFrench;

  const VoyageursNationalParkPage({
    super.key,
    required this.title,
    this.isFrench = false,
  });

  static const _accent = Color(0xFF7DD0D0);

  @override
  Widget build(BuildContext context) {
    return DetailPage(
      title: title,
      flags: '🇺🇸',
      heroImage: 'assets/images/126.webp',
      accent: _accent,
      isFrench: isFrench,
      children: [
        const SizedBox(height: 8),
        DetailLead(
          accent: _accent,
          text:
          "Did you know: The infinite water network of Voyageurs National Park finds a fascinating echo in the Saimaa Lake District, Finland 🇫🇮.",
        ),
        const DetailIntro(
          text:
          "Located in northern Minnesota, this park protects thousands of acres of lakes, forests, and streams. Founded in 1975, it honors the French-Canadian explorers who once navigated these waters, which are rich in history and natural beauty.",
        ),

        const DetailSectionTitle(text: '📸 Location Overview'),
        DetailGallery(
          accent: _accent,
          images: const [
            'assets/images/123.jpg',
            'assets/images/124.jpg',
            'assets/images/125.jpg',
            'assets/images/127.jpg',
            'assets/images/129.jpg',
          ],
        ),

        const DetailSectionTitle(text: '🌅 Recommended Times (Light & Calm)'),
        DetailTipList(
          accent: _accent,
          tips: const [
            DetailTip('🌅', 'Sunrise / Sunset: A prime time to observe the reflections on the vast expanses of water.'),
            DetailTip('👥', 'Avoiding crowds: Prioritize weekday mornings for a peaceful exploration by kayak or boat.'),
          ],
        ),

        const DetailSectionTitle(text: '🗓️ Seasons and Advice'),
        const DetailSeasons(
          goodLabel: 'Recommended',
          goodText: 'Summer (July-August) to enjoy all water-based activities.',
          badLabel: 'Avoid',
          badText: 'Spring (high mosquito activity) and harsh winter months (difficult access).',
        ),

        const DetailSectionTitle(text: '🎒 Practical Tips'),
        DetailTipList(
          accent: _accent,
          tips: const [
            DetailTip('🌤️', 'Always check the weather before you leave.'),
            DetailTip('💧', 'Bring plenty of water supplies.'),
            DetailTip('📸', "Don't forget your camera!"),
            DetailTip('🛶', 'Activities: Canoe rental is essential to explore the accessible islands.'),
            DetailTip('⚠️', 'Protection: Bring a good insect repellent.'),
          ],
        ),

        const DetailNotice(
          text:
          'Attention: Access fees, boat rentals, and navigation conditions may vary. Check for the latest local updates.',
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}