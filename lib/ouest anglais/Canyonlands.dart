import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class CanyonlandsPage extends StatelessWidget {
  final String title;

  const CanyonlandsPage({super.key, required this.title});

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

              // Main Photo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/61.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Did you know: The rock formations of Canyonlands find a fascinating cousin in the Bungle Bungle Range, Australia 🇦🇺.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🏜️ Canyonlands National Park 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Canyonlands is a wilderness of canyons, buttes, and spires carved by the Colorado and Green Rivers. The park is divided into four distinct districts; no roads connect them. Each area offers unique opportunities for adventure.",
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗺️ Park Districts"),
                    const SizedBox(height: 10),
                    _buildSectorText("Island in the Sky: The most visited and accessible part."),
                    _buildSectorText("The Maze: The most isolated area, perfect for off-the-beaten-path adventure."),
                    _buildSectorText("The Needles: The ideal district for hiking enthusiasts."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Hours and Crowds"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Recommended times: Prioritize dawn and dusk for the most spectacular lighting."),
                    _buildBulletPoint("👥 Avoiding crowds: Visit major sites outside of peak heat and peak hours."),
                    _buildSectorText("Generally open from 7 AM to 8 PM. Visitor Center: 9 AM to 5 PM."),

                    const SizedBox(height: 25),
                    _buildSectionTitle('📸 Location Overview'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/59.jpg'),
                          _buildGalleryImage('assets/images/60.webp'),
                          _buildGalleryImage('assets/images/61.webp'),
                          _buildGalleryImage('assets/images/62.webp'),
                          _buildGalleryImage('assets/images/63.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Advice"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Spring and Autumn for mild temperatures."),
                    _buildBulletPoint("❌ Period to avoid: Mid-summer (extreme heat) and mid-winter (reduced hours and difficult conditions)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Fees and Passes"),
                    const SizedBox(height: 10),
                    _buildSectorText("Entrance: 35 dollars per vehicle (7-day pass)."),
                    _buildSectorText("America the Beautiful Pass: Multi-national park access."),
                    _buildSectorText("Camping: Free at Island in the Sky (no reservation) or paid campgrounds (approx. 20 dollars)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before leaving."),
                    _buildBulletPoint("💧 Bring plenty of water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("🚗 Mobility: Plan for long travel times; there is no direct access between districts."),
                    _buildBulletPoint("⚠️ Safety: Desert zone, stay on marked trails."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Prices and hours may change. Check for updates before your departure.",
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

  Widget _buildSectorText(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 6.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }

  Widget _buildBulletPoint(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }
}