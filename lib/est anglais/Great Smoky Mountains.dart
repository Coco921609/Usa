import 'package:flutter/material.dart';
import 'package:usa/est_detail_base.dart';

class GreatSmokyMountainsPage extends StatelessWidget {
  final String title;
  final bool isFrench;

  const GreatSmokyMountainsPage({
    super.key,
    required this.title,
    this.isFrench = false,
  });

  static const _accent = Color(0xFF8BD3B0);

  @override
  Widget build(BuildContext context) {
    return DetailPage(
      title: title,
      flags: '🇺🇸',
      heroImage: 'assets/images/114.jpg',
      accent: _accent,
      isFrench: isFrench,
      children: [
        const SizedBox(height: 8),
        DetailLead(
          accent: _accent,
          text:
          "Did you know: The exceptional biodiversity of the Smoky Mountains finds a fascinating echo in the Daintree Rainforest, Australia 🇦🇺.",
        ),
        const DetailIntro(
          text:
          "Ridge upon ridge of forest straddles the border between North Carolina and Tennessee. World-renowned for its diversity of plant and animal life, the beauty of its ancient mountains, and the quality of its Southern Appalachian mountain culture remnants, it is America's most visited national park.",
        ),

        const DetailSectionTitle(text: '📸 Location Overview'),
        DetailGallery(
          accent: _accent,
          images: const [
            'assets/images/112.jpg',
            'assets/images/114.webp',
            'assets/images/115.webp',
            'assets/images/116.webp',
          ],
        ),

        const DetailSectionTitle(text: '🌅 Recommended Times (Light & Calm)'),
        DetailTipList(
          accent: _accent,
          tips: const [
            DetailTip('🌅', 'Sunrise / Sunset: Clingmans Dome and Newfound Gap offer unforgettable panoramas.'),
            DetailTip('👥', 'Avoiding crowds: Arrive very early in the morning (before 8 AM) or choose secondary trails to avoid the Cades Cove rush.'),
          ],
        ),

        const DetailSectionTitle(text: '🗓️ Seasons and Advice'),
        const DetailSeasons(
          goodLabel: 'Recommended',
          goodText: 'Autumn (October) for vibrant colors or spring for wildflowers.',
          badLabel: 'Avoid',
          badText: 'October weekends (very high traffic) and harsh winter months for high-altitude roads.',
        ),

        const DetailSectionTitle(text: '🎒 Practical Tips'),
        DetailTipList(
          accent: _accent,
          tips: const [
            DetailTip('🌤️', 'Always check the weather before heading out.'),
            DetailTip('💧', 'Bring plenty of water supplies.'),
            DetailTip('📸', "Don't forget your camera!"),
            DetailTip('⚠️', 'Safety: Be aware of black bears during your hikes.'),
            DetailTip('🚗', 'Logistics: Some roads may close without notice during winter.'),
          ],
        ),

        const DetailNotice(
          text:
          'Attention: Access fees (such as the parking tag) and visitation conditions may change. Check for updates before your trip.',
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}