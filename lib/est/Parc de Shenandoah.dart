import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class ShenandoahParkPage extends StatelessWidget {
  final String title;

  const ShenandoahParkPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/121.jpg', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : La biodiversité luxuriante de Shenandoah trouve un cousin fascinant du côté du Parc National des Cévennes, en France 🇫🇷.",                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🌲 Parc de Shenandoah 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "À seulement 75 miles de Washington DC, le parc de Shenandoah est un terrain débordant de cascades, de panoramas spectaculaires et de champs de fleurs. Refuge pour les cerfs et l'ours noir, c'est une oasis de paix protégée.",
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
                          _buildGalleryImage('assets/images/118.jpg'),
                          _buildGalleryImage('assets/images/119.jpg'),
                          _buildGalleryImage('assets/images/120.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Horaires recommandés (Lumière & Calme)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Lever / Coucher du soleil : La Skyline Drive offre des points de vue uniques sur la vallée de Shenandoah."),
                    _buildBulletPoint("👥 Évitement : Visitez en semaine pour profiter des sentiers de randonnée sans la foule des week-ends."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Automne (feuillages d'or) et printemps (fleurs sauvages)."),
                    _buildBulletPoint("❌ Période à éviter : Les fins de semaine d'octobre (très forte affluence sur la Skyline Drive)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("🚗 Logistique : Skyline Drive est l'axe principal ; prévoyez du temps pour les arrêts photos."),
                    _buildBulletPoint("⚠️ Faune : Restez à distance des ours noirs et ne nourrissez jamais les animaux."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les tarifs d'entrée au parc et les conditions de circulation sur Skyline Drive peuvent changer. Vérifiez les mises à jour officielles.",
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

  Widget _buildBulletPoint(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }
}