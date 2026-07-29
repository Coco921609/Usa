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

              // Main Photo Preview
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
                    // Italic phrase
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Did you know: There is a place that recalls the beauty of these rock formations, the Wadi Rum desert, in Jordan 🇯🇴.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🏜️ Monument Valley 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "On the border between Arizona and Utah, Monument Valley displays its majestic rock formations in the heart of Navajo territory. Immortalized in countless films, this iconic landscape impresses with its mesas and sandstone spires. A grand setting for total immersion in a wild and sacred world.",
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
                    _buildSectionTitle("🕒 Hours and Crowds"),
                    const SizedBox(height: 10),
                    const Text("Open every day. March to August: 6:30 AM to 7:30 PM. The rest of the year: 8:00 AM to 5:00 PM.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const SizedBox(height: 8),
                    _buildBulletPoint("🌅 Recommended times: Sunrise is ideal for seeing the rocks glow, while sunset offers spectacular soft lighting."),
                    _buildBulletPoint("👥 Avoiding crowds: Prioritize off-season visits or early mornings to escape the crowds."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Crowds"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Spring and Autumn to enjoy mild temperatures."),
                    _buildBulletPoint("❌ Period to avoid: July and August, when the heat is intense and the site is very busy."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Fees and Access"),
                    const SizedBox(height: 10),
                    const Text("Park access: 10 dollars per person. Plan for half a day to explore the Visitor Center, the Valley Drive, and the viewpoints.", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Information"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Check the weather: storms can make the trails impassable."),
                    _buildBulletPoint("💧 Bring large water supplies; the climate is very dry."),
                    _buildBulletPoint("📸 Protect your photo equipment from sand."),
                    _buildBulletPoint("🧭 Download offline GPS maps; mobile coverage is unstable."),
                    _buildBulletPoint("👟 Wear closed, comfortable walking shoes."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Hours and rates may change throughout the year.",
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

  Widget _buildBulletPoint(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }
}