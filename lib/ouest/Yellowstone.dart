import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class YellowstonePage extends StatelessWidget {
  final String title;

  const YellowstonePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121418),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bouton retour + Titre
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontFamily: 'Montserrat', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              // Photo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/20.webp', fit: BoxFit.fitWidth, width: double.infinity),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Le saviez-vous : Les phénomènes géothermiques de Yellowstone trouvent un cousin fascinant du côté des geysers de Geysir, en Islande 🇮🇸.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🌋 Parc National de Yellowstone 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Inauguré en 1872, Yellowstone demeure le premier parc national jamais créé au monde. Avec sa superficie de 9 000 km² et son altitude moyenne de 2 400 m, ce plateau repose sur une immense caldeira abritant un supervolcan toujours actif. Sous cette terre bouillonnante, où se concentrent deux tiers des geysers de la planète, se déploie une nature sauvage et imprévisible.",
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),
                    const SizedBox(height: 15),
                    _buildBulletPoint("Old Faithful : Le geyser légendaire, attraction incontournable attirant chaque été des millions de visiteurs."),
                    _buildBulletPoint("Grand Prismatic Spring : Plus grande source chaude des États-Unis et l'une des plus vastes au monde, il offre un spectacle chromatique irréel."),
                    _buildBulletPoint("Grand Canyon de Yellowstone : Un site aux parois jaunes spectaculaires, façonné par une rivière tumultueuse."),
                    _buildBulletPoint("Lac de Yellowstone : Le plus vaste lac de montagne d'Amérique du Nord, offrant un panorama grandiose."),

                    const SizedBox(height: 25),
                    _buildSectionTitle('📸 Aperçu du lieu'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/27.webp'),
                          _buildGalleryImage('assets/images/23.jpg'),
                          _buildGalleryImage('assets/images/24.jpg'),
                          _buildGalleryImage('assets/images/25.jpg'),
                          _buildGalleryImage('assets/images/26.jpg'),
                          _buildGalleryImage('assets/images/26.jpg'),
                          _buildGalleryImage('assets/images/29.jpg'),
                          _buildGalleryImage('assets/images/30.webp'),
                          _buildGalleryImage('assets/images/31.jpg'),
                          _buildGalleryImage('assets/images/34.webp'),
                          _buildGalleryImage('assets/images/40.webp'),
                          _buildGalleryImage('assets/images/38.webp'),
                          _buildGalleryImage('assets/images/35.jpg'),
                          _buildGalleryImage('assets/images/41.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗺️ Les 7 grands secteurs"),
                    const SizedBox(height: 15),
                    _buildSectorText("Sud-ouest : Concentration géothermique majeure (Grand Prismatic, Old Faithful)."),
                    _buildSectorText("Madison : Zone privilégiée pour observer la faune sauvage."),
                    _buildSectorText("Norris : Porcelain et Back Basin, réputés pour leurs sources aux couleurs fascinantes."),
                    _buildSectorText("Mammoth Hot Springs : Terrasses calcaires aux formes insolites."),
                    _buildSectorText("Tower Roosevelt : Paysages forestiers verdoyants et accès à la Lamar Valley."),
                    _buildSectorText("Canyon Village : Grand Canyon de la Yellowstone River et ses cascades impressionnantes."),
                    _buildSectorText("Sud-est : Parfait pour la randonnée et la pêche (Lake Yellowstone, West Thumb)."),

                    // Focus Grand Prismatic
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Le saviez-vous : La beauté fascinante du Grand Prismatic trouve un écho spectaculaire dans la piscine de Wai-O-Tapu, en Nouvelle-Zélande 🇳🇿.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    _buildSectionTitle("🕒 Horaires et Fréquentation (Grand Prismatic)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Horaires recommandés : Privilégiez le milieu de journée pour une visibilité optimale des couleurs grâce à la lumière verticale qui dissipe la vapeur."),
                    _buildBulletPoint("👥 Évitement : Arrivez très tôt le matin ou en toute fin d'après-midi pour éviter les parkings saturés en haute saison."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils (Grand Prismatic)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : L'été, pour profiter des couleurs éclatantes sous un ciel dégagé."),
                    _buildBulletPoint("❌ Période à éviter : Les journées très froides ou humides, où la vapeur masque quasiment tout le bassin."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📍 Pourquoi choisir une excursion ?"),
                    const SizedBox(height: 10),
                    _buildSectorText("Accès simplifié, transport organisé et conseils photo exclusifs."),
                    _buildSectorText("Gain de temps précieux pour combiner le site avec d'autres geysers ou observer la faune locale."),

                    // Tarifs et Pass
                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Tarifs et Pass acceptés"),
                    const SizedBox(height: 10),
                    const Text("Été : 35 dollars par véhicule. Hiver : 30 dollars par véhicule.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const SizedBox(height: 10),
                    _buildSectorText("America the Beautiful Pass (Parcs nationaux)"),
                    _buildSectorText("Pass Sénior"),
                    _buildSectorText("Pass militaire"),
                    _buildSectorText("Pass gratuit pour les élèves de 4e année (USA)"),

                    // Horaires et Saisons généraux
                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Fréquentation"),
                    const SizedBox(height: 10),
                    const Text("Ouvert 24h/24 toute l'année, avec des services variables selon la saison.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const SizedBox(height: 25),
                    _buildBulletPoint("🌅 Horaires recommandés : Privilégiez l'aube et le crépuscule pour la lumière et l'observation de la faune."),
                    _buildBulletPoint("👥 Évitement : Visitez les sites majeurs avant 9h00 ou après 18h00 pour éviter les foules."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Affluence"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Septembre (tranquillité) ou mi-juin à fin août (accès complet)."),
                    _buildBulletPoint("❌ Période à éviter : Juillet et août (pics d'affluence et saturation des parkings)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Informations Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("⚠️ Sécurité : Restez sur les sentiers ; l'eau hydrothermale peut causer des brûlures graves."),
                    _buildBulletPoint("👣 Respect : Ne courez pas et ne touchez jamais les tapis hydrothermaux fragiles."),

                    const SizedBox(height: 20),
                    const Text(
                      "Note : Le site est inclus dans votre droit d'entrée au parc national de Yellowstone.",
                      style: TextStyle(color: Colors.white70, fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGalleryImage(String path) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(path, width: 280, height: 220, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: bleuMer));
  }

  Widget _buildSectorText(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 6.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }

  Widget _buildBulletPoint(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }
}