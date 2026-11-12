import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usa/est%20anglais/Les%20Chutes%20du%20Niagara.dart';
import 'package:usa/est anglais/Great Smoky Mountains.dart';
import 'package:usa/est anglais/Parc de Shenandoah.dart';
import 'package:usa/est%20anglais/Voyageurs%20National%20Park.dart';

/// Palette « forest mist at dawn » : night green, misty ridges,
/// pine green and a soft rose for favorites.
class _Palette {
  static const night = Color(0xFF08120F);
  static const deep = Color(0xFF10201B);
  static const mist = Color(0xFFE6EFEA);
  static const dew = Color(0xFFBFE7D5);
  static const pine = Color(0xFF8BD3B0);
  static const rose = Color(0xFFFF8F8F);
  static const paper = Color(0xFFF2F7F3);
  static const ink = Color(0xFF10201B);
  static const muted = Color(0xFF5C7A6E);
}

class EstPage extends StatefulWidget {
  final String favorisKey;
  final bool isFrench;

  const EstPage({
    super.key,
    required this.favorisKey,
    required this.isFrench,
  });

  @override
  State<EstPage> createState() => _EstPageState();
}

class _EstPageState extends State<EstPage> with SingleTickerProviderStateMixin {
  bool _showFavorites = false;
  List<String> _favoritedNames = [];
  bool _introStarted = false;

  // Single orchestrated entrance: the ridges and the moon rise, then the title.
  late final AnimationController _intro;
  late final Animation<double> _titleFade;

  // STRICTLY USES THE 'favoris_en' KEY FOR THE EAST (unchanged)
  final String _englishFavoritesKey = 'favoris_en';

  // Complete list of East destinations (unchanged)
  final List<Map<String, dynamic>> destinations = [
    {
      'nom': 'Niagara Falls',
      'image': 'assets/images/109.jpg',
      'desc': 'Three monumental waterfalls on the Canadian border, a spectacle of power and mist.',
      'couleur': const Color(0xFF8EC9E8),
      'lieu': 'New York, USA',
      'sosie': 'Iguazu Falls, Brazil / Argentina',
      'page': const NiagaraFallsPage(title: 'Niagara Falls'),
    },
    {
      'nom': 'Great Smoky Mountains',
      'image': 'assets/images/111.webp',
      'desc': 'A characteristic blue mist rising above the ridges of one of the oldest mountain ranges in the world.',
      'couleur': const Color(0xFF8BD3B0),
      'lieu': 'North Carolina / Tennessee, USA',
      'sosie': 'Daintree Rainforest, Australia',
      'page': const GreatSmokyMountainsPage(title: 'Great Smoky Mountains'),
    },
    {
      'nom': 'Shenandoah Park',
      'image': 'assets/images/122.webp',
      'desc': 'A wild haven traversed by the Skyline Drive, offering breathtaking views over the Shenandoah Valley.',
      'couleur': const Color(0xFFC2DE8A),
      'lieu': 'Virginia, USA',
      'sosie': 'Cévennes National Park, France',
      'page': const ShenandoahParkPage(title: 'Shenandoah Park'),
    },
    {
      'nom': 'Voyageurs National Park',
      'image': 'assets/images/128.webp',
      'desc': 'An aquatic labyrinth of preserved lakes and forest canals, ideal for adventure and canoeing.',
      'couleur': const Color(0xFF7DD0D0),
      'lieu': 'Minnesota, USA',
      'sosie': 'Lake Saimaa region, Finland',
      'page': const VoyageursNationalParkPage(title: 'Voyageurs National Park'),
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

    // Respect the system "reduce motion" setting.
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
      _favoritedNames = prefs.getStringList(_englishFavoritesKey) ?? [];
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
    await prefs.setStringList(_englishFavoritesKey, _favoritedNames);
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

  // Opens the map application (unchanged logic)
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
      // No click ripples: the visual feedback is specific to this page
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

  // --- HEADER: ridges, moon and title ---
  Widget _buildHeader(int favoriteCount) {
    final subtitle = favoriteCount == 0
        ? 'Your travel journal'
        : favoriteCount == 1
        ? '1 saved destination'
        : '$favoriteCount saved destinations';

    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _intro,
              builder: (context, child) =>
                  CustomPaint(painter: _RidgePainter(_intro.value)),
            ),
          ),
          Positioned(
            top: 8,
            left: 16,
            child: _CircleButton(
              label: 'Back',
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
                      _showFavorites ? 'My Favorites' : 'Eastern America',
                      style: const TextStyle(
                        fontFamily: 'DMSerifDisplay',
                        fontSize: 50,
                        height: 1.0,
                        letterSpacing: -0.8,
                        color: _Palette.mist,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _showFavorites
                          ? subtitle
                          : 'Forests, lakes and waterfalls',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: _Palette.dew.withOpacity(0.8),
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

  // --- EXPLORE / FAVORITES SWITCH ---
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
                label: 'Explore',
                icon: Icons.explore_outlined,
                selected: !_showFavorites,
                onTap: () => setState(() => _showFavorites = false),
              ),
            ),
            Expanded(
              child: _buildSegment(
                label: 'Favorites',
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
    final foreground = selected ? _Palette.night : _Palette.mist.withOpacity(0.7);

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
            color: selected ? _Palette.pine : Colors.transparent,
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
                      color: selected ? _Palette.pine : _Palette.night,
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

  // --- EXPLORE MODE ---
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
            'More in the East',
            style: TextStyle(
              fontFamily: 'DMSerifDisplay',
              fontSize: 28,
              color: _Palette.mist,
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

  // --- FAVORITES MODE: postcard journal ---
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
            // Alternating slight tilt, like postcards laid on a table
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
            'Your journal is empty',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'DMSerifDisplay',
              fontSize: 28,
              color: _Palette.mist,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Tap the heart on a destination to keep it here, like a postcard to send later.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14.5,
              height: 1.6,
              color: _Palette.mist.withOpacity(0.65),
            ),
          ),
          const SizedBox(height: 30),
          _Pill(
            label: 'Explore the East',
            icon: Icons.arrow_forward_rounded,
            color: _Palette.pine,
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
        border: Border.all(color: _Palette.mist.withOpacity(0.12)),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// BACKGROUND AND COMPONENTS
// ---------------------------------------------------------------------------

/// Soft green glow at the top right, for the forest atmosphere.
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
            colors: [Color(0x338BD3B0), Color(0x00000000)],
          ),
        ),
      ),
    );
  }
}

