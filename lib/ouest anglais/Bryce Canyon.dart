import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class BryceCanyonPage extends StatelessWidget {
  final String title;

  const BryceCanyonPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/67.jpg', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Did you know: The famous Fairy Chimneys of Cappadocia, in Turkey, find a spectacular cousin here with our hoodoos 🇹🇷.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🧗 Bryce Canyon National Park 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Hoodoos (irregular columns of rock) exist on every continent, but this is where the largest concentration is found on Earth. Located on a high plateau at the top of the Grand Staircase, the park offers fantastic dark skies and indescribable geological wonders.",
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
                          _buildGalleryImage('assets/images/64.jpg'),
                          _buildGalleryImage('assets/images/65.jpg'),
                          _buildGalleryImage('assets/images/66.jpg'),
                          _buildGalleryImage('assets/images/68.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Hours and Crowds"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Recommended times: Arrive for sunrise at Sunrise Point or stay for sunset at Sunset Point."),
                    _buildBulletPoint("👥 Avoiding crowds: Prioritize less-frequented trails like Fairyland Loop to avoid the main amphitheater crowds."),
                    const SizedBox(height: 10),
                    const Text("Open 24/7, 365 days a year. Visitor Center: 8:00 AM–8:00 PM (summer), 8:00 AM–4:30 PM (winter).", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Advice"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: May to September for full access to roads and trails."),
                    _buildBulletPoint("❌ Period to avoid: Deep winter for high-altitude hiking, unless you are equipped for snow."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Fees"),
                    const SizedBox(height: 10),
                    _buildSectorText("35 dollars per vehicle (7 days) / 20 dollars per pedestrian or cyclist."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before leaving."),
                    _buildBulletPoint("💧 Bring plenty of water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("🚌 Free shuttle: Use it from April to October (8 AM-6 PM/8 PM) for easy travel."),
                    _buildBulletPoint("👟 Hiking: Bring good shoes (Navajo Loop/Queen's Garden are must-sees)."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Prices and seasonal services may change. Check for updates before your departure.",
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