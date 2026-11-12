import 'package:flutter/material.dart';
import 'package:usa/est_detail_base.dart';

class VoyageursNationalParkPage extends StatelessWidget {
  final String title;
  final bool isFrench;

  const VoyageursNationalParkPage({
    super.key,
    required this.title,
    this.isFrench = true,
  });

  static const _accent = Color(0xFF7DD0D0);

  @override
  Widget build(BuildContext context) {
    final fr = isFrench;

    return DetailPage(
      title: title,
      flags: '🇺🇸',
      heroImage: 'assets/images/126.webp',
      accent: _accent,
      isFrench: fr,
      children: [
        const SizedBox(height: 8),
        DetailLead(
          accent: _accent,
          text: tr(
            fr,
            "Le saviez-vous : Le réseau aquatique infini du parc national des Voyageurs trouve un écho fascinant dans la région des lacs de Saimaa, en Finlande 🇫🇮.",
            "Did you know: The infinite water network of Voyageurs National Park finds a fascinating echo in the Saimaa Lake District, Finland 🇫🇮.",
          ),
        ),
        DetailIntro(
          text: tr(
            fr,
            "Situé dans le nord du Minnesota, ce parc protège des milliers d'acres de lacs, forêts et ruisseaux. Fondé en 1975, il rend hommage aux explorateurs franco-canadiens qui naviguaient autrefois dans ces eaux riches en histoire et en beauté naturelle.",
            "Located in northern Minnesota, this park protects thousands of acres of lakes, forests, and streams. Founded in 1975, it honors the French-Canadian explorers who once navigated these waters, rich in history and natural beauty.",
          ),
        ),

        DetailSectionTitle(
          text: tr(fr, '📸 Aperçu du lieu', '📸 Location Overview'),
        ),
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

        DetailSectionTitle(
          text: tr(fr, '🌅 Horaires recommandés', '🌅 Recommended Times'),
        ),
        DetailTipList(
          accent: _accent,
          tips: [
            DetailTip('🌅', tr(fr, "Lever / coucher du soleil : moment privilégié pour observer les reflets sur les vastes étendues d'eau.", "Sunrise / sunset: a prime time to observe the reflections on the vast expanses of water.")),
            DetailTip('👥', tr(fr, "Éviter la foule : privilégiez les matinées en semaine pour une exploration paisible en kayak ou en bateau.", "Avoid crowds: prioritize weekday mornings for a peaceful exploration by kayak or boat.")),
          ],
        ),

        DetailSectionTitle(
          text: tr(fr, '🗓️ Saisons', '🗓️ Seasons'),
        ),
        DetailSeasons(
          goodLabel: tr(fr, 'Recommandé', 'Recommended'),
          goodText: tr(fr, "Été (juillet-août) pour profiter de toutes les activités nautiques.", "Summer (July–August) to enjoy all water-based activities."),
          badLabel: tr(fr, 'À éviter', 'Avoid'),
          badText: tr(fr, "Le printemps (saison des moustiques très active) et les mois d'hiver rigoureux (accès complexe).", "Spring (high mosquito activity) and harsh winter months (difficult access)."),
        ),

        DetailSectionTitle(text: tr(fr, '🎒 Conseils pratiques', '🎒 Practical Tips')),
        DetailTipList(
          accent: _accent,
          tips: [
            DetailTip('🌤️', tr(fr, "Vérifiez toujours la météo avant de partir.", "Always check the weather before you leave.")),
            DetailTip('💧', tr(fr, "Prévoyez d'importantes réserves d'eau.", "Bring plenty of water.")),
            DetailTip('📸', tr(fr, "N'oubliez pas votre appareil photo !", "Don't forget your camera!")),
            DetailTip('🛶', tr(fr, "Activités : la location de canoë est indispensable pour explorer les îles accessibles.", "Activities: canoe rental is essential to explore the accessible islands.")),
            DetailTip('⚠️', tr(fr, "Protection : prévoyez un bon répulsif contre les insectes.", "Protection: bring a good insect repellent.")),
          ],
        ),

        DetailNotice(
          text: tr(
            fr,
            "Attention : les tarifs d'accès, les locations de bateaux et les conditions de navigation peuvent varier. Vérifiez les dernières mises à jour locales.",
            "Attention: Access fees, boat rentals, and navigation conditions may vary. Check for the latest local updates.",
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}