import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usa/ouest%20anglais/grand%20canyon.dart';
import 'package:usa/ouest%20anglais/Fly%20Ranch%20Geyser.dart';
import 'package:usa/ouest%20anglais/Antelope%20Canyon.dart';
import 'package:usa/ouest%20anglais/Bryce%20Canyon.dart';
import 'package:usa/ouest%20anglais/Page%20et%20le%20Lac%20Powell.dart';
import 'package:usa/ouest%20anglais/Parc%20National%20de%20Zion.dart';
import 'package:usa/ouest%20anglais/Dunes%20Peintes.dart';
import 'package:usa/ouest%20anglais/La%20Vague%20P%C3%A9trifi%C3%A9e.dart';
import 'package:usa/ouest%20anglais/Monument%20Valley.dart';
import 'package:usa/ouest anglais/Lac Mono.dart';
import 'package:usa/ouest%20anglais/Death%20Valley.dart';
import 'package:usa/ouest%20anglais/Yellowstone.dart';
import 'package:usa/ouest anglais/Canyonlands.dart';


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

class _OuestPageState extends State<OuestPage> {
  bool isShowingFavorites = false;
  List<String> _favoritedNames = [];

  // FORCE STRICTEMENT L'UTILISATION DE LA CLE 'favoris_en'
  final String _englishFavoritesKey = 'favoris_en';

