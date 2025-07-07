import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:flutter_campsite_app/models/campsite.dart';
import 'package:flutter_campsite_app/views/home_view.dart';
import 'package:flutter_campsite_app/providers/campsite_provider.dart';

import '../mocks.dart';

void main() {
  testWidgets('HomeView shows list of campsites', (tester) async {
    await mockNetworkImagesFor(() async {
      final campsite = Campsite.fromJson(mockCampsiteJson);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            campsiteListProvider.overrideWith(
              (ref) => Future.value([campsite]),
            ),
          ],
          child: MaterialApp(home: HomeView()),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text(campsite.label), findsOneWidget);
    });
  });
}
