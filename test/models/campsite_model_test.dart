import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_campsite_app/models/campsite.dart';
import '../mocks.dart';

void main() {
  test('Campsite.fromJson parses valid coordinates correctly', () {
    final campsite = Campsite.fromJson(mockCampsiteJson);
    expect(campsite.label, 'Forest');
    expect(campsite.geoLocation.lat, 1);
    expect(campsite.geoLocation.long, 2);
  });

  test('Campsite.fromJson uses default location for invalid coordinates', () {
    final invalidJson = {
      ...mockCampsiteJson,
      'geoLocation': {
        'lat': 999, // invalid latitude
        'long': -999 // invalid longitude
      }
    };

    final campsite = Campsite.fromJson(invalidJson);

    expect(campsite.geoLocation.lat, GeoLocation.defaultGermanCenter.lat);
    expect(campsite.geoLocation.long, GeoLocation.defaultGermanCenter.long);
  });

  test('Campsite.fromJson uses default location for missing coordinates', () {
    final missingGeoJson = {
      ...mockCampsiteJson,
      'geoLocation': <String, dynamic>{}, // no lat, no long
    };

    final campsite = Campsite.fromJson(missingGeoJson);

    expect(campsite.geoLocation.lat, GeoLocation.defaultGermanCenter.lat);
    expect(campsite.geoLocation.long, GeoLocation.defaultGermanCenter.long);
  });
}
