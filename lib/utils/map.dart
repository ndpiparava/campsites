import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/campsite.dart';

final _random = Random();

Set<Marker> generateRandomizedMarkers(List<Campsite> campsites) {
  return campsites.asMap().entries.map((entry) {
    final index = entry.key;
    final campsite = entry.value;

    final double latOffset = (_random.nextDouble() - 0.5) * 0.011;
    final double longOffset = (_random.nextDouble() - 0.5) * 0.011;

    return Marker(
      markerId: MarkerId(campsite.id),
      position: LatLng(
        campsite.geoLocation.lat + latOffset,
        campsite.geoLocation.long + longOffset,
      ),
      infoWindow: InfoWindow(
        title: campsite.label,
        snippet:
            '€${campsite.pricePerNight}/night\nCampfire: ${campsite.isCampFireAllowed ? "🔥" : "🚫"}',
      ),
    );
  }).toSet();
}

Future<void> fitMarkersToBounds(
  GoogleMapController controller,
  Set<Marker> markers,
) async {
  if (markers.isEmpty) return;

  final latitudes = markers.map((m) => m.position.latitude).toList();
  final longitudes = markers.map((m) => m.position.longitude).toList();

  final southwest = LatLng(
    latitudes.reduce(min),
    longitudes.reduce(min),
  );
  final northeast = LatLng(
    latitudes.reduce(max),
    longitudes.reduce(max),
  );

  final bounds = LatLngBounds(southwest: southwest, northeast: northeast);

  await controller.animateCamera(
    CameraUpdate.newLatLngBounds(bounds, 50),
  );
}
