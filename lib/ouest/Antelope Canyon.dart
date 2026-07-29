import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class AntelopeCanyonPage extends StatelessWidget {
  final String title;

  const AntelopeCanyonPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/57.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : La beauté fascinante d'Antelope Canyon trouve un écho spectaculaire dans les Gorges du Siq de Pétra, en Jordanie 🇯🇴.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🏜️ Antelope Canyon 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Chef-d'œuvre sculpté par l'eau et le vent, Antelope Canyon est un site sacré situé sur les terres Navajo. Ses parois aux formes ondulantes et aux couleurs changeantes offrent l'un des spectacles naturels les plus photographiés au monde.",
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
                          _buildGalleryImage('assets/images/51.jpg'),
                          _buildGalleryImage('assets/images/52.jpg'),
                          _buildGalleryImage('assets/images/54.webp'),
                          _buildGalleryImage('assets/images/55.jpg'),
                          _buildGalleryImage('assets/images/56.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Durées des visites"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("Upper Antelope Canyon : 8h-18h (avril-sept), 9h-16h (oct-mars). Durée : 1h30 à 2h."),
                    _buildBulletPoint("Lower Antelope Canyon : 7h45-16h15. Durée : 1h15."),
                    _buildBulletPoint("Canyon X et autres : Départs entre 7h30 et 8h. Durée : environ 2h."),
                    _buildBulletPoint("Secret Antelope Canyon : Durée environ 3h30 (incluant Horseshoe Bend)."),
                    const SizedBox(height: 10),
                    _buildSectorText("Pour plusieurs canyons dans la même journée : prévoyez 6 à 8 heures."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Horaires recommandés (Lumière & Calme)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("📸 Pour les faisceaux de lumière : Mars à octobre, entre 10h et 13h (zénith solaire)."),
                    _buildBulletPoint("🌅 Lever / Coucher du soleil : Idéal pour des teintes douces et une atmosphère magique."),
                    _buildBulletPoint("👥 Évitement : Privilégiez les visites tôt le matin ou en fin d'après-midi."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons : Recommandations"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : La basse saison (novembre à février) pour éviter la foule."),
                    _buildBulletPoint("❌ Période à éviter : Haute saison (mai à septembre) avec des chaleurs jusqu'à 37°C."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques & Règlements"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("👣 Visite guidée : Obligatoire avec un guide Navajo agréé."),
                    _buildBulletPoint("🎟️ Réservation : Indispensable plusieurs semaines à l'avance."),
                    _buildBulletPoint("⏰ Arrivée : 45 min avant votre créneau pour le briefing."),
                    _buildBulletPoint("👕 Équipement : Chaussures fermées, protection solaire/sable."),
                    _buildBulletPoint("⚠️ Restrictions : Sacs, trépieds et perches à selfie interdits."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les horaires et les tarifs peuvent changer au cours de l'année. Vérifiez les mises à jour avant de réserver.",
                      style: TextStyle(color: Colors.redAccent, fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Note : Antelope Canyon est un site protégé et sacré. Merci de respecter les consignes de vos guides Navajo.",
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