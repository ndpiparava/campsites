import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart'; // Add this import
import 'package:flutter_campsite_app/widgets/organisms/campsite_card.dart';
import 'package:flutter_campsite_app/models/campsite.dart';
import '../../mocks.dart';

void main() {
  testWidgets('CampsiteCard shows details modal on tap', (tester) async {
    await mockNetworkImagesFor(() async {
      final campsite = Campsite.fromJson(mockCampsiteJson);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CampsiteCard(campsite: campsite)),
      ));

      expect(find.text('Forest'), findsOneWidget);

      await tester.tap(find.byType(CampsiteCard));

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Forest'), findsWidgets);
    });
  });
}
