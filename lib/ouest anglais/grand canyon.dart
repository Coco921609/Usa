import 'package:flutter/material.dart';

// Definition of the color used for titles
const Color bleuMer = Colors.cyanAccent;

class GrandCanyonPage extends StatelessWidget {
  final String title;

  const GrandCanyonPage({super.key, required this.title});

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
                    'assets/images/6.jpg',
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
                        "Did you know: There is a place similar to the Grand Canyon called Kings Canyon, Australia 🇦🇺: This site reminds us of the beauty of the rock formations.",
                        style: TextStyle(color: Colors.cyanAccent, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🏜️ The Grand Canyon 🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Located in the heart of Arizona, the Grand Canyon is a geological wonder that fascinates travelers from around the world. Stretching over 450 km, this majestic site unveils a nature that is both wild and spectacular, enhanced by rocks with flamboyant hues oscillating between pink and orange.",
                      style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.5),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Opening Hours"),
                    const SizedBox(height: 10),
                    const Text(
                      "The park is open 24/7 all year round. Visitor facilities operate from 7:00 AM to 6:00 PM (May to September) and 8:00 AM to 5:00 PM (low season).",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🌅 Photo Tips: Sunrise and Sunset"),
                    const SizedBox(height: 10),
                    const Text(
                      "For unforgettable photos, take advantage of the golden hour: arrive at least 45 minutes before sunrise or sunset to capture the changing light on the canyon walls.",
                      style: TextStyle(color: Colors.white70, fontSize: 15),
                    ),

                    // PHOTO GALLERY (Horizontal Scroll)
                    const SizedBox(height: 25),
                    _buildSectionTitle('📸 Location Overview'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/3.jpg'),
                          _buildGalleryImage('assets/images/4.jpg'),
                          _buildGalleryImage('assets/images/5.jpg'),
                          _buildGalleryImage('assets/images/6.jpg'),
                          _buildGalleryImage('assets/images/5.jpg'),
                          _buildGalleryImage('assets/images/8.webp'),
                          _buildGalleryImage('assets/images/9.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🗓️ Seasons and Crowds"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("✅ Recommended season: Spring (April-May) or Autumn (September-October) for pleasant weather."),
                    _buildBulletPoint("❌ Period to avoid for crowds: July and August (very high traffic and intense heat)."),
                    _buildBulletPoint("💡 Tip: Visit the North Rim if you are looking for peace and quiet; it is less crowded than the South Rim."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("💰 Fees and Tickets (Cashless)"),
                    const SizedBox(height: 10),
                    _buildTarifTable(),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Information"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before you leave."),
                    _buildBulletPoint("💧 Bring plenty of water supplies."),
                    _buildBulletPoint("📸 Don't forget your camera!"),

                    const SizedBox(height: 20),
                    const Text(
                      "Attention: Hours and prices may change throughout the year.",
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

  // Helper for gallery images
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

  Widget _buildTarifTable() {
    return Table(
      border: TableBorder.all(color: Colors.white24),
      children: [
        _buildTableRow("Category", "Price", isHeader: true),
        _buildTableRow("Vehicle (7 days)", "30 \$"),
        _buildTableRow("Motorcycle", "25 \$"),
        _buildTableRow("Individual", "15 \$"),
      ],
    );
  }

  TableRow _buildTableRow(String col1, String col2, {bool isHeader = false}) {
    return TableRow(
      children: [
        TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(col1, style: TextStyle(color: Colors.white, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)))),
        TableCell(child: Padding(padding: const EdgeInsets.all(8.0), child: Text(col2, style: TextStyle(color: Colors.white70, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)))),
      ],
    );
  }
}