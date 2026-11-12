import 'package:flutter/material.dart';
import 'package:usa/est_detail_base.dart';

class ShenandoahParkPage extends StatelessWidget {
  final String title;
  final bool isFrench;

  const ShenandoahParkPage({
    super.key,
    required this.title,
    this.isFrench = true,
  });

  static const _accent = Color(0xFFC2DE8A);

  @override
  Widget build(BuildContext context) {
    final fr = isFrench;

    return DetailPage(
      title: title,
      flags: '🇺🇸',
      heroImage: 'assets/images/121.jpg',
      accent: _accent,
      isFrench: fr,
      children: [
        const SizedBox(height: 8),
        DetailLead(
          accent: _accent,
          text: tr(
            fr,
            "Le saviez-vous : La biodiversité luxuriante de Shenandoah trouve un cousin fascinant du côté du Parc national des Cévennes, en France 🇫🇷.",
            "Did you know: The lush biodiversity of Shenandoah finds a fascinating cousin in the Cévennes National Park, France 🇫🇷.",
          ),
        ),
        DetailIntro(
          text: tr(
            fr,
            "À seulement 75 miles de Washington DC, le parc de Shenandoah est un terrain débordant de cascades, de panoramas spectaculaires et de champs de fleurs. Refuge pour les cerfs et l'ours noir, c'est une oasis de paix protégée.",
            "Just 75 miles from Washington DC, Shenandoah National Park is a landscape overflowing with cascades, spectacular vistas, and wildflower fields. A refuge for deer and black bears, it is a protected oasis of peace.",
          ),
        ),

        DetailSectionTitle(
          text: tr(fr, '📸 Aperçu du lieu', '📸 Location Overview'),
        ),
        DetailGallery(
          accent: _accent,
          images: const [
            'assets/images/118.jpg',
            'assets/images/119.jpg',
            'assets/images/120.jpg',
          ],
        ),

        DetailSectionTitle(
          text: tr(fr, '🌅 Horaires recommandés', '🌅 Recommended Times'),
        ),
        DetailTipList(
          accent: _accent,
          tips: [
            DetailTip('🌅', tr(fr, "Lever / coucher du soleil : la Skyline Drive offre des points de vue uniques sur la vallée de Shenandoah.", "Sunrise / sunset: Skyline Drive offers unique viewpoints over the Shenandoah Valley.")),
            DetailTip('👥', tr(fr, "Éviter la foule : visitez en semaine pour profiter des sentiers de randonnée sans la foule des week-ends.", "Avoid crowds: visit on weekdays to enjoy the hiking trails without weekend crowds.")),
          ],
        ),

        DetailSectionTitle(
          text: tr(fr, '🗓️ Saisons', '🗓️ Seasons'),
        ),
        DetailSeasons(
          goodLabel: tr(fr, 'Recommandé', 'Recommended'),
          goodText: tr(fr, "Automne (feuillages d'or) et printemps (fleurs sauvages).", "Autumn (golden foliage) and spring (wildflowers)."),
          badLabel: tr(fr, 'À éviter', 'Avoid'),
          badText: tr(fr, "Les fins de semaine d'octobre (très forte affluence sur la Skyline Drive).", "October weekends (very high traffic on Skyline Drive)."),
        ),

        DetailSectionTitle(text: tr(fr, '🎒 Conseils pratiques', '🎒 Practical Tips')),
        DetailTipList(
          accent: _accent,
          tips: [
            DetailTip('🌤️', tr(fr, "Vérifiez toujours la météo avant de partir.", "Always check the weather before you leave.")),
            DetailTip('💧', tr(fr, "Prévoyez d'importantes réserves d'eau.", "Bring plenty of water.")),
            DetailTip('📸', tr(fr, "N'oubliez pas votre appareil photo !", "Don't forget your camera!")),
            DetailTip('🚗', tr(fr, "Logistique : la Skyline Drive est l'axe principal ; prévoyez du temps pour les arrêts photo.", "Logistics: Skyline Drive is the main road; plan time for photo stops.")),
            DetailTip('⚠️', tr(fr, "Faune : restez à distance des ours noirs et ne nourrissez jamais les animaux.", "Wildlife: stay at a distance from black bears and never feed the animals.")),
          ],
        ),

        DetailNotice(
          text: tr(
            fr,
            "Attention : les tarifs d'entrée au parc et les conditions de circulation sur la Skyline Drive peuvent changer. Vérifiez les mises à jour officielles.",
            "Attention: Park entrance fees and traffic conditions on Skyline Drive may change. Check for official updates.",
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}