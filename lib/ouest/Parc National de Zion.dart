import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class ZionParkPage extends StatelessWidget {
  final String title;

  const ZionParkPage({super.key, required this.title});

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

              // Photo principale
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/86.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : La beauté vertigineuse de Zion trouve un cousin fascinant du côté des Montagnes de Zhangjiajie, en Chine 🇨🇳.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🧗 Parc National de Zion 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Suivez les sentiers parcourus depuis des millénaires. Regardez d’immenses falaises de grès crème, rose et rouge s’élever dans un ciel bleu éclatant. Découvrez les hautes parois étirées d'un canyon étroit où vous pourrez marcher les pieds dans l'eau (The Narrows).",
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle('📸 Aperçu du lieu'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/84.webp'),
                          _buildGalleryImage('assets/images/85.webp'),
                          _buildGalleryImage('assets/images/87.jpg'),
                          _buildGalleryImage('assets/images/88.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Fréquentation"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Horaires recommandés : Tôt le matin (avant 8h) ou en fin d'après-midi pour les lumières les plus douces."),
                    _buildBulletPoint("👥 Évitement : Le parc est très fréquenté ; visitez les sites majeurs en dehors des périodes de pointe pour plus de sérénité."),
                    const Text("Ouvert 24h/24, 365 jours par an. Navette gratuite dans le canyon du 7 mars au 28 novembre 2026.", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Printemps (floraison) et automne (températures idéales)."),
                    _buildBulletPoint("❌ Période à éviter : Mi-été (chaleurs extrêmes) et périodes de risques d'inondations soudaines dans les canyons étroits."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Tarifs et Pass"),
                    const SizedBox(height: 10),
                    _buildSectorText("Entrée : 35 dollars par véhicule (7 jours)."),
                    _buildSectorText("Surtaxe non-américains (dès 2026) : 100 dollars par personne."),
                    _buildSectorText("Pass America the Beautiful : 250 dollars par an (non-résidents)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("👣 Équipement : Pour The Narrows, prévoyez des chaussures aquatiques adaptées."),
                    _buildBulletPoint("⚠️ Sécurité : Renseignez-vous sur les risques d'inondations soudaines (flash floods)."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les prix, frais additionnels et horaires peuvent changer. Vérifiez les mises à jour officielles avant votre visite.",
                      style: TextStyle(color: Colors.redAccent, fontSize: 12, fontStyle: FontStyle.italic),
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