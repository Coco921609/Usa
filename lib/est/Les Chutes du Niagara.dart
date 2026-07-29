import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class NiagaraFallsPage extends StatelessWidget {
  final String title;

  const NiagaraFallsPage({super.key, required this.title});

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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/108.jpg', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Le saviez-vous : La puissance phénoménale des Chutes du Niagara trouve un écho fascinant du côté des Chutes d'Iguazu, entre le Brésil et l'Argentine 🇦🇷🇧🇷.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🌊 Les Chutes du Niagara 🇨🇦🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Majestueuses et historiques, les Chutes du Niagara sont un symbole de puissance naturelle. Elles ont longtemps captivé l’imaginaire collectif et attirent chaque année des millions de visiteurs. L'achat de billets permet d'explorer leur splendeur et d'en comprendre l'importance culturelle.",
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
                          _buildGalleryImage('assets/images/107.webp'),
                          _buildGalleryImage('assets/images/104.jpg'),
                          _buildGalleryImage('assets/images/105.jpg'),
                          _buildGalleryImage('assets/images/106.jpg'),
                          _buildGalleryImage('assets/images/110.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📍 Que faire et voir ?"),
                    const SizedBox(height: 10),
                    _buildSubTitle("Les chutes emblématiques"),
                    _buildSectorText("• Horseshoe Falls : Chute en U de 51m, la plus impressionnante."),
                    _buildSectorText("• American Falls : 260m de large, offrant un belvédère panoramique."),
                    _buildSectorText("• Bridal Veil Falls : La plus petite et délicate des trois cascades."),
                    _buildSubTitle("Expériences immersives"),
                    _buildSectorText("• Croisière (Maid of the Mist / Hornblower) : Immersion légendaire au pied des chutes."),
                    _buildSectorText("• Journey Behind the Falls : Tunnel historique sous la falaise canadienne."),
                    _buildSectorText("• Cave of the Winds : Passerelles sur Goat Island avec sa zone 'Hurricane Deck'."),
                    _buildSubTitle("Points de vue & Attractions"),
                    _buildSectorText("• Tours : Skylon Tower (236m) et American Observation Tower (86m)."),
                    _buildSectorText("• Niagara's Fury (4D) : Spectacle ludique sur la formation géologique."),
                    _buildSectorText("• White Water Walk : Sentier le long des rapides les plus puissants."),
                    _buildSectorText("• Whirlpool Aero Car : Téléphérique historique au-dessus des tourbillons."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📜 Histoire"),
                    const SizedBox(height: 10),
                    const Text("Nées il y a 12 000 ans après la dernière ère glaciaire, les chutes furent un lieu spirituel pour les Premières Nations. Documentées par Louis Hennepin en 1678, elles sont devenues une icône touristique majeure après la création du premier parc d'État en 1885.", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Horaires et Dernières Admissions"),
                    const SizedBox(height: 10),
                    _buildSectorText("• 01 mai – 30 juin : 09h00 – 18h00 (Dernière admission : 17h00)"),
                    _buildSectorText("• 01 juil. – 31 août : 08h00 – 20h00 (Dernière admission : 19h00)"),
                    _buildSectorText("• 01 sept. – 31 oct. : 09h00 – 18h30 (Dernière admission : 17h30)"),
                    _buildSectorText("• 01 nov. – 28 fév. : 10h00 – 16h00 (Dernière admission : 15h00)"),
                    _buildSectorText("• 01 mars – 30 avr. : 09h30 – 17h30 (Dernière admission : 16h30)"),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🚫 Jours de fermeture"),
                    const SizedBox(height: 10),
                    _buildSectorText("• 25 décembre : Noël"),
                    _buildSectorText("• 01 janvier : Nouvel an"),
                    _buildSectorText("• 15 mars : Inspection technique"),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Conseils Pratiques"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Vérifiez toujours la météo avant de partir."),
                    _buildBulletPoint("💧 Prévoyez d'importantes réserves d'eau."),
                    _buildBulletPoint("📸 N'oubliez pas votre appareil photo !"),
                    _buildBulletPoint("🧥 Prévoyez un vêtement imperméable ou utilisez les ponchos fournis."),
                    _buildBulletPoint("🎟️ Achetez vos billets en ligne pour éviter l'attente (approx. 90 dollars)."),

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
    return Padding(padding: const EdgeInsets.only(bottom: 10.0), child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: bleuMer)));
  }

  Widget _buildSubTitle(String title) {
    return Padding(padding: const EdgeInsets.only(top: 10.0, bottom: 5.0), child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)));
  }

  Widget _buildSectorText(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 4.0), child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)));
  }

  Widget _buildBulletPoint(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }
}
