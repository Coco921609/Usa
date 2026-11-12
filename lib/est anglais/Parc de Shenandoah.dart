import 'package:flutter/material.dart';
import 'package:usa/est_detail_base.dart';

class ShenandoahParkPage extends StatelessWidget {
  final String title;
  final bool isFrench;

  const ShenandoahParkPage({
    super.key,
    required this.title,
    this.isFrench = false,
  });

  static const _accent = Color(0xFFC2DE8A);

  @override
  Widget build(BuildContext context) {
    return DetailPage(
      title: title,
      flags: '🇺🇸',
      heroImage: 'assets/images/121.jpg',
      accent: _accent,
      isFrench: isFrench,
      children: [
        const SizedBox(height: 8),
        DetailLead(
          accent: _accent,
          text:
          "Did you know: The lush biodiversity of Shenandoah finds a fascinating cousin in the Cévennes National Park, France 🇫🇷.",
        ),
        const DetailIntro(
          text:
          "Just 75 miles from Washington DC, Shenandoah National Park is a landscape overflowing with cascades, spectacular vistas, and wildflower fields. A refuge for deer and black bears, it is a protected oasis of peace.",
        ),

        const DetailSectionTitle(text: '📸 Location Overview'),
        DetailGallery(
          accent: _accent,
          images: const [
            'assets/images/118.jpg',
            'assets/images/119.jpg',
            'assets/images/120.jpg',
          ],
        ),

        const DetailSectionTitle(text: '🌅 Recommended Times (Light & Calm)'),
        DetailTipList(
          accent: _accent,
          tips: const [
            DetailTip('🌅', 'Sunrise / Sunset: Skyline Drive offers unique viewpoints over the Shenandoah Valley.'),
            DetailTip('👥', 'Avoiding crowds: Visit on weekdays to enjoy the hiking trails without weekend crowds.'),
          ],
        ),

        const DetailSectionTitle(text: '🗓️ Seasons and Advice'),
        const DetailSeasons(
          goodLabel: 'Recommended',
          goodText: 'Autumn (golden foliage) and spring (wildflowers).',
          badLabel: 'Avoid',
          badText: 'October weekends (very high traffic on Skyline Drive).',
        ),

        const DetailSectionTitle(text: '🎒 Practical Tips'),
        DetailTipList(
          accent: _accent,
          tips: const [
            DetailTip('🌤️', 'Always check the weather before you leave.'),
            DetailTip('💧', 'Bring plenty of water supplies.'),
            DetailTip('📸', "Don't forget your camera!"),
            DetailTip('🚗', 'Logistics: Skyline Drive is the main axis; plan time for photo stops.'),
            DetailTip('⚠️', 'Wildlife: Stay at a distance from black bears and never feed the animals.'),
          ],
        ),

        const DetailNotice(
          text:
          'Attention: Park entrance fees and traffic conditions on Skyline Drive may change. Check for official updates.',
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}