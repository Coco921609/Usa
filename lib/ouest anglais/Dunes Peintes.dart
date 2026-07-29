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
                        "Did you know: The Painted Dunes find a fascinating cousin in the Landmannalaugar volcano, Iceland 🇮🇸.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🎨 Painted Dunes & Lassen Park 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Located in northern California, Lassen Volcanic National Park is an isolated land of snow-capped peaks and clear lakes. The Painted Dunes, formed by the oxidation of volcanic ash, offer vibrant hues of red, pink, and yellow, visible from the summit of Cinder Cone.",
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
                          _buildGalleryImage('assets/images/73.jpg'),
                          _buildGalleryImage('assets/images/70.jpg'),
                          _buildGalleryImage('assets/images/71.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Hours and Crowds"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Recommended times: The golden hour in autumn (15 min after sunset) for magical lighting."),
                    _buildBulletPoint("👥 Avoiding crowds: In summer, arrive early in the morning as the dunes are in the shade in the afternoon."),
                    _buildSectorText("Open almost all year, but with limited access depending on special events."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Advice"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Autumn for vibrant colors, or May to October for full access."),
                    _buildBulletPoint("❌ Period to avoid: November to May (heavy snowfall, roads closed)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Fees and Passes"),
                    const SizedBox(height: 10),
                    _buildSectorText("Entrance fee: 250 USD (valid for 4 occupants per car)."),
                    _buildSectorText("America the Beautiful Pass: Recommended for unlimited access over 12 months."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before leaving."),
                    _buildBulletPoint("💧 Bring plenty of water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("🚗 Access: Via State Route 89 (Lassen Volcanic Park Highway)."),
                    _buildBulletPoint("⚠️ Safety: Check road openings; the park often closes in winter."),

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