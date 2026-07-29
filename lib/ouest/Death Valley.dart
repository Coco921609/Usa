import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class DeathValleyPage extends StatelessWidget {
  final String title;

  const DeathValleyPage({super.key, required this.title});

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

              // Photo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/44.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : Les paysages de dunes spectaculaires de la Vallée de la Mort rappellent la magie des dunes de Merzouga, dans le Sahara 🇲🇦.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🔥 Death Valley 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Terre d'extrêmes, la Vallée de la Mort fascine par ses contrastes saisissants. Sous ce bassin situé en dessous du niveau de la mer, où la chaleur estivale bat des records, la vie déploie des trésors de résilience. Entre sommets enneigés, oasis luxuriantes et rares champs de fleurs sauvages, ce décor hostile révèle une diversité insoupçonnée malgré son nom évocateur.",
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
                          _buildGalleryImage('assets/images/43.jpg'),
                          _buildGalleryImage('assets/images/47.jpg'),
                          _buildGalleryImage('assets/images/48.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📍 Sites incontournables"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🧂 Badwater Basin : L'immensité blanche du célèbre désert de sel."),
                    _buildBulletPoint("🏜️ Mesquite Flat Sand Dunes : Des dunes de sable majestueuses."),
                    _buildBulletPoint("⛰️ Zabriskie Point : Des formations rocheuses aux teintes dorées incroyables."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Fréquentation"),
                    const SizedBox(height: 10),
                    const Text("Parc ouvert 24h/24, toute l'année.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Horaires recommandés : Privilégiez le lever du soleil à Zabriskie Point ou le coucher sur les dunes pour des lumières inoubliables."),
                    _buildBulletPoint("👥 Évitement : Visitez les sites entre novembre et mars, très tôt le matin ou après 17h, pour éviter la chaleur extrême et la foule."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Saisons"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Saison recommandée : L'hiver et le printemps. Les journées sont agréables, les nuits fraîches et le paysage sublime."),
                    _buildBulletPoint("❌ Période à éviter : L'été (mai à septembre). La chaleur devient mortelle et les activités sont très limitées."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Tarifs"),
                    const SizedBox(height: 10),
                    const Text("Véhicule privé : 30 dollars. Moto : 25 dollars. Individuel : 15 dollars.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const Text("Pass annuel du parc : 55 dollars.", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau (indispensable)."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("🚗 Véhicule : Assurez-vous que votre système de refroidissement fonctionne parfaitement."),
                    _buildBulletPoint("👟 Équipement : Portez des vêtements légers, un chapeau et de la crème solaire haute protection."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention : les horaires et les tarifs peuvent changer au cours de l'année.",
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