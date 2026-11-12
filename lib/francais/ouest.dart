import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usa/ouest/grand%20canyon.dart';
import 'package:usa/ouest/Monument%20Valley.dart';
import 'package:usa/ouest/Yellowstone.dart';
import 'package:usa/ouest/Death%20Valley.dart';
import 'package:usa/ouest/Antelope%20Canyon.dart';
import 'package:usa/ouest/Canyonlands.dart';
import 'package:usa/ouest/Bryce%20Canyon.dart';
import 'package:usa/ouest/Dunes%20Peintes.dart';
import 'package:usa/ouest/Fly%20Ranch%20Geyser.dart';
import 'package:usa/ouest/La%20Vague%20P%C3%A9trifi%C3%A9e.dart';
import 'package:usa/ouest/Parc%20National%20de%20Zion.dart';
import 'package:usa/ouest/Lac Mono.dart';
import 'package:usa/ouest/Page%20et%20le%20Lac%20Powell.dart';

/// Palette « désert au coucher du soleil » :
/// nuit de terre, sable chaud, ambre du canyon, braise et rose doux.
class _Palette {
  static const night = Color(0xFF140B08);
  static const deep = Color(0xFF24150F);
  static const sand = Color(0xFFF7E9D7);
  static const amber = Color(0xFFF2A55A);
  static const ember = Color(0xFFE8714A);
  static const rose = Color(0xFFFF8F8F);
  static const paper = Color(0xFFFBF2E6);
  static const ink = Color(0xFF2A140C);
  static const muted = Color(0xFF8A6A5C);
}

class OuestPage extends StatefulWidget {
  final String favorisKey;
  final bool isFrench;

  const OuestPage({
    super.key,
    required this.favorisKey,
    required this.isFrench,
  });

  @override
  State<OuestPage> createState() => _OuestPageState();
}