  // Complete list of the 13 destinations (No modifications, no deletions, translated to English)
  final List<Map<String, dynamic>> destinations = [
    {
      'nom': 'Grand Canyon',
      'image': 'assets/images/7.jpg',
      'desc': 'An immense gorge carved by the Colorado River, offering spectacular vistas with flamboyant colors.',
      'couleur': Colors.orange.shade400,
      'lieu': 'Arizona, USA',
      'sosie': 'Kings Canyon, Australia',
      'page': const GrandCanyonPage(title: 'Grand Canyon')
    },
    {
      'nom': 'Monument Valley',
      'image': 'assets/images/16.webp',
      'desc': 'An iconic landscape of the American West with its famous red sandstone buttes.',
      'couleur': Colors.redAccent,
      'lieu': 'Utah / Arizona, USA',
      'sosie': 'Wadi Rum Desert, Jordan',
      'page': const MonumentValleyPage(title: 'Monument Valley')
    },
    {
      'nom': 'Yellowstone',
      'image': 'assets/images/21.jpg',
      'desc': 'The oldest national park in the world, famous for its wildlife and geothermal phenomena.',
      'couleur': Colors.teal.shade300,
      'lieu': 'Wyoming, USA',
      'sosie': 'Geysers of Geysir, Iceland',
      'page': const YellowstonePage(title: 'Yellowstone')
    },
    {
      'nom': 'Death Valley',
      'image': 'assets/images/42.webp',
      'desc': 'The lowest, hottest, and driest point in North America, with lunar landscapes.',
      'couleur': Colors.amber.shade600,
      'lieu': 'California, USA',
      'sosie': 'Merzouga Dunes, Sahara',
      'page': const DeathValleyPage(title: 'Death Valley')
    },
    {
      'nom': 'Antelope Canyon',
      'image': 'assets/images/49.webp',
      'desc': 'A spectacular slot canyon, carved by water and illuminated by magical beams of light.',
      'couleur': Colors.deepOrange.shade400,
      'lieu': 'Arizona, USA',
      'sosie': 'Siq Gorges of Petra, Jordan',
      'page': const AntelopeCanyonPage(title: 'Antelope Canyon')
    },
    {
      'nom': 'Canyonlands',
      'image': 'assets/images/58.jpg',
      'desc': 'A vast landscape of canyons, mesas, and buttes carved by the Colorado and Green Rivers.',
      'couleur': Colors.brown.shade300,
      'lieu': 'Utah, USA',
      'sosie': 'Bungle Bungle Range, Australia',
      'page': const CanyonlandsPage(title: 'Canyonlands')
    },
    {
      'nom': 'Bryce Canyon',
      'image': 'assets/images/64.jpg',
      'desc': 'A natural amphitheater filled with "hoodoos" in shades of red and orange.',
      'couleur': Colors.orange.shade700,
      'lieu': 'Utah, USA',
      'sosie': 'Fairy Chimneys of Cappadocia, Turkey',
      'page': const BryceCanyonPage(title: 'Bryce Canyon')
    },
    {
      'nom': 'Painted Dunes',
      'image': 'assets/images/72.webp',
      'desc': 'Volcanic dunes with amazing colors located near Lassen Peak.',
      'couleur': Colors.purple.shade300,
      'lieu': 'California, USA',
      'sosie': 'Landmannalaugar Volcano, Iceland',
      'page': const LassenDunesPage(title: 'Painted Dunes')
    },
    {
      'nom': 'Fly Ranch Geyser',
      'image': 'assets/images/80.webp',
      'desc': 'An accidental geyser with vivid colors created by thermophilic algae.',
      'couleur': Colors.greenAccent.shade400,
      'lieu': 'Nevada, USA',
      'sosie': 'Hot Springs of Hveravellir, Iceland',
      'page': const FlyGeyserPage(title: 'Fly Ranch Geyser')
    },
    {
      'nom': 'The Petrified Wave',
      'image': 'assets/images/81.webp',
      'desc': 'A sandstone rock formation with perfect undulations, highly prized by photographers.',
      'couleur': Colors.pink.shade300,
      'lieu': 'Arizona, USA',
      'sosie': 'Wave Rock, Australia',
      'page': const WavePetrifiedPage(title: 'The Petrified Wave')
    },
    {
      'nom': 'Zion National Park',
      'image': 'assets/images/89.webp',
      'desc': 'A deep canyon with red, pink, and white sandstone cliffs rising toward the sky.',
      'couleur': Colors.deepOrangeAccent,
      'lieu': 'Utah, USA',
      'sosie': 'Zhangjiajie Mountains, China',
      'page': const ZionParkPage(title: 'Zion National Park')
    },
    {
      'nom': 'Mono Lake',
      'image': 'assets/images/95.jpg',
      'desc': 'An ancient saltwater lake, known for its strange limestone tufa towers emerging from the water.',
      'couleur': Colors.cyan.shade300,
      'lieu': 'California, USA',
      'sosie': 'Chimneys of Lake Abbe, Djibouti',
      'page': const MonoLakePage(title: 'Mono Lake')
    },
    {
      'nom': 'Page and Lake Powell',
      'image': 'assets/images/98.jpg',
      'desc': 'An immense artificial lake with blue waters contrasting with red rock cliffs.',
      'couleur': Colors.blue.shade400,
      'lieu': 'Arizona, USA',
      'sosie': 'Shores of Lake Nasser, Egypt',
      'page': const PageAndPowellPage(title: 'Page and Lake Powell')
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
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
    if (isShowingFavorites) {
      setState(() {
        isShowingFavorites = false;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  // OPTIMIZED METHOD: Targets strictly maps applications
  Future<void> _launchMapDirectly(String destination) async {
    final encodedQuery = Uri.encodeComponent(destination);
    Uri uri;

    if (Platform.isAndroid) {
      // geo:0,0?q= forces Android system to list only navigation apps (Maps, Waze)
      uri = Uri.parse('geo:0,0?q=$encodedQuery');
    } else if (Platform.isIOS) {
      // maps:// forces iOS to open Apple Maps
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
    final displayedDestinations = isShowingFavorites
        ? destinations.where((item) => _favoritedNames.contains(item['nom'])).toList()
        : destinations;

    return Theme(
      // Suppression de toutes les animations d'éclaboussure/ripple de fond au clic sur cette page
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
      ),
      child: PopScope(
        canPop: !isShowingFavorites,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          setState(() {
            isShowingFavorites = false;
          });
        },
        child: Scaffold(
          backgroundColor: const Color(0xFF121418),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                          onPressed: _handleBack,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              isShowingFavorites ? 'My Favorites' : 'American West',
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.home_rounded,
                            color: !isShowingFavorites ? Colors.cyan.shade300 : Colors.white70,
                          ),
                          onPressed: () {
                            if (isShowingFavorites) {
                              setState(() {
                                isShowingFavorites = false;
                              });
                            }
                          },
                        ),
                        const SizedBox(width: 4),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: isShowingFavorites ? Colors.red : Colors.white70,
                          ),
                          onPressed: () {
                            setState(() {
                              isShowingFavorites = true;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  isShowingFavorites && displayedDestinations.isEmpty
                      ? Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                          size: 70,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Explore destinations and tap the heart icon\nto build your travel journal here",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      children: displayedDestinations.map((item) {
                        if (isShowingFavorites) {
                          return _buildFavoriteRowTile(item);
                        } else {
                          return _buildMainDestinationCard(item);
                        }
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // SIMPLIFIED FAVORITES ROW AVEC NOUVEAUX REFLETS D'OMBRES
  Widget _buildFavoriteRowTile(Map<String, dynamic> item) {
    final Color itemColor = item['couleur'];

    return Container(
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: const Color(0xFF1E2128),
        boxShadow: [
          // Ombre lumineuse diffuse / reflet coloré pour l'arrière-plan des favoris
          BoxShadow(
            color: itemColor.withOpacity(0.25),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
          // Ombre classique pour la profondeur
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 10,
            spreadRadius: -1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: itemColor.withOpacity(0.5), width: 1.5),
          ),
          child: ClipOval(
            child: Image.asset(
              item['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade900,
                  child: Icon(Icons.image_not_supported_outlined, color: itemColor, size: 20),
                );
              },
            ),
          ),
        ),
        title: Text(
          item['nom'] as String,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            "${item['lieu']} • Looks like ${item['sosie']}",
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 11,
              color: Colors.white54,
            ),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.map_outlined, color: Colors.white70, size: 22),
              onPressed: () {
                _launchMapDirectly(item['nom']);
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red, size: 22),
              onPressed: () {
                _toggleFavorite(item['nom']);
              },
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            _routeSansAnimation(item['page']),
          );
        },
      ),
    );
  }

  // MAIN DESTINATION CARD
  Widget _buildMainDestinationCard(Map<String, dynamic> item) {
    final isFavorited = _favoritedNames.contains(item['nom']);
    final Color itemColor = item['couleur'];

    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFF1E2128),
        boxShadow: [
          BoxShadow(
            color: itemColor.withOpacity(0.18),
            blurRadius: 20,
            spreadRadius: -2,
            offset: const Offset(0, 10),
          ),
          const BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item['nom'] as String,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.map_outlined, color: Colors.white70),
                        onPressed: () {
                          _launchMapDirectly(item['nom']);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: isFavorited ? Colors.red : Colors.white70,
                        ),
                        onPressed: () {
                          _toggleFavorite(item['nom']);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),

            Image.asset(
              item['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade900,
                  height: 200,
                  width: double.infinity,
                  child: Icon(Icons.image_not_supported_outlined, color: itemColor, size: 40),
                );
              },
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 6.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Utilisation de Text.rich pour s'adapter à la largeur sans déborder
                      Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(Icons.location_on_outlined, size: 14, color: Colors.white54),
                            ),
                            const WidgetSpan(child: SizedBox(width: 4)),
                            TextSpan(
                              text: item['lieu'] as String,
                              style: const TextStyle(color: Colors.white54, fontSize: 12, fontFamily: 'Montserrat'),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(Icons.flight_takeoff_rounded, size: 14, color: itemColor),
                            ),
                            const WidgetSpan(child: SizedBox(width: 4)),
                            TextSpan(
                              text: "Looks like: ${item['sosie']}",
                              style: TextStyle(
                                color: itemColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item['desc'],
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        _routeSansAnimation(item['page']),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Click to discover',
                          style: TextStyle(
                            color: itemColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: itemColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          style: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.white),
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

PageRouteBuilder _routeSansAnimation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}