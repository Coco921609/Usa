import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class ZionParkPage extends StatelessWidget {
  final String title;

  const ZionParkPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/86.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Did you know: The vertiginous beauty of Zion finds a fascinating cousin in the Zhangjiajie Mountains, in China 🇨🇳.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🧗 Zion National Park 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Follow trails walked for millennia. Behold immense cream, pink, and red sandstone cliffs rising into a brilliant blue sky. Discover the towering walls of a narrow canyon where you can hike with your feet in the water (The Narrows).",
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
                          _buildGalleryImage('assets/images/84.webp'),
                          _buildGalleryImage('assets/images/85.webp'),
                          _buildGalleryImage('assets/images/87.jpg'),
                          _buildGalleryImage('assets/images/88.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Hours and Crowds"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Recommended times: Early morning (before 8 AM) or late afternoon for the softest light."),
                    _buildBulletPoint("👥 Avoiding crowds: The park is very busy; visit major sites outside of peak periods for more serenity."),
                    const Text("Open 24/7, 365 days a year. Free shuttle in the canyon from March 7 to November 28, 2026.", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Advice"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Spring (blooming) and Autumn (ideal temperatures)."),
                    _buildBulletPoint("❌ Period to avoid: Mid-summer (extreme heat) and periods with risks of flash floods in narrow canyons."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Fees and Passes"),
                    const SizedBox(height: 10),
                    _buildSectorText("Entrance: 35 dollars per vehicle (7 days)."),
                    _buildSectorText("Non-US Citizen Surcharge (as of 2026): 100 dollars per person."),
                    _buildSectorText("America the Beautiful Pass: 250 dollars per year (non-residents)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before you leave."),
                    _buildBulletPoint("💧 Bring plenty of water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("👣 Equipment: For The Narrows, plan for appropriate water shoes."),
                    _buildBulletPoint("⚠️ Safety: Stay informed about flash flood risks."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Prices, additional fees, and hours may change. Check official updates before your visit.",
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

  // Storage key for the French drawer
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