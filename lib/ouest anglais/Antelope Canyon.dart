import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class AntelopeCanyonPage extends StatelessWidget {
  final String title;

  const AntelopeCanyonPage({super.key, required this.title});

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
                  child: Image.asset('assets/images/57.webp', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Did you know: The fascinating beauty of Antelope Canyon finds a spectacular echo in the Siq Gorges of Petra, Jordan 🇯🇴.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🏜️ Antelope Canyon 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "A masterpiece sculpted by water and wind, Antelope Canyon is a sacred site located on Navajo lands. Its undulating walls and changing colors offer one of the most photographed natural spectacles in the world.",
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
                          _buildGalleryImage('assets/images/51.jpg'),
                          _buildGalleryImage('assets/images/52.jpg'),
                          _buildGalleryImage('assets/images/54.webp'),
                          _buildGalleryImage('assets/images/55.jpg'),
                          _buildGalleryImage('assets/images/56.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Visit Schedules and Durations"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("Upper Antelope Canyon: 8 AM-6 PM (Apr-Sep), 9 AM-4 PM (Oct-Mar). Duration: 1h30 to 2h."),
                    _buildBulletPoint("Lower Antelope Canyon: 7:45 AM-4:15 PM. Duration: 1h15."),
                    _buildBulletPoint("Canyon X and others: Departures between 7:30 AM and 8 AM. Duration: approx. 2h."),
                    _buildBulletPoint("Secret Antelope Canyon: Duration approx. 3h30 (including Horseshoe Bend)."),
                    const SizedBox(height: 10),
                    _buildSectorText("For multiple canyons in the same day: allow 6 to 8 hours."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Recommended Times (Light & Calm)"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("📸 For light beams: March to October, between 10 AM and 1 PM (solar zenith)."),
                    _buildBulletPoint("🌅 Sunrise / Sunset: Ideal for soft hues and a magical atmosphere."),
                    _buildBulletPoint("👥 Avoiding crowds: Prioritize early morning or late afternoon visits."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons: Recommendations"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Off-season (November to February) to avoid crowds."),
                    _buildBulletPoint("❌ Period to avoid: Peak season (May to September) with temperatures up to 37°C."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips & Regulations"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before leaving."),
                    _buildBulletPoint("💧 Bring plenty of water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("👣 Guided tour: Mandatory with a licensed Navajo guide."),
                    _buildBulletPoint("🎟️ Booking: Essential several weeks in advance."),
                    _buildBulletPoint("⏰ Arrival: 45 min before your slot for the briefing."),
                    _buildBulletPoint("👕 Equipment: Closed-toe shoes, sun/sand protection."),
                    _buildBulletPoint("⚠️ Restrictions: Bags, tripods, and selfie sticks are prohibited."),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Schedules and rates may change throughout the year. Check for updates before booking.",
                      style: TextStyle(color: Colors.redAccent, fontSize: 12, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Note: Antelope Canyon is a protected and sacred site. Please respect your Navajo guides' instructions.",
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