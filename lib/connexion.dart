import 'package:flutter/material.dart';

// Importations avec alias pour éviter la collision
import 'package:usa/francais/ouest.dart' as fr_ouest;
import 'package:usa/francais/est.dart' as fr_est;
import 'package:usa/anglais/ouest.dart' as en_ouest;
import 'package:usa/anglais/est.dart' as en_est;

/// Palette « veille de route » : nuit bleutée, sable chaud,
/// ambre du désert pour l'Ouest et vert pin pour l'Est.
class _Palette {
  static const ink = Color(0xFF0E1820);
  static const sand = Color(0xFFF2E6D0);
  static const canyon = Color(0xFFF2A55A);
  static const pine = Color(0xFF8BD3B0);
}

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage>
    with SingleTickerProviderStateMixin {
  bool isFrench = true;
  bool _introStarted = false;

  // Une seule séquence d'entrée orchestrée : titre, puis Ouest, route, Est.
  late final AnimationController _intro;
  late final Animation<double> _heroFade;
  late final Animation<Offset> _heroSlide;
  late final Animation<double> _westReveal;
  late final Animation<double> _roadReveal;
  late final Animation<double> _eastReveal;

  static const Map<String, Map<String, String>> _texts = {
    'FR': {
      'title': 'Road Trip USA',
      'subtitle': "Explorez l'horizon",
      'desc':
      "Vivez l'aventure américaine au cœur de la nature. Choisissez votre route et partez.",
      'choose': 'Choisissez votre route',
      'west_title': 'Ouest américain',
      'west_sub': 'Canyons, déserts et côte Pacifique',
      'west_loc': 'Découvrir',
      'east_title': 'Est américain',
      'east_sub': 'Forêts, villes historiques et côte Atlantique',
      'east_loc': 'Découvrir',
    },
    'EN': {
      'title': 'Road Trip USA',
      'subtitle': 'Explore the horizon',
      'desc':
      'Experience the American adventure in the heart of nature. Pick your route and go.',
      'choose': 'Choose your route',
      'west_title': 'American West',
      'west_sub': 'Canyons, deserts and the Pacific coast',
      'west_loc': 'Discover',
      'east_title': 'American East',
      'east_sub': 'Forests, historic cities and the Atlantic coast',
      'east_loc': 'Discover',
    },
  };

  @override
  void initState() {
    super.initState();

    _intro = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _heroFade = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.0, 0.45, curve: Curves.easeOut),
    );
    _heroSlide = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _intro,
        curve: const Interval(0.0, 0.45, curve: Curves.easeOutCubic),
      ),
    );

    _westReveal = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOutCubic),
    );
    _roadReveal = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.5, 0.85, curve: Curves.easeInOut),
    );
    _eastReveal = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.6, 1.0, curve: Curves.easeOutCubic),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_introStarted) return;
    _introStarted = true;

    // Respect de l'option « réduire les animations » du système.
    if (MediaQuery.disableAnimationsOf(context)) {
      _intro.value = 1;
    } else {
      _intro.forward();
    }
  }

  @override
  void dispose() {
    _intro.dispose();
    super.dispose();
  }

  String get favorisKey => isFrench ? 'favoris_fr' : 'favoris_en';

  String getRegionFavorisKey(String region) => '${favorisKey}_$region';

  void _openRegion(String region) {
    final key = getRegionFavorisKey(region);
    final isWest = region == 'ouest';

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          if (isWest) {
            return isFrench
                ? fr_ouest.OuestPage(favorisKey: key, isFrench: isFrench)
                : en_ouest.OuestPage(favorisKey: key, isFrench: isFrench);
          }
          return isFrench
              ? fr_est.EstPage(favorisKey: key, isFrench: isFrench)
              : en_est.EstPage(favorisKey: key, isFrench: isFrench);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = _texts[isFrench ? 'FR' : 'EN']!;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: _Palette.ink,
      body: Stack(
        children: [
          // 1. IMAGE D'EN-TÊTE qui se fond dans la nuit
          SizedBox(
            height: height * 0.55,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white, Colors.transparent],
                    stops: [0.0, 0.45, 1.0],
                  ).createShader(rect),
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/images/7.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                // Voile sombre en haut pour la lisibilité du titre
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        _Palette.ink.withOpacity(0.6),
                        _Palette.ink.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2. CONTENU
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sélecteur de langue
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: _buildLanguageToggle(),
                    ),
                  ),

                  SizedBox(height: height * 0.12),

                  // Hero typographique
                  FadeTransition(
                    opacity: _heroFade,
                    child: SlideTransition(
                      position: _heroSlide,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t['title']!,
                              style: const TextStyle(
                                fontFamily: 'DMSerifDisplay',
                                fontSize: 58,
                                height: 0.98,
                                letterSpacing: -0.5,
                                color: _Palette.sand,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              t['subtitle']!,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: _Palette.canyon,
                              ),
                            ),
                            const SizedBox(height: 14),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 320),
                              child: Text(
                                t['desc']!,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14.5,
                                  height: 1.6,
                                  color: _Palette.sand.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.07),

                  // Titre de section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      t['choose']!,
                      style: const TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        fontSize: 24,
                        color: _Palette.sand,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Les deux régions reliées par une route
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildRegionCard(
                          region: 'ouest',
                          title: t['west_title']!,
                          subtitle: t['west_sub']!,
                          btnText: t['west_loc']!,
                          imagePath: 'assets/images/1.jpg',
                          accent: _Palette.canyon,
                          icon: Icons.wb_sunny_outlined,
                          reveal: _westReveal,
                        ),
                        _RoadConnector(progress: _roadReveal),
                        _buildRegionCard(
                          region: 'est',
                          title: t['east_title']!,
                          subtitle: t['east_sub']!,
                          btnText: t['east_loc']!,
                          imagePath: 'assets/images/111.webp',
                          accent: _Palette.pine,
                          icon: Icons.park_outlined,
                          reveal: _eastReveal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- CARTE DE RÉGION ---
  Widget _buildRegionCard({
    required String region,
    required String title,
    required String subtitle,
    required String btnText,
    required String imagePath,
    required Color accent,
    required IconData icon,
    required Animation<double> reveal,
  }) {
    return FadeTransition(
      opacity: reveal,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.08),
          end: Offset.zero,
        ).animate(reveal),
        child: Semantics(
          button: true,
          label: '$title. $subtitle',
          child: Container(
            height: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.45),
                  blurRadius: 30,
                  offset: const Offset(0, 14),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _openRegion(region),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(imagePath, fit: BoxFit.cover),

                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              _Palette.ink.withOpacity(0.1),
                              _Palette.ink.withOpacity(0.92),
                            ],
                            stops: const [0.25, 1.0],
                          ),
                        ),
                      ),

                      // Pastille d'icône, couleur de la région
                      Positioned(
                        top: 18,
                        left: 18,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _Palette.ink.withOpacity(0.5),
                            border: Border.all(color: accent.withOpacity(0.7)),
                          ),
                          child: Icon(icon, color: accent, size: 20),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontFamily: 'DMSerifDisplay',
                                fontSize: 30,
                                height: 1.05,
                                color: _Palette.sand,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              subtitle,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 13.5,
                                height: 1.4,
                                color: _Palette.sand.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              children: [
                                Text(
                                  btnText,
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: accent,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: accent,
                                  size: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- SÉLECTEUR DE LANGUE ---
  Widget _buildLanguageToggle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLanguageTab('FR', 'Français'),
        const SizedBox(width: 22),
        _buildLanguageTab('EN', 'English'),
      ],
    );
  }

  Widget _buildLanguageTab(String code, String label) {
    final isActive = (code == 'FR') == isFrench;

    return Semantics(
      button: true,
      selected: isActive,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => setState(() => isFrench = code == 'FR'),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive
                      ? _Palette.sand
                      : _Palette.sand.withOpacity(0.45),
                ),
                child: Text(label),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
                height: 2,
                width: isActive ? 24 : 0,
                decoration: BoxDecoration(
                  color: _Palette.canyon,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- TRACÉ DE ROUTE ENTRE LES DEUX CARTES ---
class _RoadConnector extends StatelessWidget {
  const _RoadConnector({required this.progress});

  final Animation<double> progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: progress,
        builder: (context, _) => CustomPaint(
          painter: _RoadPainter(progress.value),
        ),
      ),
    );
  }
}

class _RoadPainter extends CustomPainter {
  _RoadPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;

    final x = size.width / 2;
    final end = size.height * progress;

    final dash = Paint()
      ..color = _Palette.sand.withOpacity(0.35)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (double y = 0; y < end; y += 12) {
      final yEnd = y + 6 > end ? end : y + 6;
      canvas.drawLine(Offset(x, y), Offset(x, yEnd), dash);
    }

    // Position du véhicule sur la route
    canvas.drawCircle(
      Offset(x, end),
      4,
      Paint()..color = _Palette.canyon,
    );
  }

  @override
  bool shouldRepaint(covariant _RoadPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}