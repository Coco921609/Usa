import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class PageAndPowellPage extends StatelessWidget {
  final String title;

  const PageAndPowellPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/99.jpg', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : L'immensité bleue du lac Powell trouve un écho historique sur les rives du Lac Nasser, en Égypte 🇪🇬.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("📍 Page et le Lac Powell, Arizona 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Située au nord de l’Arizona, la ville de Page est une étape clé lors d’un road trip. Réputée pour ses paysages grandioses, elle abrite des merveilles comme Antelope Canyon, le lac Powell et le célèbre Horseshoe Bend.",
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
                          _buildGalleryImage('assets/images/96.jpg'),
                          _buildGalleryImage('assets/images/97.jpg'),
                          _buildGalleryImage('assets/images/100.jpg'),
                          _buildGalleryImage('assets/images/101.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Horaires recommandés (Lumière & Calme)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Lever / Coucher du soleil : Idéal à Horseshoe Bend pour des contrastes spectaculaires entre le fleuve et les parois rocheuses."),
                    _buildBulletPoint("👥 Évitement : Visitez les points de vue tôt le matin ou après 17h pour éviter la foule des tours organisés."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Printemps et automne pour des températures agréables sur le lac."),
                    _buildBulletPoint("❌ Période à éviter : Mi-été pour la chaleur écrasante qui limite les activités en extérieur."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("🛶 Activités : Louez un kayak pour découvrir les canyons étroits du lac Powell."),
                    _buildBulletPoint("🎟️ Réservations : Réservez vos visites (Antelope Canyon surtout) plusieurs mois à l'avance."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les prix, les frais d'accès et les conditions météorologiques peuvent changer. Vérifiez les mises à jour avant votre départ.",
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