class _OuestPageState extends State<OuestPage>
    with SingleTickerProviderStateMixin {
  bool _showFavorites = false;
  List<String> _favoritedNames = [];
  bool _introStarted = false;

  // Une seule entrée orchestrée : le soleil se couche, les mesas montent, puis le titre.
  late final AnimationController _intro;
  late final Animation<double> _titleFade;

  // Liste complète des 13 destinations de l'Ouest
  final List<Map<String, dynamic>> destinations = [
    {
      'nom': 'Grand Canyon',
      'image': 'assets/images/7.jpg',
      'desc':
      "Une gorge immense creusée par le fleuve Colorado, offrant des panoramas spectaculaires aux couleurs flamboyantes.",
      'couleur': const Color(0xFFF2A55A),
      'lieu': 'Arizona, USA',
      'sosie': 'Kings Canyon, Australie',
      'page': const GrandCanyonPage(title: 'Grand Canyon'),
    },
    {
      'nom': 'Monument Valley',
      'image': 'assets/images/16.webp',
      'desc':
      "Un paysage emblématique de l'Ouest américain avec ses célèbres buttes de grès rouge.",
      'couleur': const Color(0xFFE8714A),
      'lieu': 'Utah / Arizona, USA',
      'sosie': 'Désert de Wadi Rum, Jordanie',
      'page': const MonumentValleyPage(title: 'Monument Valley'),
    },
    {
      'nom': 'Yellowstone',
      'image': 'assets/images/21.jpg',
      'desc':
      "Le plus ancien parc national du monde, célèbre pour sa faune sauvage et ses phénomènes géothermiques.",
      'couleur': const Color(0xFF7FD1C7),
      'lieu': 'Wyoming, USA',
      'sosie': 'Geysers de Geysir, Islande',
      'page': const YellowstonePage(title: 'Yellowstone'),
    },
    {
      'nom': 'Death Valley',
      'image': 'assets/images/42.webp',
      'desc':
      "Le point le plus bas, le plus chaud et le plus sec d'Amérique du Nord, aux paysages lunaires.",
      'couleur': const Color(0xFFF5C26B),
      'lieu': 'Californie, USA',
      'sosie': 'Dunes de Merzouga, Sahara',
      'page': const DeathValleyPage(title: 'Death Valley'),
    },
    {
      'nom': 'Antelope Canyon',
      'image': 'assets/images/49.webp',
      'desc':
      "Un canyon en fente spectaculaire, sculpté par l'eau et illuminé par des faisceaux de lumière magiques.",
      'couleur': const Color(0xFFFF9466),
      'lieu': 'Arizona, USA',
      'sosie': 'Gorges du Siq de Pétra, Jordanie',
      'page': const AntelopeCanyonPage(title: 'Antelope Canyon'),
    },
    {
      'nom': 'Canyonlands',
      'image': 'assets/images/58.jpg',
      'desc':
      "Un vaste paysage de canyons, de mesas et de buttes creusé par le fleuve Colorado et la Green River.",
      'couleur': const Color(0xFFC9946B),
      'lieu': 'Utah, USA',
      'sosie': 'Massif des Bungle Bungle, Australie',
      'page': const CanyonlandsPage(title: 'Canyonlands'),
    },
    {
      'nom': 'Bryce Canyon',
      'image': 'assets/images/64.jpg',
      'desc':
      'Un amphithéâtre naturel rempli de "hoodoos" (cheminées de fées) aux teintes rouges et oranges.',
      'couleur': const Color(0xFFFF8A4C),
      'lieu': 'Utah, USA',
      'sosie': 'Cheminées de Fée de Cappadoce, Turquie',
      'page': const BryceCanyonPage(title: 'Bryce Canyon'),
    },
    {
      'nom': 'Dunes Peintes',
      'image': 'assets/images/72.webp',
      'desc':
      "Des dunes volcaniques aux couleurs étonnantes situées près du pic Lassen.",
      'couleur': const Color(0xFFC79BE8),
      'lieu': 'Californie, USA',
      'sosie': 'Volcan Landmannalaugar, Islande',
      'page': const LassenDunesPage(title: 'Dunes Peintes'),
    },
    {
      'nom': 'Fly Ranch Geyser',
      'image': 'assets/images/80.webp',
      'desc':
      "Un geyser accidentel, aux couleurs vives créées par des algues thermophiles.",
      'couleur': const Color(0xFF9BE8A4),
      'lieu': 'Nevada, USA',
      'sosie': 'Sources Chaudes de Hveravellir, Islande',
      'page': const FlyGeyserPage(title: 'Fly Ranch Geyser'),
    },
    {
      'nom': 'La Vague Pétrifiée',
      'image': 'assets/images/81.webp',
      'desc':
      "Une formation rocheuse de grès aux ondulations parfaites, très prisée des photographes.",
      'couleur': const Color(0xFFF4A3B5),
      'lieu': 'Arizona, USA',
      'sosie': 'Wave Rock, Australie',
      'page': const WavePetrifieePage(title: 'La Vague Pétrifiée'),
    },
    {
      'nom': 'Parc National de Zion',
      'image': 'assets/images/89.webp',
      'desc':
      "Un canyon profond aux falaises de grès rouge, rose et blanc s'élevant vers le ciel.",
      'couleur': const Color(0xFFFF7A59),
      'lieu': 'Utah, USA',
      'sosie': 'Montagnes de Zhangjiajie, Chine',
      'page': const ZionParkPage(title: 'Parc National de Zion'),
    },
    {
      'nom': 'Lac Mono',
      'image': 'assets/images/95.jpg',
      'desc':
      "Un lac salé ancien, connu pour ses étranges tours de tuf calcaire émergeant de l'eau.",
      'couleur': const Color(0xFF8ED8E8),
      'lieu': 'Californie, USA',
      'sosie': 'Cheminées du Lac Abhé, Djibouti',
      'page': const MonoLakePage(title: 'Lac Mono'),
    },
    {
      'nom': 'Page et le Lac Powell',
      'image': 'assets/images/98.jpg',
      'desc':
      "Un immense lac artificiel aux eaux bleues contrastant avec les falaises de roches rouges.",
      'couleur': const Color(0xFF6FA8E8),
      'lieu': 'Arizona, USA',
      'sosie': 'Rives du Lac Nasser, Égypte',
      'page': const PageAndPowellPage(title: 'Page et le Lac Powell'),
    },
  ];

  @override
  void initState() {
    super.initState();

    _intro = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _titleFade = CurvedAnimation(
      parent: _intro,
      curve: const Interval(0.35, 1.0, curve: Curves.easeOut),
    );

    _loadFavorites();
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

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _favoritedNames = prefs.getStringList(widget.favorisKey) ?? [];
    });
  }

  Future<void> _toggleFavorite(String name) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_favoritedNames.contains(name)) {
        _favoritedNames.remove(name);
      } else {
        _favoritedNames.add(name);
      }
    });
    await prefs.setStringList(widget.favorisKey, _favoritedNames);
  }

  void _handleBack() {
    if (_showFavorites) {
      setState(() => _showFavorites = false);
    } else {
      Navigator.of(context).pop();
    }
  }

  void _openDetail(Map<String, dynamic> item) {
    Navigator.push(context, _fadeRoute(item['page'] as Widget));
  }

  Future<void> _launchMapDirectly(String destination) async {
    final encodedQuery = Uri.encodeComponent(destination);
    Uri uri;

    if (Platform.isAndroid) {
      uri = Uri.parse('geo:0,0?q=$encodedQuery');
    } else if (Platform.isIOS) {
      uri = Uri.parse('maps://?q=$encodedQuery');
    } else {
      uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedQuery');
    }

    try {
      bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalNonBrowserApplication,
      );

      if (!launched) {
        await launchUrl(
          Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedQuery'),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      await launchUrl(
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedQuery'),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final favorites = destinations
        .where((item) => _favoritedNames.contains(item['nom']))
        .toList();

    return Theme(
      // Pas d'ondes de clic : les retours visuels sont propres à cette page
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
      ),
      child: PopScope(
        canPop: !_showFavorites,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          setState(() => _showFavorites = false);
        },
        child: Scaffold(
          backgroundColor: _Palette.night,
          body: Stack(
            children: [
              const Positioned.fill(child: _AmbientGlow()),
              SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(favorites.length),
                      const SizedBox(height: 22),
                      _buildSegmented(favorites.length),
                      const SizedBox(height: 30),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 420),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeIn,
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.03),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          );
                        },
                        child: _showFavorites
                            ? _buildFavorites(favorites)
                            : _buildBrowse(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- EN-TÊTE : mesas, soleil couchant et titre ---
  Widget _buildHeader(int favoriteCount) {
    final subtitle = favoriteCount == 0
        ? 'Votre carnet de voyage'
        : favoriteCount == 1
        ? '1 destination sauvegardée'
        : '$favoriteCount destinations sauvegardées';

    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _intro,
              builder: (context, child) =>
                  CustomPaint(painter: _MesaPainter(_intro.value)),
            ),
          ),
          Positioned(
            top: 8,
            left: 16,
            child: _CircleButton(
              label: 'Retour',
              onTap: _handleBack,
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 34,
            child: FadeTransition(
              opacity: _titleFade,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 320),
                child: Column(
                  key: ValueKey<bool>(_showFavorites),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _showFavorites ? 'Mes favoris' : 'Ouest américain',
                      style: const TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        fontSize: 50,
                        height: 1.0,
                        letterSpacing: -0.8,
                        color: _Palette.sand,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _showFavorites
                          ? subtitle
                          : 'Canyons, déserts et géants de pierre',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: _Palette.amber.withOpacity(0.9),
                      ),
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

  // --- SÉLECTEUR EXPLORER / FAVORIS ---
  Widget _buildSegmented(int favoriteCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: _Palette.deep,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: Colors.white.withOpacity(0.06)),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildSegment(
                label: 'Explorer',
                icon: Icons.explore_outlined,
                selected: !_showFavorites,
                onTap: () => setState(() => _showFavorites = false),
              ),
            ),
            Expanded(
              child: _buildSegment(
                label: 'Favoris',
                icon: Icons.favorite_border_rounded,
                selected: _showFavorites,
                count: favoriteCount,
                onTap: () => setState(() => _showFavorites = true),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegment({
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
    int count = 0,
  }) {
    final foreground = selected ? _Palette.night : _Palette.sand.withOpacity(0.7);

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? _Palette.amber : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 17, color: foreground),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: foreground,
                ),
              ),
              if (count > 0) ...[
                const SizedBox(width: 8),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
                  decoration: BoxDecoration(
                    color: selected ? _Palette.night : _Palette.rose,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: selected ? _Palette.amber : _Palette.night,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // --- MODE EXPLORER ---
  Widget _buildBrowse() {
    final feature = destinations.first;
    final others = destinations.skip(1).toList();

    return Column(
      key: const ValueKey<String>('browse'),
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _FeatureCard(
            item: feature,
            isFavorite: _favoritedNames.contains(feature['nom']),
            onOpen: () => _openDetail(feature),
            onFavorite: () => _toggleFavorite(feature['nom'] as String),
            onMap: () => _launchMapDirectly(feature['nom'] as String),
          ),
        ),
        const SizedBox(height: 44),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Et aussi dans l'Ouest",
            style: TextStyle(
              fontFamily: 'DMSerifDisplay',
              fontSize: 28,
              color: _Palette.sand,
            ),
          ),
        ),
        const SizedBox(height: 22),
        ...List.generate(others.length, (index) {
          final item = others[index];
          final isLast = index == others.length - 1;
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                _DestinationRow(
                  item: item,
                  isFavorite: _favoritedNames.contains(item['nom']),
                  onOpen: () => _openDetail(item),
                  onFavorite: () => _toggleFavorite(item['nom'] as String),
                  onMap: () => _launchMapDirectly(item['nom'] as String),
                ),
                if (!isLast) ...[
                  const SizedBox(height: 22),
                  Container(
                    height: 1,
                    color: Colors.white.withOpacity(0.07),
                  ),
                  const SizedBox(height: 22),
                ],
              ],
            ),
          );
        }),
      ],
    );
  }

  // --- MODE FAVORIS : carnet de cartes postales ---
  Widget _buildFavorites(List<Map<String, dynamic>> favorites) {
    if (favorites.isEmpty) {
      return _buildEmptyFavorites();
    }

    return Padding(
      key: const ValueKey<String>('favorites'),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: favorites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 22,
          crossAxisSpacing: 16,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          final item = favorites[index];
          return _PostcardTile(
            item: item,
            // Légère inclinaison alternée, comme des cartes posées sur une table
            angle: index.isEven ? -0.025 : 0.02,
            onOpen: () => _openDetail(item),
            onRemove: () => _toggleFavorite(item['nom'] as String),
          );
        },
      ),
    );
  }

  Widget _buildEmptyFavorites() {
    return Padding(
      key: const ValueKey<String>('empty'),
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(angle: -0.16, child: _ghostPostcard()),
                Transform.rotate(angle: 0.12, child: _ghostPostcard()),
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _Palette.night,
                    border: Border.all(color: _Palette.rose.withOpacity(0.4)),
                    boxShadow: [
                      BoxShadow(
                        color: _Palette.rose.withOpacity(0.25),
                        blurRadius: 28,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.favorite_rounded,
                    color: _Palette.rose,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          const Text(
            'Votre carnet est vide',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'DMSerifDisplay',
              fontSize: 28,
              color: _Palette.sand,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            "Appuyez sur le cœur d'une destination pour la garder ici, comme une carte postale à envoyer plus tard.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14.5,
              height: 1.6,
              color: _Palette.sand.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 30),
          _Pill(
            label: "Explorer l'Ouest",
            icon: Icons.arrow_forward_rounded,
            color: _Palette.amber,
            filled: false,
            onTap: () => setState(() => _showFavorites = false),
          ),
        ],
      ),
    );
  }

  Widget _ghostPostcard() {
    return Container(
      width: 124,
      height: 158,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _Palette.sand.withOpacity(0.12)),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// FOND ET COMPOSANTS
// ---------------------------------------------------------------------------

/// Lueur ambrée discrète en haut à droite, pour l'atmosphère du désert.
class _AmbientGlow extends StatelessWidget {
  const _AmbientGlow();

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.9, -0.9),
            radius: 0.9,
            colors: [Color(0x33F2A55A), Color(0x00000000)],
          ),
        ),
      ),
    );
  }
}

