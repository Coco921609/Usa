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
              // Back Button + Title
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
                        "Did you know: The spectacular dune landscapes of Death Valley recall the magic of the Merzouga dunes in the Sahara 🇲🇦.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🔥 Death Valley 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "A land of extremes, Death Valley fascinates with its striking contrasts. Below this basin located below sea level, where summer heat breaks records, life displays treasures of resilience. Between snow-capped peaks, lush oases, and rare wildflower fields, this hostile setting reveals unsuspected diversity despite its evocative name.",
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle('📸 Location Overview'),
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
                    _buildSectionTitle("📍 Must-see Sites"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🧂 Badwater Basin: The white vastness of the famous salt desert."),
                    _buildBulletPoint("🏜️ Mesquite Flat Sand Dunes: Majestic sand dunes."),
                    _buildBulletPoint("⛰️ Zabriskie Point: Rock formations with incredible golden hues."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Hours and Crowds"),
                    const SizedBox(height: 10),
                    const Text("Park open 24/7, all year round.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Recommended times: Prioritize sunrise at Zabriskie Point or sunset on the dunes for unforgettable lighting."),
                    _buildBulletPoint("👥 Avoiding crowds: Visit sites between November and March, very early in the morning or after 5 PM, to avoid extreme heat and crowds."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Winter and Spring. The days are pleasant, the nights are cool, and the landscape is sublime."),
                    _buildBulletPoint("❌ Period to avoid: Summer (May to September). The heat becomes deadly and activities are very limited."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Fees"),
                    const SizedBox(height: 10),
                    const Text("Private vehicle: 30 dollars. Motorcycle: 25 dollars. Individual: 15 dollars.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const Text("Annual park pass: 55 dollars.", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before you leave."),
                    _buildBulletPoint("💧 Bring plenty of water supplies (essential)."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("🚗 Vehicle: Ensure your cooling system is functioning perfectly."),
                    _buildBulletPoint("👟 Equipment: Wear light clothing, a hat, and high-protection sunscreen."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Hours and fees may change throughout the year.",
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

  // Updated storage key
  final String _cleStockageLieux = 'lieux_favoris_complets_fr';

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