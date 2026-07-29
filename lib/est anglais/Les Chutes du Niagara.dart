import 'package:flutter/material.dart';

const Color bleuMer = Colors.cyanAccent;

class NiagaraFallsPage extends StatelessWidget {
  final String title;

  const NiagaraFallsPage({super.key, required this.title});

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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/108.jpg', fit: BoxFit.fitWidth, width: double.infinity),
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
                        "Did you know: The phenomenal power of Niagara Falls finds a fascinating echo in the Iguazu Falls, between Brazil and Argentina 🇦🇷🇧🇷.",
                        style: TextStyle(color: bleuMer, fontSize: 15, fontStyle: FontStyle.italic),
                      ),
                    ),

                    const Text("🌊 Niagara Falls 🇨🇦🇺🇸", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    const Text(
                      "Majestic and historic, Niagara Falls is a symbol of natural power. They have long captivated the collective imagination and attract millions of visitors every year. Purchasing tickets allows you to explore their splendor and understand their cultural importance.",
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
                          _buildGalleryImage('assets/images/107.webp'),
                          _buildGalleryImage('assets/images/104.jpg'),
                          _buildGalleryImage('assets/images/105.jpg'),
                          _buildGalleryImage('assets/images/106.jpg'),
                          _buildGalleryImage('assets/images/110.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📍 What to see and do?"),
                    const SizedBox(height: 10),
                    _buildSubTitle("Iconic Falls"),
                    _buildSectorText("• Horseshoe Falls: 51m U-shaped falls, the most impressive."),
                    _buildSectorText("• American Falls: 260m wide, offering a beautiful panoramic view."),
                    _buildSectorText("• Bridal Veil Falls: The smallest and most delicate of the three cascades."),
                    _buildSubTitle("Immersive Experiences"),
                    _buildSectorText("• Cruise (Maid of the Mist / Hornblower): Legendary immersion at the foot of the falls."),
                    _buildSectorText("• Journey Behind the Falls: Historic tunnel beneath the Canadian cliff."),
                    _buildSectorText("• Cave of the Winds: Walkways on Goat Island with its 'Hurricane Deck' zone."),
                    _buildSubTitle("Viewpoints & Attractions"),
                    _buildSectorText("• Towers: Skylon Tower (236m) and American Observation Tower (86m)."),
                    _buildSectorText("• Niagara's Fury (4D): Fun show about geological formation."),
                    _buildSectorText("• White Water Walk: Trail along the most powerful rapids."),
                    _buildSectorText("• Whirlpool Aero Car: Historic cable car over the whirlpools."),

                    const SizedBox(height: 25),
                    _buildSectionTitle("📜 History"),
                    const SizedBox(height: 10),
                    const Text("Born 12,000 years ago after the last ice age, the falls were a spiritual site for First Nations. Documented by Louis Hennepin in 1678, they became a major tourist icon after the creation of the first state park in 1885.", style: TextStyle(color: Colors.white70, fontSize: 15)),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🕒 Opening Hours and Last Admission"),
                    const SizedBox(height: 10),
                    _buildSectorText("• May 01 – June 30: 09:00 AM – 06:00 PM (Last admission: 05:00 PM)"),
                    _buildSectorText("• July 01 – Aug 31: 08:00 AM – 08:00 PM (Last admission: 07:00 PM)"),
                    _buildSectorText("• Sept 01 – Oct 31: 09:00 AM – 06:30 PM (Last admission: 05:30 PM)"),
                    _buildSectorText("• Nov 01 – Feb 28: 10:00 AM – 04:00 PM (Last admission: 03:00 PM)"),
                    _buildSectorText("• Mar 01 – April 30: 09:30 AM – 05:30 PM (Last admission: 04:30 PM)"),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🚫 Closing Days"),
                    const SizedBox(height: 10),
                    _buildSectorText("• December 25: Christmas"),
                    _buildSectorText("• January 01: New Year's Day"),
                    _buildSectorText("• March 15: Technical Inspection"),

                    const SizedBox(height: 25),
                    _buildSectionTitle("🎒 Practical Tips"),
                    const SizedBox(height: 10),
                    _buildBulletPoint("🌤️ Always check the weather before you leave."),
                    _buildBulletPoint("💧 Bring plenty of water."),
                    _buildBulletPoint("📸 Don't forget your camera!"),
                    _buildBulletPoint("🧥 Bring waterproof clothing or use the ponchos provided."),
                    _buildBulletPoint("🎟️ Buy your tickets online to avoid waiting (approx. 90 dollars)."),

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
    return Padding(padding: const EdgeInsets.only(bottom: 10.0), child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: bleuMer)));
  }

  Widget _buildSubTitle(String title) {
    return Padding(padding: const EdgeInsets.only(top: 10.0, bottom: 5.0), child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)));
  }

  Widget _buildSectorText(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 4.0), child: Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)));
  }

  Widget _buildBulletPoint(String text) {
    return Padding(padding: const EdgeInsets.only(bottom: 8.0), child: Text("• $text", style: const TextStyle(color: Colors.white70, fontSize: 15)));
  }
}