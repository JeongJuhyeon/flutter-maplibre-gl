// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:maplibre_gl/mapbox_gl.dart';
// import 'package:maplibre_gl_example/page.dart';

// import 'util.dart';

// class LayerFillPage extends ExamplePage {
//   const LayerFillPage({super.key})
//       : super(const Icon(Icons.share), 'Layer Fill-Only');

//   @override
//   Widget build(BuildContext context) => const LayerFillBody();
// }

// class LayerFillBody extends StatefulWidget {
//   const LayerFillBody({super.key});

//   @override
//   State<StatefulWidget> createState() => LayerFillState();
// }

// class LayerFillState extends State {
//   static const LatLng center = LatLng(-33.86711, 151.1947171);

//   late MaplibreMapController controller;
//   Timer? filterTimer;
//   int filteredId = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaplibreMap(
//       dragEnabled: false,
//       myLocationEnabled: true,
//       onMapCreated: _onMapCreated,
//       onMapClick: (point, latLong) =>
//           debugPrint(point.toString() + latLong.toString()),
//       onStyleLoadedCallback: _onStyleLoadedCallback,
//       initialCameraPosition: const CameraPosition(
//         target: center,
//         zoom: 11.0,
//       ),
//       annotationOrder: const [],
//     );
//   }

//   void _onMapCreated(MaplibreMapController controller) {
//     this.controller = controller;

//     controller.onFeatureTapped.add(onFeatureTap);
//   }

//   void onFeatureTap(dynamic featureId, Point<double> point, LatLng latLng) {
//     final snackBar = SnackBar(
//       content: Text(
//         'Tapped feature with id $featureId',
//         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//       backgroundColor: Theme.of(context).primaryColor,
//     );
//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   void _onStyleLoadedCallback() async {
//     await addImageFromAsset(
//         controller, "custom-marker", "assets/symbols/custom-marker.png");

//     //new style of adding sources
//     await controller.addSource("fills", GeojsonSourceProperties(data: _fills));

//     await controller.addFillLayer(
//       "fills",
//       "fills",
//       const FillLayerProperties(fillColor: [
//         Expressions.interpolate,
//         ['exponential', 0.5],
//         [Expressions.zoom],
//         11,
//         'red',
//         18,
//         'green'
//       ], fillOpacity: 0.4),
//     );

//     filterTimer = Timer.periodic(const Duration(seconds: 3), (t) {
//       filteredId = filteredId == 0 ? 1 : 0;
//       controller.setFilter('fills', ['==', 'id', filteredId]);
//     });
//   }

//   @override
//   void dispose() {
//     filterTimer?.cancel();
//     super.dispose();
//   }
// }

// final _fills = {
//   "type": "FeatureCollection",
//   "features": [
//     {
//       "type": "Feature",
//       "id": 0, // web currently only supports number ids
//       "properties": <String, dynamic>{'id': 0},
//       "geometry": {
//         "type": "Polygon",
//         "coordinates": [
//           [
//             [151.178099204457737, -33.901517742631846],
//             [151.179025547977773, -33.872845324482071],
//             [151.147000529140399, -33.868230472039514],
//             [151.150838238009328, -33.883172899638311],
//             [151.14223647675135, -33.894158309528244],
//             [151.155999294764086, -33.904812805307806],
//             [151.178099204457737, -33.901517742631846]
//           ],
//           [
//             [151.162657925954278, -33.879168932438581],
//             [151.155323416087612, -33.890737666431583],
//             [151.173659690754278, -33.897637567778119],
//             [151.162657925954278, -33.879168932438581]
//           ]
//         ]
//       }
//     },
//     {
//       "type": "Feature",
//       "id": 1,
//       "properties": <String, dynamic>{'id': 1},
//       "geometry": {
//         "type": "Polygon",
//         "coordinates": [
//           [
//             [151.18735077583878, -33.891143558434102],
//             [151.197374605989864, -33.878357032551868],
//             [151.213021560372084, -33.886475683791488],
//             [151.204953599518745, -33.899463918807818],
//             [151.18735077583878, -33.891143558434102]
//           ]
//         ]
//       }
//     }
//   ]
// };
