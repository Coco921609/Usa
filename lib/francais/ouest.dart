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

  // Liste complète des 13 destinations (Aucune modification ni suppression)
  final List<Map<String, dynamic>> destinations = [
    {
      'nom': 'Grand Canyon',
      'image': 'assets/images/7.jpg',
      'desc': 'Une gorge immense creusée par le fleuve Colorado, offrant des panoramas spectaculaires aux couleurs flamboyantes.',
      'couleur': Colors.orange.shade400,
      'lieu': 'Arizona, USA',
      'sosie': 'Kings Canyon, Australie',
      'page': const GrandCanyonPage(title: 'Grand Canyon')
    },
    {
      'nom': 'Monument Valley',
      'image': 'assets/images/16.webp',
      'desc': 'Un paysage emblématique de l\'Ouest américain avec ses célèbres buttes de grès rouge.',
      'couleur': Colors.redAccent,
      'lieu': 'Utah / Arizona, USA',
      'sosie': 'Désert de Wadi Rum, Jordanie',
      'page': const MonumentValleyPage(title: 'Monument Valley')
    },
    {
      'nom': 'Yellowstone',
      'image': 'assets/images/21.jpg',
      'desc': 'Le plus ancien parc national du monde, célèbre pour sa faune sauvage et ses phénomènes géothermiques.',
      'couleur': Colors.teal.shade300,
      'lieu': 'Wyoming, USA',
      'sosie': 'Geysers de Geysir, Islande',
      'page': const YellowstonePage(title: 'Yellowstone')
    },
    {
      'nom': 'Death Valley',
      'image': 'assets/images/42.webp',
      'desc': 'Le point le plus bas, le plus chaud et le plus sec d\'Amérique du Nord, aux paysages lunaires.',
      'couleur': Colors.amber.shade600,
      'lieu': 'Californie, USA',
      'sosie': 'Dunes de Merzouga, Sahara',
      'page': const DeathValleyPage(title: 'Death Valley')
    },
    {
      'nom': 'Antelope Canyon',
      'image': 'assets/images/49.webp',
      'desc': 'Un canyon en fente spectaculaire, sculpté par l\'eau et illuminé par des faisceaux de lumière magiques.',
      'couleur': Colors.deepOrange.shade400,
      'lieu': 'Arizona, USA',
      'sosie': 'Gorges du Siq de Pétra, Jordanie',
      'page': const AntelopeCanyonPage(title: 'Antelope Canyon')
    },
    {
      'nom': 'Canyonlands',
      'image': 'assets/images/58.jpg',
      'desc': 'Un vaste paysage de canyons, de mesas et de buttes creusé par le fleuve Colorado et la Green River.',
      'couleur': Colors.brown.shade300,
      'lieu': 'Utah, USA',
      'sosie': 'Massif des Bungle Bungle, Australie',
      'page': const CanyonlandsPage(title: 'Canyonlands')
    },
    {
      'nom': 'Bryce Canyon',
      'image': 'assets/images/64.jpg',
      'desc': 'Un amphithéâtre naturel rempli de "hoodoos" (cheminées de fées) aux teintes rouges et oranges.',
      'couleur': Colors.orange.shade700,
      'lieu': 'Utah, USA',
      'sosie': 'Cheminées de Fée de Cappadoce, Turquie',
      'page': const BryceCanyonPage(title: 'Bryce Canyon')
    },
    {
      'nom': 'Dunes Peintes',
      'image': 'assets/images/72.webp',
      'desc': 'Des dunes volcaniques aux couleurs étonnantes situées près du pic Lassen.',
      'couleur': Colors.purple.shade300,
      'lieu': 'Californie, USA',
      'sosie': 'Volcan Landmannalaugar, Islande',
      'page': const LassenDunesPage(title: 'Dunes Peintes')
    },
    {
      'nom': 'Fly Ranch Geyser',
      'image': 'assets/images/80.webp',
      'desc': 'Un geyser accidentel, aux couleurs vives créées par des algues thermophiles.',
      'couleur': Colors.greenAccent.shade400,
      'lieu': 'Nevada, USA',
      'sosie': 'Sources Chaudes de Hveravellir, Islande',
      'page': const FlyGeyserPage(title: 'Fly Ranch Geyser')
    },
    {
      'nom': 'La Vague Pétrifiée',
      'image': 'assets/images/81.webp',
      'desc': 'Une formation rocheuse de grès aux ondulations parfaites, très prisée des photographes.',
      'couleur': Colors.pink.shade300,
      'lieu': 'Arizona, USA',
      'sosie': 'Wave Rock, Australie',
      'page': const WavePetrifieePage(title: 'La Vague Pétrifiée')
    },
    {
      'nom': 'Parc National de Zion',
      'image': 'assets/images/89.webp',
      'desc': 'Un canyon profond aux falaises de grès rouge, rose et blanc s\'élevant vers le ciel.',
      'couleur': Colors.deepOrangeAccent,
      'lieu': 'Utah, USA',
      'sosie': 'Montagnes de Zhangjiajie, Chine',
      'page': const ZionParkPage(title: 'Parc National de Zion')
    },
    {
      'nom': 'Lac Mono',
      'image': 'assets/images/95.jpg',
      'desc': 'Un lac salé ancien, connu pour ses étranges tours de tuf calcaire émergeant de l\'eau.',
      'couleur': Colors.cyan.shade300,
      'lieu': 'Californie, USA',
      'sosie': 'Cheminées du Lac Abhé, Djibouti',
      'page': const MonoLakePage(title: 'Lac Mono')
    },
    {
      'nom': 'Page et le Lac Powell',
      'image': 'assets/images/98.jpg',
      'desc': 'Un immense lac artificiel aux eaux bleues contrastant avec les falaises de roches rouges.',
      'couleur': Colors.blue.shade400,
      'lieu': 'Arizona, USA',
      'sosie': 'Rives du Lac Nasser, Égypte',
      'page': const PageAndPowellPage(title: 'Page et le Lac Powell')
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
    if (isShowingFavorites) {
      setState(() {
        isShowingFavorites = false;
      });
    } else {
      Navigator.of(context).pop();
    }
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
    final displayedDestinations = isShowingFavorites
        ? destinations.where((item) => _favoritedNames.contains(item['nom'])).toList()
        : destinations;

    return Theme(
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
                              isShowingFavorites ? 'Mes Favoris' : 'Ouest Américain',
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
                          "Explorez les destinations et appuyez sur le cœur\npour construire votre carnet de voyage ici",
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

  Widget _buildFavoriteRowTile(Map<String, dynamic> item) {
    final Color itemColor = item['couleur'];

    return Container(
      margin: const EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: const Color(0xFF1E2128),
        boxShadow: [
          BoxShadow(
            color: itemColor.withOpacity(0.25),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
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
            "${item['lieu']} • Air de ${item['sosie']}",
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
                      // Remplacement des Row par Text.rich pour s'adapter à la largeur sans déborder
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
                              text: "Air de : ${item['sosie']}",
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
                          'Cliquez pour découvrir',
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
          'Détails de : $title',
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