import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class VoyageursNationalParkPage extends StatelessWidget {
  final String title;

  const VoyageursNationalParkPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/126.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : Le réseau aquatique infini du parc national des Voyageurs trouve un écho fascinant dans la région des lacs de Saimaa, en Finlande 🇫🇮.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🛶 Voyageurs National Park 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Situé dans le nord du Minnesota, ce parc protège des milliers d'acres de lacs, forêts et ruisseaux. Fondé en 1975, il rend hommage aux explorateurs franco-canadiens qui naviguaient autrefois dans ces eaux riches en histoire et en beauté naturelle.",
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
                          _buildGalleryImage('assets/images/123.jpg'),
                          _buildGalleryImage('assets/images/124.jpg'),
                          _buildGalleryImage('assets/images/125.jpg'),
                          _buildGalleryImage('assets/images/127.jpg'),
                          _buildGalleryImage('assets/images/129.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Horaires recommandés (Lumière & Calme)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Lever / Coucher du soleil : Moment privilégié pour observer les reflets sur les vastes étendues d'eau."),
                    _buildBulletPoint("👥 Évitement : Privilégiez les matinées en semaine pour une exploration paisible en kayak ou en bateau."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Été (juillet-août) pour profiter de toutes les activités nautiques."),
                    _buildBulletPoint("❌ Période à éviter : Le printemps (saison des moustiques très active) et les mois d'hiver rigoureux (accès complexe)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("🛶 Activités : La location de canoë est indispensable pour explorer les îles accessibles."),
                    _buildBulletPoint("⚠️ Protection : Prévoyez un bon répulsif contre les insectes."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les tarifs d'accès, les locations de bateaux et les conditions de navigation peuvent varier. Vérifiez les dernières mises à jour locales.",
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