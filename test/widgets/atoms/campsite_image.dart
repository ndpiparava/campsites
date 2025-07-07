import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/widgets/atoms/campsite_image.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  testWidgets('Shows placeholder while loading', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CachedCampsiteImage(
          imageUrl: 'https://example.com/image.jpg',
          width: 100,
          height: 100,
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Shows error widget when image fails to load', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CachedCampsiteImage(
          imageUrl: 'https://bad.url/image.jpg',
          width: 100,
          height: 100,
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    final image =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    final errorWidget = image.errorWidget!(
      tester.element(find.byType(CachedNetworkImage)),
      image.imageUrl,
      Exception(),
    );

    await tester.pumpWidget(MaterialApp(home: errorWidget));

    expect(find.byIcon(Icons.error), findsOneWidget);
  });

  testWidgets('Uses correct dimensions & border radius', (tester) async {
    const testWidth = 120.0;
    const testHeight = 80.0;
    const testBorderRadius = 16.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: CachedCampsiteImage(
          imageUrl: 'https://example.com/image.jpg',
          width: testWidth,
          height: testHeight,
          borderRadius: testBorderRadius,
        ),
      ),
    );

    final clip = tester.widget<ClipRRect>(find.byType(ClipRRect));
    expect(clip.borderRadius, BorderRadius.circular(testBorderRadius));

    final image =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(image.width, testWidth);
    expect(image.height, testHeight);
  });
}
