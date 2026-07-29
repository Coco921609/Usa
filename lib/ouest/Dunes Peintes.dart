import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class LassenDunesPage extends StatelessWidget {
  final String title;

  const LassenDunesPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/74.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : Les Painted Dunes trouvent un cousin fascinant du côté du volcan Landmannalaugar, en Islande 🇮🇸.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🎨 Painted Dunes & Parc de Lassen 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Situé dans le nord de la Californie, le parc national volcanique de Lassen est une terre isolée de sommets enneigés et de lacs clairs. Les Painted Dunes, formées par l'oxydation de cendres volcaniques, offrent des teintes vibrantes de rouge, rose et jaune, visibles depuis le sommet du Cinder Cone.",
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
                          _buildGalleryImage('assets/images/73.jpg'),
                          _buildGalleryImage('assets/images/70.jpg'),
                          _buildGalleryImage('assets/images/71.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Fréquentation"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Horaires recommandés : L'heure dorée en automne (15 min après le coucher) pour une lumière magique."),
                    _buildBulletPoint("👥 Évitement : En été, arrivez tôt le matin car les dunes sont à l'ombre l'après-midi."),
                    _buildSectorText("Ouvert presque toute l'année, mais avec des accès limités selon les événements spéciaux."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Conseils"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Automne pour les couleurs éclatantes, ou mai à octobre pour l'accès total."),
                    _buildBulletPoint("❌ Période à éviter : Novembre à mai (fortes chutes de neige, routes fermées)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Tarifs et Pass"),
                    const SizedBox(height: 10),
                    _buildSectorText("Tarif d'entrée : 250 USD (valable pour 4 occupants par voiture)."),
                    _buildSectorText("Pass America the Beautiful : Recommandé pour un accès illimité sur 12 mois."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("🚗 Accès : Via la Route d’État 89 (Lassen Volcanic Park Highway)."),
                    _buildBulletPoint("⚠️ Sécurité : Vérifiez les ouvertures de routes, le parc ferme souvent en hiver."),

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