import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:usa/est%20anglais/Les%20Chutes%20du%20Niagara.dart';
import 'package:usa/est anglais/Great Smoky Mountains.dart';
import 'package:usa/est anglais/Parc de Shenandoah.dart';
import 'package:usa/est%20anglais/Voyageurs%20National%20Park.dart';

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

class _EstPageState extends State<EstPage> {
  bool isShowingFavorites = false;
  List<String> _favoritedNames = [];

  // STRICTLY FORCES THE USE OF THE 'favoris_en' KEY FOR THE EAST
  final String _englishFavoritesKey = 'favoris_en';

  // Complete list of East destinations
  final List<Map<String, dynamic>> destinations = [
    {
      'nom': 'Niagara Falls',
      'image': 'assets/images/109.jpg',
      'desc': 'Three monumental waterfalls on the Canadian border, a spectacle of power and mist.',
      'couleur': Colors.blue.shade400,
      'lieu': 'New York, USA',
      'sosie': 'Iguazu Falls, Brazil / Argentina',
      'page': const NiagaraFallsPage(title: 'Niagara Falls')
    },
    {
      'nom': 'Great Smoky Mountains',
      'image': 'assets/images/111.webp',
      'desc': 'A characteristic blue mist rising above the ridges of one of the oldest mountain ranges in the world.',
      'couleur': Colors.teal.shade300,
      'lieu': 'North Carolina / Tennessee, USA',
      'sosie': 'Daintree Rainforest, Australia',
      'page': const GreatSmokyMountainsPage(title: 'Great Smoky Mountains')
    },
    {
      'nom': 'Shenandoah Park',
      'image': 'assets/images/122.webp',
      'desc': 'A wild haven traversed by the Skyline Drive, offering breathtaking views over the Shenandoah Valley.',
      'couleur': Colors.green.shade400,
      'lieu': 'Virginia, USA',
      'sosie': 'Cévennes National Park, France',
      'page': const ShenandoahParkPage(title: 'Shenandoah Park')
    },
    {
      'nom': 'Voyageurs National Park',
      'image': 'assets/images/128.webp',
      'desc': 'An aquatic labyrinth of preserved lakes and forest canals, ideal for adventure and canoeing.',
      'couleur': Colors.cyan.shade300,
      'lieu': 'Minnesota, USA',
      'sosie': 'Lake Saimaa region, Finland',
      'page': const VoyageursNationalParkPage(title: 'Voyageurs National Park')
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
                          child: Text(
                            isShowingFavorites ? 'My Favorites' : 'American East',
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.0,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
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
                          "Explore the destinations and tap the heart\nto build your travel journal here",
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

  // FAVORIS SIMPLIFIÉS AVEC NOUVEAUX REFLETS D'OMBRES
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
            "${item['lieu']} • Feels like ${item['sosie']}",
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
            _routeWithoutAnimation(item['page']),
          );
        },
      ),
    );
  }

  // CARTE DE DESTINATION PRINCIPALE
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on_outlined, size: 14, color: Colors.white54),
                          const SizedBox(width: 4),
                          Text(
                            item['lieu'] as String,
                            style: const TextStyle(color: Colors.white54, fontSize: 12, fontFamily: 'Montserrat'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.flight_takeoff_rounded, size: 14, color: itemColor),
                          const SizedBox(width: 4),
                          Text(
                            "Feels like: ${item['sosie']}",
                            style: TextStyle(
                              color: itemColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
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
                        _routeWithoutAnimation(item['page']),
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

PageRouteBuilder _routeWithoutAnimation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}