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
                        "Did you know: The infinite water network of Voyageurs National Park finds a fascinating echo in the Saimaa Lake District, Finland 🇫🇮.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🛶 Voyageurs National Park 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Located in northern Minnesota, this park protects thousands of acres of lakes, forests, and streams. Founded in 1975, it honors the French-Canadian explorers who once navigated these waters, which are rich in history and natural beauty.",
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
                          _buildGalleryImage('assets/images/123.jpg'),
                          _buildGalleryImage('assets/images/124.jpg'),
                          _buildGalleryImage('assets/images/125.jpg'),
                          _buildGalleryImage('assets/images/127.jpg'),
                          _buildGalleryImage('assets/images/129.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Recommended Times (Light & Calm)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Sunrise / Sunset: A prime time to observe the reflections on the vast expanses of water."),
                    _buildBulletPoint("👥 Avoiding crowds: Prioritize weekday mornings for a peaceful exploration by kayak or boat."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Advice"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Summer (July-August) to enjoy all water-based activities."),
                    _buildBulletPoint("❌ Period to avoid: Spring (high mosquito activity) and harsh winter months (difficult access)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before you leave."),
                    _buildBulletPoint("💧 Bring plenty of water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("🛶 Activities: Canoe rental is essential to explore the accessible islands."),
                    _buildBulletPoint("⚠️ Protection: Bring a good insect repellent."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Access fees, boat rentals, and navigation conditions may vary. Check for the latest local updates.",
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