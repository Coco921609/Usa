import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class FlyGeyserPage extends StatelessWidget {
  final String title;

  const FlyGeyserPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/77.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Did you know: The Fly Geyser finds a fascinating echo in the hot springs of Hveravellir, Iceland 🇮🇸.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("♨️ Fly Geyser, Nevada 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "An artificial geyser formed accidentally in 1964 during a drilling project, it erupts continuously, creating a spectacular cone. Its vibrant colors (green, red, orange, yellow) come from thermophilic algae and minerals. Located in the Black Rock Desert, it remains an isolated and protected jewel.",
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
                          _buildGalleryImage('assets/images/75.jpg'),
                          _buildGalleryImage('assets/images/76.webp'),
                          _buildGalleryImage('assets/images/78.jpg'),
                          _buildGalleryImage('assets/images/79.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Recommended Times (Light & Calm)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Sunrise and late afternoon: Ideal for grazing light that enhances the colors."),
                    _buildBulletPoint("🌤️ Clear sky after rain: Contrasts are striking then."),
                    _buildBulletPoint("👥 Avoiding crowds: Prioritize organized guided tours to access the private site."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Advice"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Spring and Autumn for pleasant temperature conditions."),
                    _buildBulletPoint("❌ Period to avoid: Mid-summer for the extreme heat of the Nevada desert."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📍 Access and Organization"),
                    const SizedBox(height: 10),
                    _buildSectorText("Location: Black Rock Desert, ~32 km north of Gerlach (Washoe County)."),
                    _buildSectorText("Private property: The geyser is located at Fly Ranch, access is regulated."),
                    _buildSectorText("Advice: Include this stop via a specialized agency to facilitate limited access."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before leaving."),
                    _buildBulletPoint("💧 Bring plenty of water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("⚠️ Accessibility: Do not attempt to get there without prior authorization."),
                    _buildBulletPoint("🚗 Logistics: Plan a consistent itinerary, the site is very isolated."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Access conditions and rates may change. Always check for updates before your departure.",
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