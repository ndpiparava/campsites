import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_campsite_app/models/campsite.dart';
import 'package:flutter_campsite_app/widgets/organisms/campsite_card.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import '../../mocks.dart';

void main() {
  testWidgets('CampsiteCard shows details modal on tap', (tester) async {
    final campsite = Campsite.fromJson(mockCampsiteJson);
    await mockNetworkImages(() async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CampsiteCard(campsite: campsite)),
      ));

      await tester.pump();
      expect(find.text('Forest'), findsOneWidget);
      await tester.tap(find.byType(CampsiteCard));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Forest'), findsWidgets);
    });
  });
}
