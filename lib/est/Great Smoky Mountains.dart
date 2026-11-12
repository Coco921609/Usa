import 'package:flutter/material.dart';
import 'package:usa/est_detail_base.dart';

class GreatSmokyMountainsPage extends StatelessWidget {
  final String title;
  final bool isFrench;

  const GreatSmokyMountainsPage({
    super.key,
    required this.title,
    this.isFrench = true,
  });

  static const _accent = Color(0xFF8BD3B0);

  @override
  Widget build(BuildContext context) {
    final fr = isFrench;

    return DetailPage(
      title: title,
      flags: '🇺🇸',
      heroImage: 'assets/images/114.jpg',
      accent: _accent,
      isFrench: fr,
      children: [
        const SizedBox(height: 8),
        DetailLead(
          accent: _accent,
          text: tr(
            fr,
            "Le saviez-vous : La biodiversité exceptionnelle des Smoky Mountains trouve un écho fascinant dans la Forêt de Daintree, en Australie 🇦🇺.",
            "Did you know: The exceptional biodiversity of the Smoky Mountains finds a fascinating echo in the Daintree Rainforest, Australia 🇦🇺.",
          ),
        ),
        DetailIntro(
          text: tr(
            fr,
            "Crête après crête de forêt chevauche la frontière entre la Caroline du Nord et le Tennessee. Mondialement reconnu pour sa diversité floristique et faunique, sa beauté antique et ses vestiges de la culture des Appalaches, c'est le parc national le plus visité d'Amérique.",
            "Ridge upon ridge of forest straddles the border between North Carolina and Tennessee. World-renowned for its diversity of plant and animal life, the beauty of its ancient mountains, and the remnants of Southern Appalachian mountain culture, it is America's most visited national park.",
          ),
        ),

        DetailSectionTitle(
          text: tr(fr, '📸 Aperçu du lieu', '📸 Location Overview'),
        ),
        DetailGallery(
          accent: _accent,
          images: const [
            'assets/images/112.jpg',
            'assets/images/114.webp',
            'assets/images/115.webp',
            'assets/images/116.webp',
          ],
        ),

        DetailSectionTitle(
          text: tr(fr, '🌅 Horaires recommandés', '🌅 Recommended Times'),
        ),
        DetailTipList(
          accent: _accent,
          tips: [
            DetailTip('🌅', tr(fr, "Lever / coucher du soleil : Clingmans Dome et Newfound Gap offrent des panoramas inoubliables.", "Sunrise / sunset: Clingmans Dome and Newfound Gap offer unforgettable panoramas.")),
            DetailTip('👥', tr(fr, "Éviter la foule : arrivez très tôt le matin (avant 8 h) ou privilégiez les sentiers secondaires pour éviter la foule de Cades Cove.", "Avoid crowds: arrive very early in the morning (before 8 AM) or choose secondary trails to avoid the Cades Cove rush.")),
          ],
        ),

        DetailSectionTitle(
          text: tr(fr, '🗓️ Saisons', '🗓️ Seasons'),
        ),
        DetailSeasons(
          goodLabel: tr(fr, 'Recommandé', 'Recommended'),
          goodText: tr(fr, "Automne (octobre) pour les couleurs flamboyantes, ou printemps pour la floraison.", "Autumn (October) for vibrant colors, or spring for wildflowers."),
          badLabel: tr(fr, 'À éviter', 'Avoid'),
          badText: tr(fr, "Les week-ends d'octobre (très forte affluence) et les mois d'hiver rigoureux pour les routes en altitude.", "October weekends (very high traffic) and harsh winter months for high-altitude roads."),
        ),

        DetailSectionTitle(text: tr(fr, '🎒 Conseils pratiques', '🎒 Practical Tips')),
        DetailTipList(
          accent: _accent,
          tips: [
            DetailTip('🌤️', tr(fr, "Vérifiez toujours la météo avant de partir.", "Always check the weather before heading out.")),
            DetailTip('💧', tr(fr, "Prévoyez d'importantes réserves d'eau.", "Bring plenty of water.")),
            DetailTip('📸', tr(fr, "N'oubliez pas votre appareil photo !", "Don't forget your camera!")),
            DetailTip('⚠️', tr(fr, "Sécurité : soyez attentifs aux ours noirs lors de vos randonnées.", "Safety: be aware of black bears during your hikes.")),
            DetailTip('🚗', tr(fr, "Logistique : certaines routes peuvent fermer sans préavis en hiver.", "Logistics: some roads may close without notice in winter.")),
          ],
        ),

        DetailNotice(
          text: tr(
            fr,
            "Attention : les tarifs d'accès (comme le parking tag) et les conditions de visite peuvent évoluer. Vérifiez les mises à jour avant votre départ.",
            "Attention: Access fees (such as the parking tag) and visitation conditions may change. Check for updates before your trip.",
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}