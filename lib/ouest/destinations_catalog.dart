import 'package:flutter/material.dart';
import 'destination_template.dart';
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

class DestinationEntry {
  final DestinationData data;
  final WidgetBuilder builder;
  const DestinationEntry(this.data, this.builder);
}

final List<DestinationEntry> destinationsCatalog = [
  DestinationEntry(grandCanyonData, (c) => GrandCanyonPage(title: grandCanyonData.name)),
  DestinationEntry(monumentValleyData, (c) => MonumentValleyPage(title: monumentValleyData.name)),
  DestinationEntry(yellowstoneData, (c) => YellowstonePage(title: yellowstoneData.name)),
  DestinationEntry(deathValleyData, (c) => DeathValleyPage(title: deathValleyData.name)),
  DestinationEntry(antelopeCanyonData, (c) => AntelopeCanyonPage(title: antelopeCanyonData.name)),
  DestinationEntry(canyonlandsData, (c) => CanyonlandsPage(title: canyonlandsData.name)),
  DestinationEntry(bryceCanyonData, (c) => BryceCanyonPage(title: bryceCanyonData.name)),
  DestinationEntry(zionParkData, (c) => ZionParkPage(title: zionParkData.name)),
  DestinationEntry(pageAndPowellData, (c) => PageAndPowellPage(title: pageAndPowellData.name)),
  DestinationEntry(wavePetrifieeData, (c) => WavePetrifieePage(title: wavePetrifieeData.name)),
  DestinationEntry(lassenDunesData, (c) => LassenDunesPage(title: lassenDunesData.name)),
  DestinationEntry(monoLakeData, (c) => MonoLakePage(title: monoLakeData.name)),
  DestinationEntry(flyGeyserData, (c) => FlyGeyserPage(title: flyGeyserData.name)),
];