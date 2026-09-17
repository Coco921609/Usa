import 'dart:ui';
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

class _ConnexionPageState extends State<ConnexionPage> with TickerProviderStateMixin {
  bool isFrench = true;

  // Contrôleurs pour les animations
  late AnimationController _entranceController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Contrôleur pour le fond qui respire (zoom lent)
  late AnimationController _breathingController;
  late Animation<double> _scaleAnimation;

  // Contrôleur pour le slider horizontal (Carousel)
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    // 1. Animation d'entrée (Fade & Slide)
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _entranceController, curve: Curves.easeOut),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: _entranceController, curve: Curves.easeOutQuart),
    );

    // 2. Animation de respiration du fond
    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _breathingController, curve: Curves.easeInOutSine),
    );

    // 3. PageController pour le carousel horizontal
    _pageController = PageController(viewportFraction: 0.85);

    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _breathingController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  String get favorisKey => isFrench ? 'favoris_fr' : 'favoris_en';

  String getRegionFavorisKey(String region) {
    return '${favorisKey}_$region';
  }

  final Map<String, Map<String, String>> texts = {
    'FR': {
      'title': 'Road Trip Usa',
      'subtitle': 'Explorez l\'horizon', // Première lettre en majuscule
      'desc': 'Vivez l\'aventure Américaine au cœur de la nature. Balayez pour découvrir nos merveilles.',
      'west_title': 'Ouest Américain',
      'west_loc': 'Découvrir',
      'east_title': 'Est Américain',
      'east_loc': 'Découvrir',
    },
    'EN': {
      'title': 'Road Trip Usa',
      'subtitle': 'Explore the horizon', // Première lettre en majuscule
      'desc': 'Experience the American adventure in the heart of nature. Swipe to discover our wonders.',
      'west_title': 'American West',
      'west_loc': 'Discover',
      'east_title': 'American East',
      'east_loc': 'Discover',
    }
  };

  @override
  Widget build(BuildContext context) {
    final t = texts[isFrench ? 'FR' : 'EN']!;

    return Scaffold(
      backgroundColor: const Color(0xFF070709),
      body: Stack(
        children: [
          // 1. IMAGE DE FOND ANIMÉE
          Positioned.fill(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Image.asset(
                'assets/images/7.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. DÉGRADÉ PREMIUM
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF070709).withOpacity(0.5),
                    const Color(0xFF070709).withOpacity(0.8),
                    const Color(0xFF070709).withOpacity(0.95),
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),

          // 3. CONTENU PRINCIPAL
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    // --- EN-TÊTE ---
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 20.0),
                      child: Column(
                        children: [
                          Text(
                            t['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 42,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 2.5,
                              color: Colors.white,
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            t['subtitle']!,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13,
                              color: Colors.cyanAccent,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            t['desc']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.7),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // --- CAROUSEL HORIZONTAL ---
                    SizedBox(
                      height: 380,
                      child: PageView(
                        controller: _pageController,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildHeroCard(
                            title: t['west_title']!,
                            btnText: t['west_loc']!,
                            imagePath: 'assets/images/1.jpg',
                            region: 'ouest',
                          ),
                          _buildHeroCard(
                            title: t['east_title']!,
                            btnText: t['east_loc']!,
                            imagePath: 'assets/images/111.webp',
                            region: 'est',
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    // --- SÉLECTEUR DE LANGUE ---
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: _buildLanguageToggle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WIDGET : GRANDE CARTE HERO ---
  Widget _buildHeroCard({required String title, required String btnText, required String imagePath, required String region}) {
    String uniqueKey = getRegionFavorisKey(region);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
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
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36.0),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.9),
                      ],
                      stops: const [0.3, 0.6, 1.0],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 24,
                right: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                btnText,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_rounded, color: Colors.cyanAccent, size: 18),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET : CAPSULE DE LANGUE ---
  Widget _buildLanguageToggle() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageTab('FR', 'Français', '🇫🇷'),
              const SizedBox(width: 6),
              _buildLanguageTab('EN', 'English', '🇺🇸'),
            ],
          ),
        ),
      ),
    );
  }

  // --- WIDGET : ONGLET INDIVIDUEL DE LANGUE ---
  Widget _buildLanguageTab(String code, String label, String flagEmoji) {
    bool isActive = (isFrench && code == 'FR') || (!isFrench && code == 'EN');

    return GestureDetector(
      onTap: () {
        setState(() {
          isFrench = (code == 'FR');
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.cyan.withOpacity(0.25) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isActive ? Colors.cyanAccent.withOpacity(0.4) : Colors.transparent,
            width: 1,
          ),
          boxShadow: isActive
              ? [BoxShadow(color: Colors.cyanAccent.withOpacity(0.15), blurRadius: 12, spreadRadius: 1)]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(flagEmoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: isActive ? Colors.white : Colors.white60,
                fontSize: 14,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}