import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class BryceCanyonPage extends StatelessWidget {
  final String title;

  const BryceCanyonPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/67.jpg', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : Les célèbres Cheminées de Fée de Cappadoce, en Turquie, trouvent un cousin spectaculaire ici avec nos hoodoos 🇹🇷.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🧗 Bryce Canyon National Park 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Les hoodoos (colonnes irrégulières de roche) existent sur tous les continents, mais c’est ici que la plus grande concentration se trouve sur Terre. Situé sur un haut plateau au sommet du Grand Escalier, le parc offre des ciels sombres fantastiques et des merveilles géologiques indescriptibles.",
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
                          _buildGalleryImage('assets/images/64.jpg'),
                          _buildGalleryImage('assets/images/65.jpg'),
                          _buildGalleryImage('assets/images/66.jpg'),
                          _buildGalleryImage('assets/images/68.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Fréquentation"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Horaires recommandés : Arrivez pour le lever du soleil à Sunrise Point ou restez pour le coucher à Sunset Point."),
                    _buildBulletPoint("👥 Évitement : Privilégiez les sentiers moins fréquentés comme Fairyland Loop pour éviter la foule de l'amphithéâtre principal."),
                    const SizedBox(height: 10),
                    const Text("Ouvert 24h/24, 365 jours par an. Visitor Center : 8h00–20h00 (été), 8h00–16h30 (hiver).", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Mai à septembre pour un accès total aux routes et sentiers."),
                    _buildBulletPoint("❌ Période à éviter : Hiver profond pour les randonnées en altitude, sauf si vous êtes équipé pour la neige."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Tarifs"),
                    const SizedBox(height: 10),
                    _buildSectorText("35 dollars par véhicule (7 jours) / 20 dollars par piéton ou cycliste."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("🚌 Navette gratuite : Utilisez-la d'avril à octobre (8h-18h/20h) pour circuler facilement."),
                    _buildBulletPoint("👟 Randonnée : Prévoyez de bonnes chaussures (Navajo Loop/Queen's Garden sont incontournables)."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les prix et les services saisonniers peuvent changer. Vérifiez les mises à jour avant votre départ.",
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