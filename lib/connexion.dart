import 'package:flutter/material.dart';
// Importations avec alias pour éviter la collision
import '../francais/ouest.dart' as fr_ouest;
import '../francais/est.dart' as fr_est;
import '../anglais/ouest.dart' as en_ouest;
import '../anglais/est.dart' as en_est;

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  bool isFrench = true;

  String get favorisKey => isFrench ? 'favoris_fr' : 'favoris_en';

  String getRegionFavorisKey(String region) {
    return '${favorisKey}_$region';
  }

  final Map<String, Map<String, String>> texts = {
    'FR': {
      'title': 'Road Trip Usa',
      'subtitle': 'Ouest & Est',
      'desc': 'Vivez l\'aventure Américaine au cœur de la nature. Explorez les merveilles naturelles, des sommets de l\'Est aux formations géologiques de l\'Ouest.',
      'west_title': 'Ouest Américain',
      'west_loc': 'Cliquez pour découvrir',
      'east_title': 'Est Américain',
      'east_loc': 'Cliquez pour découvrir',
    },
    'EN': {
      'title': 'Road Trip Usa',
      'subtitle': 'West & East',
      'desc': 'Experience the American adventure in the heart of nature. Explore natural wonders from the peaks of the East to the geological formations of the West.',
      'west_title': 'American West',
      'west_loc': 'Click to discover',
      'east_title': 'American East',
      'east_loc': 'Click to discover',
    }
  };

  @override
  Widget build(BuildContext context) {
    final t = texts[isFrench ? 'FR' : 'EN']!;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF121418),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Partie Haute : Image + Textes descriptifs
                  Column(
                    children: [
                      ClipPath(
                        clipper: WaveClipper(),
                        child: Image.asset(
                          'assets/images/7.jpg',
                          width: double.infinity,
                          height: screenHeight * 0.30, // Ajusté à 0.30 pour que le bas de l'écran respire parfaitement
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              t['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 2.0,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                              decoration: BoxDecoration(
                                color: Colors.cyan.shade400.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.cyan.shade300.withOpacity(0.3)),
                              ),
                              child: Text(
                                t['subtitle']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.cyan.shade300,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              t['desc']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white70,
                                height: 1.4,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Partie Milieu : Les cartes de destinations
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildDestinationCard(
                            title: t['west_title']!,
                            location: t['west_loc']!,
                            imagePath: 'assets/images/1.jpg',
                            region: 'ouest',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDestinationCard(
                            title: t['east_title']!,
                            location: t['east_loc']!,
                            imagePath: 'assets/images/111.webp',
                            region: 'est',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Partie Basse : Sélection des langues (S'affiche désormais en entier !)
                  SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildLanguageCircle('FR', 'Français', '🇫🇷'),
                          const SizedBox(width: 40),
                          _buildLanguageCircle('EN', 'English', '🇺🇸'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLanguageCircle(String code, String label, String flagEmoji) {
    bool isActive = (isFrench && code == 'FR') || (!isFrench && code == 'EN');

    return GestureDetector(
      onTap: () {
        setState(() {
          isFrench = (code == 'FR');
        });
      },
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: isActive ? Colors.cyan.shade400.withOpacity(0.2) : Colors.grey.shade900,
              shape: BoxShape.circle,
              border: Border.all(
                color: isActive ? Colors.cyan.shade400 : Colors.grey.shade800,
                width: isActive ? 2.5 : 1.0,
              ),
              boxShadow: isActive
                  ? [BoxShadow(color: Colors.cyan.withOpacity(0.2), blurRadius: 10, spreadRadius: 2)]
                  : [],
            ),
            child: Center(
              child: Text(
                flagEmoji,
                style: const TextStyle(fontSize: 28),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.cyan.shade300 : Colors.grey.shade600,
              fontSize: 13,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard({required String title, required String location, required String imagePath, required String region}) {
    String uniqueKey = getRegionFavorisKey(region);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              if (region == 'ouest') {
                return isFrench
                    ? fr_ouest.OuestPage(favorisKey: uniqueKey, isFrench: isFrench)
                    : en_ouest.OuestPage(favorisKey: uniqueKey, isFrench: isFrench);
              } else {
                return isFrench
                    ? fr_est.EstPage(favorisKey: uniqueKey, isFrench: isFrench)
                    : en_est.EstPage(favorisKey: uniqueKey, isFrench: isFrench);
              }
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: const Color(0xFF1E2128),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
              child: Image.asset(imagePath, height: 120, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 2.0), child: Icon(Icons.touch_app_rounded, size: 14, color: Colors.cyan.shade300)),
                      const SizedBox(width: 6),
                      Expanded(child: Text(location, style: TextStyle(fontSize: 12, color: Colors.cyan.shade300, fontWeight: FontWeight.w600))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    var secondControlPoint = Offset(size.width - (size.width / 4), size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}