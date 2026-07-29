import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class FlyGeyserPage extends StatelessWidget {
  final String title;

  const FlyGeyserPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/77.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : Le Fly Geyser trouve un écho fascinant dans les sources chaudes de Hveravellir, en Islande 🇮🇸.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("♨️ Fly Geyser, Nevada 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Geyser artificiel formé accidentellement en 1964 lors d'un forage, il jaillit en continu, créant un cône spectaculaire. Ses couleurs vives (vert, rouge, orange, jaune) proviennent d'algues thermophiles et de minéraux. Situé dans le désert de Black Rock, il reste un joyau isolé et protégé.",
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
                          _buildGalleryImage('assets/images/75.jpg'),
                          _buildGalleryImage('assets/images/76.webp'),
                          _buildGalleryImage('assets/images/78.jpg'),
                          _buildGalleryImage('assets/images/79.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Horaires recommandés (Lumière & Calme)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Lever du soleil et fin d'après-midi : Idéal pour les lumières rasantes qui subliment les couleurs."),
                    _buildBulletPoint("🌤️ Ciel clair après pluie : Les contrastes sont alors saisissants."),
                    _buildBulletPoint("👥 Évitement : Privilégiez les visites guidées organisées pour accéder au site privé."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Printemps et automne pour des conditions de température agréables."),
                    _buildBulletPoint("❌ Période à éviter : Mi-été pour la chaleur extrême du désert du Nevada."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📍 Accès et Organisation"),
                    const SizedBox(height: 10),
                    _buildSectorText("Localisation : Désert de Black Rock, ~32 km au nord de Gerlach (Comté de Washoe)."),
                    _buildSectorText("Propriété privée : Le geyser se trouve au Fly Ranch, l'accès est réglementé."),
                    _buildSectorText("Conseil : Intégrez cette étape via une agence spécialisée pour faciliter les accès limités."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("⚠️ Accessibilité : Ne tentez pas de vous y rendre sans autorisation préalable."),
                    _buildBulletPoint("🚗 Logistique : Prévoyez une cohérence d'itinéraire, le site est très isolé."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les conditions d'accès et les tarifs peuvent changer. Vérifiez toujours les mises à jour avant votre départ.",
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