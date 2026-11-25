import 'package:flutter/material.dart';
import 'package:usa/connexion.dart';
import 'package:usa/francais/ouest.dart' as fr_west;
import 'package:usa/francais/est.dart' as fr_east;
import 'package:usa/ouest/destinations_catalog.dart';
import '../lib/est/Les Chutes du Niagara.dart';
import '../lib/est/Great Smoky Mountains.dart';
import '../lib/est/Parc de Shenandoah.dart';
import '../lib/est/Voyageurs National Park.dart';

Widget _westDestination(int index) => Builder(
  builder: (context) => destinationsCatalog[index].builder(context),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final screen = Uri.base.queryParameters['screen'] ?? 'welcome';

  final Widget page = switch (screen) {
    'welcome' => const ConnexionPage(),
    'west' => const fr_west.OuestPage(favorisKey: 'screenshots_favoris_fr_ouest', isFrench: true),
    'east' => const fr_east.EstPage(favorisKey: 'screenshots_favoris_fr_est', isFrench: true),
    'west-0' => _westDestination(0),
    'west-1' => _westDestination(1),
    'west-2' => _westDestination(2),
    'west-3' => _westDestination(3),
    'west-4' => _westDestination(4),
    'west-5' => _westDestination(5),
    'west-6' => _westDestination(6),
    'west-7' => _westDestination(7),
    'west-8' => _westDestination(8),
    'west-9' => _westDestination(9),
    'west-10' => _westDestination(10),
    'west-11' => _westDestination(11),
    'west-12' => _westDestination(12),
    'niagara' => const NiagaraFallsPage(title: 'Les Chutes du Niagara'),
    'smoky' => const GreatSmokyMountainsPage(title: 'Great Smoky Mountains'),
    'shenandoah' => const ShenandoahParkPage(title: 'Parc de Shenandoah'),
    'voyageurs' => const VoyageursNationalParkPage(title: 'Voyageurs National Park'),
    _ => const ConnexionPage(),
  };

  runApp(MaterialApp(
    title: 'Road Trip USA — aperçu',
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: page,
  ));
}
