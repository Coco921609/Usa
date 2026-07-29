import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class CanyonlandsPage extends StatelessWidget {
  final String title;

  const CanyonlandsPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/61.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : Les formations rocheuses de Canyonlands trouvent un cousin fascinant du côté du massif des Bungle Bungle, en Australie 🇦🇺.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🏜️ Parc National de Canyonlands 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Canyonlands est une étendue sauvage de canyons, buttes et flèches sculptées par le fleuve Colorado et la rivière Green. Le parc est divisé en quatre districts distincts ; aucune route ne les relie. Chaque zone offre des opportunités uniques d’aventure.",
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗺️ Les Districts du Parc"),
                    const SizedBox(height: 10),
                    _buildSectorText("Island in the Sky : La partie la plus visitée et accessible."),
                    _buildSectorText("The Maze : La zone la plus isolée, idéale pour une aventure hors des sentiers battus."),
                    _buildSectorText("The Needles : Le district idéal pour les passionnés de randonnée."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Fréquentation"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Horaires recommandés : Privilégiez l'aube et le crépuscule pour les lumières les plus spectaculaires."),
                    _buildBulletPoint("👥 Évitement : Visitez les sites majeurs en dehors des heures de forte chaleur et de forte affluence."),
                    _buildSectorText("Ouvert généralement de 7h à 20h. Centre d'accueil : 9h à 17h."),

                    const SizedBox(height: 25),
                    _buildSectionTitle('📸 Aperçu du lieu'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/59.jpg'),
                          _buildGalleryImage('assets/images/60.webp'),
                          _buildGalleryImage('assets/images/61.webp'),
                          _buildGalleryImage('assets/images/62.webp'),
                          _buildGalleryImage('assets/images/63.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Printemps et automne pour des températures clémentes."),
                    _buildBulletPoint("❌ Période à éviter : Mi-été (chaleur extrême) et mi-hiver (horaires réduits et conditions difficiles)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Tarifs et Pass"),
                    const SizedBox(height: 10),
                    _buildSectorText("Entrée : 35 dollars par véhicule (pass 7 jours)."),
                    _buildSectorText("Pass America the Beautiful : Accès multi-parcs nationaux."),
                    _buildSectorText("Camping : Gratuit à Island in the Sky (sans réservation) ou campings payants (env. 20 dollars)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("🚗 Mobilité : Prévoyez de longs temps de trajet, aucun accès direct entre les districts."),
                    _buildBulletPoint("⚠️ Sécurité : Zone désertique, restez sur les pistes balisées."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les prix et les horaires peuvent changer. Vérifiez les mises à jour avant votre départ.",
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

  // MÉTHODE AJOUTÉE ICI
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