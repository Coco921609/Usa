import 'package:flutter/material.dart';
import 'package:usa/est_detail_base.dart';

class NiagaraFallsPage extends StatelessWidget {
  final String title;
  final bool isFrench;

  const NiagaraFallsPage({
    super.key,
    required this.title,
    this.isFrench = true,
  });

  static const _accent = Color(0xFF8EC9E8);

  @override
  Widget build(BuildContext context) {
    final fr = isFrench;

    return DetailPage(
      title: title,
      flags: '🇨🇦🇺🇸',
      heroImage: 'assets/images/108.jpg',
      accent: _accent,
      isFrench: fr,
      children: [
        const SizedBox(height: 8),
        DetailLead(
          accent: _accent,
          text: tr(
            fr,
            "Le saviez-vous : La puissance phénoménale des Chutes du Niagara trouve un écho fascinant du côté des Chutes d'Iguazu, entre le Brésil et l'Argentine 🇦🇷🇧🇷.",
            "Did you know: The phenomenal power of Niagara Falls finds a fascinating echo in the Iguazu Falls, between Brazil and Argentina 🇦🇷🇧🇷.",
          ),
        ),
        DetailIntro(
          text: tr(
            fr,
            "Majestueuses et historiques, les Chutes du Niagara sont un symbole de puissance naturelle. Elles ont longtemps captivé l'imaginaire collectif et attirent chaque année des millions de visiteurs. L'achat de billets permet d'explorer leur splendeur et d'en comprendre l'importance culturelle.",
            "Majestic and historic, Niagara Falls is a symbol of natural power. They have long captivated the collective imagination and attract millions of visitors every year. Purchasing tickets allows you to explore their splendor and understand their cultural importance.",
          ),
        ),

        DetailSectionTitle(
          text: tr(fr, '📸 Aperçu du lieu', '📸 Location Overview'),
        ),
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

        DetailSectionTitle(
          text: tr(fr, '📍 Que faire et voir ?', '📍 What to see and do?'),
        ),
        DetailSubheading(
          text: tr(fr, 'Les chutes emblématiques', 'Iconic Falls'),
        ),
        DetailBullets(
          accent: _accent,
          items: [
            tr(fr, "Horseshoe Falls : Chute en U de 51 m, la plus impressionnante.",
                "Horseshoe Falls: 51 m U-shaped falls, the most impressive."),
            tr(fr, "American Falls : 260 m de large, offrant un belvédère panoramique.",
                "American Falls: 260 m wide, offering a beautiful panoramic view."),
            tr(fr, "Bridal Veil Falls : La plus petite et délicate des trois cascades.",
                "Bridal Veil Falls: The smallest and most delicate of the three cascades."),
          ],
        ),
        DetailSubheading(
          text: tr(fr, 'Expériences immersives', 'Immersive Experiences'),
        ),
        DetailBullets(
          accent: _accent,
          items: [
            tr(fr, "Croisière (Maid of the Mist / Hornblower) : Immersion légendaire au pied des chutes.",
                "Cruise (Maid of the Mist / Hornblower): Legendary immersion at the foot of the falls."),
            tr(fr, "Journey Behind the Falls : Tunnel historique sous la falaise canadienne.",
                "Journey Behind the Falls: Historic tunnel beneath the Canadian cliff."),
            tr(fr, "Cave of the Winds : Passerelles sur Goat Island avec sa zone 'Hurricane Deck'.",
                "Cave of the Winds: Walkways on Goat Island with its 'Hurricane Deck' zone."),
          ],
        ),
        DetailSubheading(
          text: tr(fr, 'Points de vue & attractions', 'Viewpoints & Attractions'),
        ),
        DetailBullets(
          accent: _accent,
          items: [
            tr(fr, "Tours : Skylon Tower (236 m) et American Observation Tower (86 m).",
                "Towers: Skylon Tower (236 m) and American Observation Tower (86 m)."),
            tr(fr, "Niagara's Fury (4D) : Spectacle ludique sur la formation géologique.",
                "Niagara's Fury (4D): Fun show about the geological formation."),
            tr(fr, "White Water Walk : Sentier le long des rapides les plus puissants.",
                "White Water Walk: Trail along the most powerful rapids."),
            tr(fr, "Whirlpool Aero Car : Téléphérique historique au-dessus des tourbillons.",
                "Whirlpool Aero Car: Historic cable car over the whirlpools."),
          ],
        ),

        DetailSectionTitle(text: tr(fr, '📜 Histoire', '📜 History')),
        Text(
          tr(
            fr,
            "Nées il y a 12 000 ans après la dernière ère glaciaire, les chutes furent un lieu spirituel pour les Premières Nations. Documentées par Louis Hennepin en 1678, elles sont devenues une icône touristique majeure après la création du premier parc d'État en 1885.",
            "Born 12,000 years ago after the last ice age, the falls were a spiritual site for First Nations. Documented by Louis Hennepin in 1678, they became a major tourist icon after the creation of the first state park in 1885.",
          ),
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15,
            height: 1.75,
            color: DetailPalette.mist.withOpacity(0.78),
          ),
        ),

        DetailSectionTitle(
          text: tr(fr, '🕒 Horaires et dernières admissions', '🕒 Opening Hours and Last Admission'),
        ),
        DetailTimetable(
          rows: [
            DetailRow(
              tr(fr, '01 mai – 30 juin', 'May 01 – June 30'),
              tr(fr, '09h00 – 18h00 (dernière admission : 17h00)', '09:00 AM – 06:00 PM (last admission: 05:00 PM)'),
            ),
            DetailRow(
              tr(fr, '01 juil. – 31 août', 'July 01 – Aug 31'),
              tr(fr, '08h00 – 20h00 (dernière admission : 19h00)', '08:00 AM – 08:00 PM (last admission: 07:00 PM)'),
            ),
            DetailRow(
              tr(fr, '01 sept. – 31 oct.', 'Sept 01 – Oct 31'),
              tr(fr, '09h00 – 18h30 (dernière admission : 17h30)', '09:00 AM – 06:30 PM (last admission: 05:30 PM)'),
            ),
            DetailRow(
              tr(fr, '01 nov. – 28 fév.', 'Nov 01 – Feb 28'),
              tr(fr, '10h00 – 16h00 (dernière admission : 15h00)', '10:00 AM – 04:00 PM (last admission: 03:00 PM)'),
            ),
            DetailRow(
              tr(fr, '01 mars – 30 avr.', 'Mar 01 – April 30'),
              tr(fr, '09h30 – 17h30 (dernière admission : 16h30)', '09:30 AM – 05:30 PM (last admission: 04:30 PM)'),
            ),
          ],
        ),

        DetailSectionTitle(text: tr(fr, '🚫 Jours de fermeture', '🚫 Closing Days')),
        DetailTimetable(
          rows: [
            DetailRow(tr(fr, '25 décembre', 'December 25'), tr(fr, 'Noël', 'Christmas')),
            DetailRow(tr(fr, '01 janvier', 'January 01'), tr(fr, 'Nouvel an', "New Year's Day")),
            DetailRow(tr(fr, '15 mars', 'March 15'), tr(fr, 'Inspection technique', 'Technical Inspection')),
          ],
        ),

        DetailSectionTitle(text: tr(fr, '🎒 Conseils pratiques', '🎒 Practical Tips')),
        DetailTipList(
          accent: _accent,
          tips: [
            DetailTip('🌤️', tr(fr, "Vérifiez toujours la météo avant de partir.", "Always check the weather before you leave.")),
            DetailTip('💧', tr(fr, "Prévoyez d'importantes réserves d'eau.", "Bring plenty of water.")),
            DetailTip('📸', tr(fr, "N'oubliez pas votre appareil photo !", "Don't forget your camera!")),
            DetailTip('🧥', tr(fr, "Prévoyez un vêtement imperméable ou utilisez les ponchos fournis.", "Bring waterproof clothing or use the ponchos provided.")),
            DetailTip('🎟️', tr(fr, "Achetez vos billets en ligne pour éviter l'attente (environ 90 dollars).", "Buy your tickets online to avoid waiting (approx. 90 dollars).")),
          ],
        ),

        DetailNotice(
          text: tr(
            fr,
            "Attention : les prix et les horaires peuvent changer. Vérifiez les mises à jour avant votre départ.",
            "Attention: Prices and hours may change. Check for updates before your departure.",
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}