class _Mesa {
  const _Mesa(this.cx, this.w, this.h);

  /// Position horizontale du centre, en fraction de la largeur
  final double cx;

  /// Largeur à la base, en fraction de la largeur
  final double w;

  /// Hauteur, en fraction de la hauteur de l'en-tête
  final double h;
}

/// Ciel de braise, soleil qui se couche, puis mesas en trois plans.
class _MesaPainter extends CustomPainter {
  _MesaPainter(this.progress);

  final double progress;

  static const _far = [
    _Mesa(0.06, 0.24, 0.30),
    _Mesa(0.40, 0.16, 0.22),
    _Mesa(0.70, 0.26, 0.36),
    _Mesa(0.95, 0.14, 0.20),
  ];
  static const _mid = [
    _Mesa(0.00, 0.30, 0.22),
    _Mesa(0.28, 0.20, 0.34),
    _Mesa(0.60, 0.18, 0.18),
    _Mesa(0.86, 0.30, 0.28),
  ];
  static const _near = [
    _Mesa(0.18, 0.36, 0.14),
    _Mesa(0.66, 0.42, 0.22),
    _Mesa(1.00, 0.20, 0.10),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final p = Curves.easeOutCubic.transform(progress);

    // Ciel : braise à l'horizon, nuit en haut
    final skyRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(
      skyRect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF140B08),
            Color(0xFF4A2014),
            Color(0xFF140B08),
          ],
          stops: [0.0, 0.62, 1.0],
        ).createShader(skyRect),
    );

    // Soleil qui se couche derrière les mesas
    final sunCenter = Offset(size.width * 0.3, size.height * 0.62);
    final sunRise = (1 - p) * 40;
    final sunRadius = 46.0;
    final haloRect = Rect.fromCircle(
      center: sunCenter.translate(0, sunRise),
      radius: sunRadius * 3.4,
    );
    canvas.drawCircle(
      sunCenter.translate(0, sunRise),
      sunRadius * 3.4,
      Paint()
        ..shader = RadialGradient(
          colors: [
            _Palette.amber.withOpacity(0.35 * p),
            _Palette.amber.withOpacity(0.0),
          ],
        ).createShader(haloRect),
    );
    canvas.drawCircle(
      sunCenter.translate(0, sunRise),
      sunRadius,
      Paint()
        ..shader = RadialGradient(
          colors: [
            const Color(0xFFFFE2B0),
            _Palette.amber,
          ],
        ).createShader(
          Rect.fromCircle(
            center: sunCenter.translate(0, sunRise),
            radius: sunRadius,
          ),
        ),
    );

    _drawMesas(canvas, size, _far, 0.66, const Color(0xFF8A4330), 40 * (1 - p));

    // Brume de poussière entre les plans
    final dustRect = Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.2);
    canvas.drawRect(
      dustRect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _Palette.sand.withOpacity(0.0),
            _Palette.sand.withOpacity(0.08 * p),
            _Palette.sand.withOpacity(0.0),
          ],
        ).createShader(dustRect),
    );

    _drawMesas(canvas, size, _mid, 0.78, const Color(0xFF5E2A1B), 52 * (1 - p));
    _drawMesas(canvas, size, _near, 0.9, const Color(0xFF2E140C), 64 * (1 - p));
  }

  void _drawMesas(
      Canvas canvas,
      Size size,
      List<_Mesa> mesas,
      double baseline,
      Color color,
      double dy,
      ) {
    final paint = Paint()..color = color;
    final base = baseline * size.height + dy;

    for (final m in mesas) {
      final cx = m.cx * size.width;
      final halfW = m.w * size.width / 2;
      final top = base - m.h * size.height;
      final inset = halfW * 0.16;

      final path = Path()
        ..moveTo(cx - halfW, base)
        ..lineTo(cx - halfW + inset, top)
        ..lineTo(cx + halfW - inset, top)
        ..lineTo(cx + halfW, base)
        ..close();

      canvas.drawPath(path, paint);
    }

    // Comble la zone sous la ligne de base
    canvas.drawRect(
      Rect.fromLTWH(0, base, size.width, size.height - base + 1),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _MesaPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    required this.label,
    required this.onTap,
    required this.child,
    this.size = 40,
  });

  final String label;
  final VoidCallback onTap;
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _Palette.night.withOpacity(0.55),
              border: Border.all(color: Colors.white.withOpacity(0.14)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _FavButton extends StatelessWidget {
  const _FavButton({
    required this.isFavorite,
    required this.onTap,
    this.size = 40,
  });

  final bool isFavorite;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return _CircleButton(
      label: isFavorite ? 'Retirer des favoris' : 'Ajouter aux favoris',
      onTap: onTap,
      size: size,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: Icon(
          isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          key: ValueKey<bool>(isFavorite),
          color: isFavorite ? _Palette.rose : Colors.white,
          size: size * 0.5,
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.label,
    required this.color,
    required this.onTap,
    this.icon,
    this.filled = true,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;
  final IconData? icon;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final foreground = filled ? _Palette.night : color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: filled ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
            border: filled ? null : Border.all(color: color.withOpacity(0.6)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: foreground,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon!, size: 17, color: foreground),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Image de secours si le fichier est introuvable.
Widget _fallbackImage(Color accent) {
  return Container(
    color: _Palette.deep,
    alignment: Alignment.center,
    child: Icon(Icons.image_not_supported_outlined, color: accent, size: 36),
  );
}

// --- CARTE VEDETTE (première destination) ---
class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.item,
    required this.isFavorite,
    required this.onOpen,
    required this.onFavorite,
    required this.onMap,
  });

  final Map<String, dynamic> item;
  final bool isFavorite;
  final VoidCallback onOpen;
  final VoidCallback onFavorite;
  final VoidCallback onMap;

  @override
  Widget build(BuildContext context) {
    final accent = item['couleur'] as Color;

    return Container(
      height: 560,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.22),
            blurRadius: 44,
            spreadRadius: -10,
            offset: const Offset(0, 22),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onOpen,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  item['image'] as String,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _fallbackImage(accent),
                ),

                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        _Palette.night.withOpacity(0.0),
                        _Palette.night.withOpacity(0.5),
                        _Palette.night.withOpacity(0.97),
                      ],
                      stops: const [0.2, 0.6, 1.0],
                    ),
                  ),
                ),

                // Liseré lumineux en haut, couleur de la destination
                Positioned(
                  top: 0,
                  left: 40,
                  right: 40,
                  child: Container(
                    height: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          accent.withOpacity(0.0),
                          accent,
                          accent.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 18,
                  right: 18,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _FavButton(isFavorite: isFavorite, onTap: onFavorite),
                      const SizedBox(width: 10),
                      _CircleButton(
                        label: 'Voir sur la carte',
                        onTap: onMap,
                        child: const Icon(
                          Icons.map_outlined,
                          color: Colors.white,
                          size: 19,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Icon(Icons.place_outlined, size: 15, color: accent),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              item['lieu'] as String,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.5,
                                color: _Palette.sand.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['nom'] as String,
                        style: const TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 42,
                          height: 1.05,
                          color: _Palette.sand,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['desc'] as String,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          height: 1.55,
                          color: _Palette.sand.withOpacity(0.72),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Ressemble à ${item['sosie']}",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                          color: accent,
                        ),
                      ),
                      const SizedBox(height: 22),
                      _Pill(
                        label: 'Découvrir',
                        icon: Icons.arrow_forward_rounded,
                        color: accent,
                        onTap: onOpen,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- RANGÉE DE DESTINATION (image en arche, sans carte) ---
class _DestinationRow extends StatelessWidget {
  const _DestinationRow({
    required this.item,
    required this.isFavorite,
    required this.onOpen,
    required this.onFavorite,
    required this.onMap,
  });

  final Map<String, dynamic> item;
  final bool isFavorite;
  final VoidCallback onOpen;
  final VoidCallback onFavorite;
  final VoidCallback onMap;

  @override
  Widget build(BuildContext context) {
    final accent = item['couleur'] as Color;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onOpen,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image en arche : la silhouette d'une arche de grès
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
                bottomLeft: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
              child: SizedBox(
                width: 120,
                height: 168,
                child: Image.asset(
                  item['image'] as String,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _fallbackImage(accent),
                ),
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['nom'] as String,
                    style: const TextStyle(
                      fontFamily: 'DMSerifDisplay',
                      fontSize: 24,
                      height: 1.1,
                      color: _Palette.sand,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.place_outlined,
                          size: 13,
                          color: _Palette.sand.withOpacity(0.6),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          item['lieu'] as String,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            height: 1.4,
                            color: _Palette.sand.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['desc'] as String,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      height: 1.5,
                      color: _Palette.sand.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Ressemble à ${item['sosie']}",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                      color: accent,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Text(
                        'Découvrir',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: accent,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, size: 16, color: accent),
                      const Spacer(),
                      _FavButton(
                        isFavorite: isFavorite,
                        onTap: onFavorite,
                        size: 36,
                      ),
                      const SizedBox(width: 8),
                      _CircleButton(
                        label: 'Voir sur la carte',
                        onTap: onMap,
                        size: 36,
                        child: const Icon(
                          Icons.map_outlined,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
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

// --- CARTE POSTALE (page Favoris) ---
class _PostcardTile extends StatelessWidget {
  const _PostcardTile({
    required this.item,
    required this.angle,
    required this.onOpen,
    required this.onRemove,
  });

  final Map<String, dynamic> item;
  final double angle;
  final VoidCallback onOpen;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final accent = item['couleur'] as Color;

    return Transform.rotate(
      angle: angle,
      child: Container(
        padding: const EdgeInsets.fromLTRB(9, 9, 9, 0),
        decoration: BoxDecoration(
          color: _Palette.paper,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 22,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: onOpen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 0.9,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item['image'] as String,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _fallbackImage(accent),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: _FavButton(
                          isFavorite: true,
                          onTap: onRemove,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 12, 4, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['nom'] as String,
                        style: const TextStyle(
                          fontFamily: 'DMSerifDisplay',
                          fontSize: 17,
                          height: 1.15,
                          color: _Palette.ink,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: accent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Text(
                              item['lieu'] as String,
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 10.5,
                                height: 1.4,
                                color: _Palette.muted,
                              ),
                            ),
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
    );
  }
}

// ---------------------------------------------------------------------------
// Page de détail provisoire (inchangée)
// ---------------------------------------------------------------------------

class DetailPlaceholder extends StatelessWidget {
  final String title;

  const DetailPlaceholder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121418),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Détails de : $title',
          style: const TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ),
    );
  }
}

// Transition en fondu vers les pages de détail
PageRouteBuilder _fadeRoute(Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 450),
    reverseTransitionDuration: const Duration(milliseconds: 350),
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: child,
      );
    },
  );
}