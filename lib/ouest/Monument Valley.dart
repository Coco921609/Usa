import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class MonumentValleyPage extends StatelessWidget {
  final String title;

  const MonumentValleyPage({super.key, required this.title});

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
                    'assets/images/10.jpg',
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
                        "Sachez-vous : il existe un endroit qui rappelle la beauté de ces formations rocheuses, le désert du Wadi Rum, en Jordanie 🇯🇴.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🏜️ Monument Valley 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "À la frontière entre l'Arizona et l'Utah, Monument Valley déploie ses majestueuses formations rocheuses au cœur du territoire des Navajos. Immortalisé dans d'innombrables films, ce paysage emblématique impressionne par ses mesas et cheminées de grès. Un décor grandiose pour une immersion totale dans un univers sauvage et sacré.",
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
                          _buildGalleryImage('assets/images/14.jpg'),
                          _buildGalleryImage('assets/images/17.jpg'),
                          _buildGalleryImage('assets/images/11.webp'),
                          _buildGalleryImage('assets/images/12.webp'),
                          _buildGalleryImage('assets/images/17.webp'),
                          _buildGalleryImage('assets/images/18.jpg'),
                          _buildGalleryImage('assets/images/19.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Fréquentation"),
                    const SizedBox(height: 10),
                    const Text("Ouvert tous les jours. De mars à août : 6h30 à 19h30. Le reste de l'année : 8h à 17h.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const SizedBox(height: 8),
                    _buildBulletPoint("🌅 Horaires recommandés : Le lever du soleil est idéal pour voir les roches s'embraser, tandis que le coucher offre une lumière douce spectaculaire."),
                    _buildBulletPoint("👥 Évitement : Privilégiez les visites hors saison ou en début de matinée pour échapper à la foule."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons et Affluence"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : Le printemps et l'automne pour bénéficier de températures clémentes."),
                    _buildBulletPoint("❌ Période à éviter : Juillet et août, où la chaleur est intense et le site très fréquenté."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Tarifs et Accès"),
                    const SizedBox(height: 10),
                    const Text("Accès au parc : 10 dollars par personne. Prévoir une demi-journée pour explorer le Visitor Center, la Valley Drive et les points de vue.", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Informations Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez la météo : les orages peuvent rendre les pistes impraticables."),
                    _buildBulletPoint("💧 Prévoyez de grandes réserves d'eau, le climat est très sec."),
                    _buildBulletPoint("📸 Protégez votre matériel photo contre le sable."),
                    _buildBulletPoint("🧭 Téléchargez vos cartes GPS hors-ligne, le réseau mobile est instable."),
                    _buildBulletPoint("👟 Portez des chaussures de marche fermées et confortables."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les horaires et les tarifs peuvent être modifiés au cours de l'année.",
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