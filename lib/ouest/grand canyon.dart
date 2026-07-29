import 'package:flutter/material.dart';

// Définition de la couleur utilisée pour les titres
const Color bleuMer = Colors.cyanAccent;

class GrandCanyonPage extends StatelessWidget {
  final String title;

  const GrandCanyonPage({super.key, required this.title});

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

              // Aperçu Photo principale
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/6.jpg',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Phrase en italique
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Sachez-vous : il existe un endroit pareil que le Grand Canyon qui s'appelle Kings Canyon, Australie 🇦🇺 : Ce site rappelle la beauté des formations rocheuses.",
                        style: TextStyle(color: Colors.cyanAccent, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🏜️ Le Grand Canyon 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Situé en plein cœur de l'Arizona, le Grand Canyon est une merveille géologique qui fascine les voyageurs du monde entier. S'étendant sur plus de 450 km, ce site majestueux dévoile une nature à la fois sauvage et spectaculaire, sublimée par des roches aux teintes flamboyantes oscillant entre le rose et l'orange.",
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires d'ouverture"),
                    const SizedBox(height: 10),
                    const Text(
                      "Le parc est ouvert 24h/24 toute l'année. Les installations pour les visiteurs fonctionnent de 7h00 à 18h00 (mai à septembre) et de 8h00 à 17h00 (basse saison).",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Conseils photo : Lever et Coucher"),
                    const SizedBox(height: 10),
                    const Text(
                      "Pour des photos inoubliables, privilégiez l'heure dorée : arrivez au moins 45 minutes avant le lever ou le coucher du soleil pour capturer les changements de lumière sur les parois.",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),

                    // GALERIE PHOTO (Horizontal Scroll)
                    const SizedBox(height: 25),
                    _buildSectionTitle('📸 Aperçu du lieu'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/3.jpg'),
                          _buildGalleryImage('assets/images/4.jpg'),
                          _buildGalleryImage('assets/images/5.jpg'),
                          _buildGalleryImage('assets/images/6.jpg'),
                          _buildGalleryImage('assets/images/5.jpg'),
                          _buildGalleryImage('assets/images/8.webp'),
                          _buildGalleryImage('assets/images/9.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Affluence"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Printemps (avril-mai) ou Automne (septembre-octobre) pour un climat agréable."),
                    _buildBulletPoint("❌ Période à éviter pour la foule : Juillet et Août (très haute affluence et chaleur intense)."),
                    _buildBulletPoint("💡 Astuce : Visitez la Rive Nord (North Rim) si vous cherchez le calme, elle est moins fréquentée que la Rive Sud."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Tarifs et Billets (sans espèces)"),
                    const SizedBox(height: 10),
                    _buildTarifTable(),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Informations Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les horaires et prix peuvent changer au cours de l'année.",
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

  // Helper pour les images de la galerie
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

  Widget _buildBulletPoint(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }

  Widget _buildTarifTable() {
    return Table(
      border: TableBorder.all(color: Colors.white24),
      children: [
        _buildTableRow("Catégorie", "Prix", isHeader: true),
        _buildTableRow("Véhicule (7 jours)", "30 \$"),
        _buildTableRow("Moto", "25 \$"),
        _buildTableRow("Individuel", "15 \$"),
      ],
    );
  }

  TableRow _buildTableRow(String col1, String col2, {bool isHeader = false}) {
    return TableRow(
      children: [
        TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(col1, style: TextStyle(color: Colors.white, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)))),
        TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(col2, style: TextStyle(color: Colors.white70, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)))),
      ],
    );
  }
}