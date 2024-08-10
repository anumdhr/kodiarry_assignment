import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(27.6618319, 85.3022104); // San Francisco

  final Set<Polygon> _polygons = {
    Polygon(
      polygonId: PolygonId('polygon1'),
      points: [
        LatLng(27.6618319, 85.3022104),
        LatLng(27.6572758, 85.3014879),
        LatLng(27.6562571, 85.3104714),
        LatLng(27.6550474, 85.3161921),
      ],
      strokeColor: Colors.blue,
      strokeWidth: 3,
      fillColor: Colors.blue.withOpacity(0.2),
    )
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps with Polygon'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        polygons: _polygons,
      ),
    );
  }
}







// class MapPage extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<MapPage> {
//   Completer<GoogleMapController> _controller = Completer();
//
//   final LatLng _center = const LatLng(27.6332, 85.5277); // San Francisco
//
//
//
//   void _onMapCreated(GoogleMapController controller) {
//     _controller.complete(controller);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Maps with Polygon'),
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: _center,
//           zoom: 14.0,
//         ),
//
//       ),
//     );
//   }
// }