/// Wooded ridges in three layers, mist between them, and a rising moon.
class _RidgePainter extends CustomPainter {
  _RidgePainter(this.progress);

  final double progress;

  static const _far = [
    Offset(0, 0.55), Offset(0.1, 0.42), Offset(0.2, 0.5), Offset(0.33, 0.3),
    Offset(0.46, 0.46), Offset(0.6, 0.34), Offset(0.74, 0.48), Offset(0.87, 0.36),
    Offset(1, 0.44),
  ];
  static const _mid = [
    Offset(0, 0.7), Offset(0.15, 0.58), Offset(0.3, 0.68), Offset(0.45, 0.52),
    Offset(0.6, 0.66), Offset(0.78, 0.56), Offset(0.9, 0.68), Offset(1, 0.62),
  ];
  static const _near = [
    Offset(0, 0.84), Offset(0.18, 0.74), Offset(0.36, 0.82), Offset(0.55, 0.76),
    Offset(0.72, 0.84), Offset(0.88, 0.76), Offset(1, 0.82),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final p = Curves.easeOutCubic.transform(progress);

    // Moon
    final moonCenter = Offset(size.width * 0.8, size.height * 0.2);
    final glowRect = Rect.fromCircle(center: moonCenter, radius: 120);
    canvas.drawCircle(
      moonCenter,
      120,
      Paint()
        ..shader = RadialGradient(
          colors: [
            _Palette.dew.withOpacity(0.2 * p),
            _Palette.dew.withOpacity(0.0),
          ],
        ).createShader(glowRect),
    );
    canvas.drawCircle(
      moonCenter,
      28,
      Paint()..color = _Palette.mist.withOpacity(0.9 * p),
    );

    _drawRidge(canvas, size, _far, const Color(0xFF21473A), 36 * (1 - p));

    // Mist between the far and middle ridges
    final fogRect = Rect.fromLTWH(0, size.height * 0.45, size.width, size.height * 0.28);
    canvas.drawRect(
      fogRect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            _Palette.mist.withOpacity(0.0),
            _Palette.mist.withOpacity(0.12 * p),
            _Palette.mist.withOpacity(0.0),
          ],
        ).createShader(fogRect),
    );

    _drawRidge(canvas, size, _mid, const Color(0xFF1A3A2F), 50 * (1 - p));
    _drawRidge(canvas, size, _near, const Color(0xFF0F2119), 64 * (1 - p));
  }

  void _drawRidge(
      Canvas canvas,
      Size size,
      List<Offset> points,
      Color color,
      double dy,
      ) {
    final pts = points
        .map((o) => Offset(o.dx * size.width, o.dy * size.height + dy))
        .toList();

    final path = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (var i = 1; i < pts.length; i++) {
      final mid = Offset(
        (pts[i - 1].dx + pts[i].dx) / 2,
        (pts[i - 1].dy + pts[i].dy) / 2,
      );
      path.quadraticBezierTo(pts[i - 1].dx, pts[i - 1].dy, mid.dx, mid.dy);
    }
    path
      ..lineTo(pts.last.dx, pts.last.dy)
      ..lineTo(size.width, size.height + dy)
      ..lineTo(0, size.height + dy)
      ..close();

    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _RidgePainter oldDelegate) {
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
      label: isFavorite ? 'Remove from favorites' : 'Add to favorites',
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

/// Fallback image if the file cannot be found.
Widget _fallbackImage(Color accent) {
  return Container(
    color: _Palette.deep,
    alignment: Alignment.center,
    child: Icon(Icons.image_not_supported_outlined, color: accent, size: 36),
  );
}

// --- FEATURE CARD (first destination) ---
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

                // Glowing line at the top, in the destination's color
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
                        label: 'View on map',
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
                                color: _Palette.mist.withOpacity(0.8),
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
                          color: _Palette.mist,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['desc'] as String,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          height: 1.55,
                          color: _Palette.mist.withOpacity(0.72),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        "Looks like ${item['sosie']}",
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
                        label: 'Discover',
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

// --- DESTINATION ROW (arch image, no card) ---
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
            // Arch-shaped image: a doorway opening onto the forest
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
                      color: _Palette.mist,
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
                          color: _Palette.mist.withOpacity(0.6),
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
                            color: _Palette.mist.withOpacity(0.6),
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
                      color: _Palette.mist.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Looks like ${item['sosie']}",
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
                        'Discover',
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
                        label: 'View on map',
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

// --- POSTCARD (Favorites page) ---
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
// Temporary detail page (unchanged)
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
          'Details of: $title',
          style: const TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ),
    );
  }
}

// Fade transition to the detail pages
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