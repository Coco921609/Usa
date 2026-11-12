import 'package:flutter/material.dart';
import 'package:usa/est_detail_base.dart';

class NiagaraFallsPage extends StatelessWidget {
  final String title;
  final bool isFrench;

  const NiagaraFallsPage({
    super.key,
    required this.title,
    this.isFrench = false,
  });

  static const _accent = Color(0xFF8EC9E8);

  @override
  Widget build(BuildContext context) {
    return DetailPage(
      title: title,
      flags: '🇨🇦🇺🇸',
      heroImage: 'assets/images/108.jpg',
      accent: _accent,
      isFrench: isFrench,
      children: [
        const SizedBox(height: 8),
        DetailLead(
          accent: _accent,
          text:
          "Did you know: The phenomenal power of Niagara Falls finds a fascinating echo in the Iguazu Falls, between Brazil and Argentina 🇦🇷🇧🇷.",
        ),
        const DetailIntro(
          text:
          "Majestic and historic, Niagara Falls is a symbol of natural power. They have long captivated the collective imagination and attract millions of visitors every year. Purchasing tickets allows you to explore their splendor and understand their cultural importance.",
        ),

        const DetailSectionTitle(text: '📸 Location Overview'),
        DetailGallery(
          accent: _accent,
          images: const [
            'assets/images/107.webp',
            'assets/images/104.jpg',
            'assets/images/105.jpg',
            'assets/images/106.jpg',
            'assets/images/110.jpg',
          ],
        ),

        const DetailSectionTitle(text: "📍 What to see and do?"),
        const DetailSubheading(text: 'Iconic Falls'),
        DetailBullets(
          accent: _accent,
          items: const [
            "Horseshoe Falls: 51m U-shaped falls, the most impressive.",
            "American Falls: 260m wide, offering a beautiful panoramic view.",
            "Bridal Veil Falls: The smallest and most delicate of the three cascades.",
          ],
        ),
        const DetailSubheading(text: 'Immersive Experiences'),
        DetailBullets(
          accent: _accent,
          items: const [
            "Cruise (Maid of the Mist / Hornblower): Legendary immersion at the foot of the falls.",
            "Journey Behind the Falls: Historic tunnel beneath the Canadian cliff.",
            "Cave of the Winds: Walkways on Goat Island with its 'Hurricane Deck' zone.",
          ],
        ),
        const DetailSubheading(text: 'Viewpoints & Attractions'),
        DetailBullets(
          accent: _accent,
          items: const [
            "Towers: Skylon Tower (236m) and American Observation Tower (86m).",
            "Niagara's Fury (4D): Fun show about geological formation.",
            "White Water Walk: Trail along the most powerful rapids.",
            "Whirlpool Aero Car: Historic cable car over the whirlpools.",
          ],
        ),

        const DetailSectionTitle(text: '📜 History'),
        Text(
          "Born 12,000 years ago after the last ice age, the falls were a spiritual site for First Nations. Documented by Louis Hennepin in 1678, they became a major tourist icon after the creation of the first state park in 1885.",
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15,
            height: 1.75,
            color: DetailPalette.mist.withOpacity(0.78),
          ),
        ),

        const DetailSectionTitle(text: '🕒 Opening Hours and Last Admission'),
        const DetailTimetable(
          rows: [
            DetailRow('May 01 – June 30', '09:00 AM – 06:00 PM (Last admission: 05:00 PM)'),
            DetailRow('July 01 – Aug 31', '08:00 AM – 08:00 PM (Last admission: 07:00 PM)'),
            DetailRow('Sept 01 – Oct 31', '09:00 AM – 06:30 PM (Last admission: 05:30 PM)'),
            DetailRow('Nov 01 – Feb 28', '10:00 AM – 04:00 PM (Last admission: 03:00 PM)'),
            DetailRow('Mar 01 – April 30', '09:30 AM – 05:30 PM (Last admission: 04:30 PM)'),
          ],
        ),

        const DetailSectionTitle(text: '🚫 Closing Days'),
        const DetailTimetable(
          rows: [
            DetailRow('December 25', 'Christmas'),
            DetailRow('January 01', "New Year's Day"),
            DetailRow('March 15', 'Technical Inspection'),
          ],
        ),

        const DetailSectionTitle(text: '🎒 Practical Tips'),
        DetailTipList(
          accent: _accent,
          tips: const [
            DetailTip('🌤️', 'Always check the weather before you leave.'),
            DetailTip('💧', 'Bring plenty of water.'),
            DetailTip('📸', "Don't forget your camera!"),
            DetailTip('🧥', 'Bring waterproof clothing or use the ponchos provided.'),
            DetailTip('🎟️', 'Buy your tickets online to avoid waiting (approx. 90 dollars).'),
          ],
        ),

        const DetailNotice(
          text:
          'Attention: Prices and hours may change. Check for updates before your departure.',
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}