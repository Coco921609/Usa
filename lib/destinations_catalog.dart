import 'package:flutter/material.dart';
import '../destination_template.dart';
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

final List<DestinationEntry> destinationsCatalogEn = [
  DestinationEntry(grandCanyonDataEn, (c) => GrandCanyonPage(title: grandCanyonDataEn.name)),
  DestinationEntry(monumentValleyDataEn, (c) => MonumentValleyPage(title: monumentValleyDataEn.name)),
  DestinationEntry(yellowstoneDataEn, (c) => YellowstonePage(title: yellowstoneDataEn.name)),
  DestinationEntry(deathValleyDataEn, (c) => DeathValleyPage(title: deathValleyDataEn.name)),
  DestinationEntry(antelopeCanyonDataEn, (c) => AntelopeCanyonPage(title: antelopeCanyonDataEn.name)),
  DestinationEntry(canyonlandsDataEn, (c) => CanyonlandsPage(title: canyonlandsDataEn.name)),
  DestinationEntry(bryceCanyonDataEn, (c) => BryceCanyonPage(title: bryceCanyonDataEn.name)),
  DestinationEntry(zionParkDataEn, (c) => ZionParkPage(title: zionParkDataEn.name)),
  DestinationEntry(pageAndPowellDataEn, (c) => PageAndPowellPage(title: pageAndPowellDataEn.name)),
  DestinationEntry(wavePetrifiedDataEn, (c) => WavePetrifiedPage(title: wavePetrifiedDataEn.name)),
  DestinationEntry(lassenDunesDataEn, (c) => LassenDunesPage(title: lassenDunesDataEn.name)),
  DestinationEntry(monoLakeDataEn, (c) => MonoLakePage(title: monoLakeDataEn.name)),
  DestinationEntry(flyGeyserDataEn, (c) => FlyGeyserPage(title: flyGeyserDataEn.name)),
];