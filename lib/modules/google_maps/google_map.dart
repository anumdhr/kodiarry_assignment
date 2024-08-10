import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(27.6318496, 85.511409);

  final Set<Polygon> _polygons = {
    Polygon(
      polygonId: const PolygonId('polygon1'),
      points: const [
        LatLng(27.6318496, 85.511409),
        LatLng(27.6295633, 85.5117358),
        LatLng(27.6275661, 85.5250957),
        LatLng(27.6334207, 85.5190829),
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
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text('Google Maps with Polygon'),
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
