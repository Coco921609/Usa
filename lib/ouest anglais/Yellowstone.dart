import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class YellowstonePage extends StatelessWidget {
  final String title;

  const YellowstonePage({super.key, required this.title});

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
                  child: Image.asset('assets/images/20.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Did you know: The geothermal phenomena of Yellowstone find a fascinating cousin in the geysers of Geysir, in Iceland 🇮🇸.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🌋 Yellowstone National Park 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Inaugurated in 1872, Yellowstone remains the first national park ever created in the world. With an area of 9,000 km² and an average altitude of 2,400 m, this plateau rests on an immense caldera housing a still-active supervolcano. Beneath this bubbling land, where two-thirds of the planet's geysers are concentrated, lies a wild and unpredictable nature.",
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),
                    const SizedBox(height: 15),
                    _buildBulletPoint("Old Faithful: The legendary geyser, a must-see attraction that draws millions of visitors every summer."),
                    _buildBulletPoint("Grand Prismatic Spring: The largest hot spring in the United States and one of the largest in the world, it offers an unreal chromatic spectacle."),
                    _buildBulletPoint("Grand Canyon of the Yellowstone: A site with spectacular yellow walls, carved by a tumultuous river."),
                    _buildBulletPoint("Yellowstone Lake: The largest mountain lake in North America, offering a magnificent panorama."),

                    const SizedBox(height: 25),
                    _buildSectionTitle('📸 Location Overview'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/27.webp'),
                          _buildGalleryImage('assets/images/23.jpg'),
                          _buildGalleryImage('assets/images/24.jpg'),
                          _buildGalleryImage('assets/images/25.jpg'),
                          _buildGalleryImage('assets/images/26.jpg'),
                          _buildGalleryImage('assets/images/26.jpg'),
                          _buildGalleryImage('assets/images/29.jpg'),
                          _buildGalleryImage('assets/images/30.webp'),
                          _buildGalleryImage('assets/images/31.jpg'),
                          _buildGalleryImage('assets/images/34.webp'),
                          _buildGalleryImage('assets/images/40.webp'),
                          _buildGalleryImage('assets/images/38.webp'),
                          _buildGalleryImage('assets/images/35.jpg'),
                          _buildGalleryImage('assets/images/41.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗺️ The 7 Major Sectors"),
                    const SizedBox(height: 15),
                    _buildSectorText("Southwest: Major geothermal concentration (Grand Prismatic, Old Faithful)."),
                    _buildSectorText("Madison: Prime area for wildlife viewing."),
                    _buildSectorText("Norris: Porcelain and Back Basin, famous for their fascinatingly colored springs."),
                    _buildSectorText("Mammoth Hot Springs: Limestone terraces with unusual shapes."),
                    _buildSectorText("Tower Roosevelt: Lush forest landscapes and access to Lamar Valley."),
                    _buildSectorText("Canyon Village: Grand Canyon of the Yellowstone River and its impressive waterfalls."),
                    _buildSectorText("Southeast: Perfect for hiking and fishing (Yellowstone Lake, West Thumb)."),

                    // Focus Grand Prismatic
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Did you know: The fascinating beauty of Grand Prismatic finds a spectacular echo in the Wai-O-Tapu pool, in New Zealand 🇳🇿.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    _buildSectionTitle("🕒 Hours and Crowds (Grand Prismatic)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌅 Recommended times: Prioritize midday for optimal visibility of colors thanks to vertical light that dissipates the steam."),
                    _buildBulletPoint("👥 Avoiding crowds: Arrive very early in the morning or very late in the afternoon to avoid saturated parking lots in high season."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Advice (Grand Prismatic)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Summer, to enjoy the vibrant colors under a clear sky."),
                    _buildBulletPoint("❌ Period to avoid: Very cold or humid days, when the steam masks almost the entire basin."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📍 Why choose an excursion?"),
                    const SizedBox(height: 10),
                    _buildSectorText("Simplified access, organized transport, and exclusive photo tips."),
                    _buildSectorText("Valuable time saved to combine the site with other geysers or observe local wildlife."),

                    // Tarifs et Pass
                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Fees and Accepted Passes"),
                    const SizedBox(height: 10),
                    const Text("Summer: 35 dollars per vehicle. Winter: 30 dollars per vehicle.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const SizedBox(height: 10),
                    _buildSectorText("America the Beautiful Pass (National Parks)"),
                    _buildSectorText("Senior Pass"),
                    _buildSectorText("Military Pass"),
                    _buildSectorText("Free 4th Grade Pass (USA)"),

                    // Horaires et Saisons généraux
                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Hours and Crowds"),
                    const SizedBox(height: 10),
                    const Text("Open 24/7 all year, with services varying by season.", style: TextStyle(color: Colors.white70, fontSize: 15)),
                    const SizedBox(height: 25),
                    _buildBulletPoint("🌅 Recommended times: Prioritize dawn and dusk for light and wildlife observation."),
                    _buildBulletPoint("👥 Avoiding crowds: Visit major sites before 9:00 AM or after 6:00 PM to avoid crowds."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Crowds"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: September (tranquility) or mid-June to late August (full access)."),
                    _buildBulletPoint("❌ Period to avoid: July and August (peak attendance and saturated parking)."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Information"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before you leave."),
                    _buildBulletPoint("💧 Bring large water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("⚠️ Safety: Stay on the trails; hydrothermal water can cause severe burns."),
                    _buildBulletPoint("👣 Respect: Do not run and never touch fragile hydrothermal mats."),

                    const SizedBox(height: 20),
                    const Text(
                      "Note: The site is included in your Yellowstone National Park entrance fee.",
                      style: TextStyle(color: Colors.white70, fontSize: 12, fontStyle: FontStyle.italic),
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