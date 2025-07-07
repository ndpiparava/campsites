import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/widgets/atoms/campsite_detail_row.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_campsite_app/styles/theme.dart';

void main() {
  Future<void> pumpDetailRow(
    WidgetTester tester, {
    required String label,
    required String detail,
    double? labelWidth,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DetailRow(
            label: label,
            detail: detail,
            labelWidth: labelWidth ?? 130,
          ),
        ),
      ),
    );
  }

  group('DetailRow', () {
    testWidgets('renders label and detail text', (WidgetTester tester) async {
      await pumpDetailRow(
        tester,
        label: 'Campfire allowed:',
        detail: 'Yes',
      );

      expect(find.text('Campfire allowed:'), findsOneWidget);
      expect(find.text('Yes'), findsOneWidget);
    });

    testWidgets('uses default labelWidth', (WidgetTester tester) async {
      await pumpDetailRow(
        tester,
        label: 'Label',
        detail: 'Detail',
      );

      final sizedBox = tester.widget<SizedBox>(
        find.byWidgetPredicate(
          (widget) => widget is SizedBox && widget.width == 130,
        ),
      );

      expect(sizedBox.width, equals(130));
    });

    testWidgets('uses custom labelWidth', (WidgetTester tester) async {
      const customWidth = 200.0;

      await pumpDetailRow(
        tester,
        label: 'Label',
        detail: 'Detail',
        labelWidth: customWidth,
      );

      final sizedBox = tester.widget<SizedBox>(
        find.byWidgetPredicate(
          (widget) => widget is SizedBox && widget.width == customWidth,
        ),
      );

      expect(sizedBox.width, equals(customWidth));
    });

    testWidgets('applies AppTheme.bodyMediumBold to label text',
        (WidgetTester tester) async {
      await pumpDetailRow(
        tester,
        label: 'Label',
        detail: 'Detail',
      );

      final labelText = tester.widget<Text>(
        find.text('Label'),
      );

      expect(labelText.style, equals(AppTheme.textStyles.bodyMediumBold));
    });
  });
}
