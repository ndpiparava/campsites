import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/utils/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/campsite.dart';

class MapView extends StatefulWidget {
  final List<Campsite> campsites;

  const MapView({Key? key, required this.campsites}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    final markers = generateRandomizedMarkers(widget.campsites);

    final fallbackPosition = widget.campsites.isNotEmpty
        ? LatLng(
            widget.campsites[0].geoLocation.lat,
            widget.campsites[0].geoLocation.long,
          )
        : LatLng(
            GeoLocation.defaultGermanCenter.lat,
            GeoLocation.defaultGermanCenter.long,
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locate your camp'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: fallbackPosition,
          zoom: 6,
        ),
        markers: markers,
        onMapCreated: (controller) {
          fitMarkersToBounds(controller, markers);
        },
      ),
    );
  }
}
