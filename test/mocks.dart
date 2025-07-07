// test/mocks.dart

import 'package:flutter_campsite_app/models/campsite.dart';

final mockCampsiteJson = {
  'id': '1',
  'label': 'Forest',
  'photo': 'https://placekitten.com/200/200',
  'geoLocation': {'lat': 1, 'long': 2},
  'isCloseToWater': true,
  'isCampFireAllowed': true,
  'hostLanguages': ['en'],
  'pricePerNight': 12,
  'suitableFor': ['families'],
  'createdAt': DateTime.now().toIso8601String(),
};

final mockCampsite = Campsite.fromJson(mockCampsiteJson);
