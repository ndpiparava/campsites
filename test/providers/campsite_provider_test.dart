// test/providers/campsite_provider_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_campsite_app/models/campsite.dart';
import 'package:flutter_campsite_app/providers/campsite_provider.dart';
import 'package:flutter_campsite_app/services/campsite_service.dart';
import '../mocks.dart';

class FakeCampsiteService extends CampsiteService {
  final campsite = Campsite.fromJson(mockCampsiteJson);
  @override
  Future<List<Campsite>> fetchCampsites() async {
    return [campsite];
  }
}

void main() {
  test('campsiteListProvider fetches and sorts campsites', () async {
    final container = ProviderContainer(overrides: [
      campsiteServiceProvider.overrideWithValue(FakeCampsiteService()),
    ]);

    final campsites = await container.read(campsiteListProvider.future);

    expect(campsites.length, 1);
    expect(campsites.first.label, 'Forest');
  });
}
