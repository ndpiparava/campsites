// test/services/campsite_service_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';

import '../../lib/services/campsite_service.dart';
import '../../lib/models/campsite.dart';

@GenerateMocks([http.Client])
import 'campsite_service_test.mocks.dart';

void main() {
  group('CampsiteService', () {
    test('fetchCampsites returns list of campsites when successful', () async {
      final client = MockClient(); // <-- auto-generated
      final service = CampsiteService(client: client);
      final mockResponse = [
        {
          "id": "1",
          "label": "Lake View",
          "photo": "https://example.com/photo.jpg",
          "geoLocation": {"lat": 12.34, "long": 56.78},
          "isCloseToWater": true,
          "isCampFireAllowed": true,
          "hostLanguages": ["en", "de"],
          "pricePerNight": 20,
          "suitableFor": ["families"],
          "createdAt": "2024-07-05T12:00:00Z"
        }
      ];

      when(client.get(any)).thenAnswer(
        (_) async => http.Response(jsonEncode(mockResponse), 200),
      );

      final response = await service.fetchCampsites();

      expect(response, isA<List<Campsite>>());
      expect(response.first.label, equals("Lake View"));
    });
  });
}
