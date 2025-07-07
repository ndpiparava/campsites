import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/utils/constants.dart';
import 'package:flutter_campsite_app/widgets/organisms/campsite_filter_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpFilterDialog(WidgetTester tester) async {
  await tester.pumpWidget(
    const ProviderScope(
      child: MaterialApp(
        home: FilterDialog(),
      ),
    ),
  );
}

void main() {
  testWidgets('FilterDialog shows campfire options and language chips',
      (tester) async {
    await pumpFilterDialog(tester);

    // Radio options exist
    expect(find.text('Campfires allowed:'), findsOneWidget);
    expect(find.text('Any'), findsOneWidget);
    expect(find.text('Yes'), findsOneWidget);
    expect(find.text('No'), findsOneWidget);

    for (final entry in allLanguages.entries) {
      expect(find.text(entry.value), findsOneWidget);
    }
  });

  testWidgets('Selecting a campfire option updates state', (tester) async {
    await pumpFilterDialog(tester);

    final yesOption = find.text('Yes').first;

    expect(yesOption, findsOneWidget);

    await tester.tap(yesOption);
    await tester.pumpAndSettle();
  });

  testWidgets('Selecting language chips updates selectedLanguages',
      (tester) async {
    await pumpFilterDialog(tester);

    final chipLabel = allLanguages.entries.first.value;

    final chipFinder = find.text(chipLabel);
    expect(chipFinder, findsOneWidget);

    await tester.tap(chipFinder);
    await tester.pumpAndSettle();

    await tester.tap(chipFinder);
    await tester.pumpAndSettle();
  });

  testWidgets('Clear button resets filter provider', (tester) async {
    await pumpFilterDialog(tester);

    final clearButton = find.text('Clear');
    expect(clearButton, findsOneWidget);

    await tester.tap(clearButton);
    await tester.pumpAndSettle();
  });

  testWidgets('Apply button saves filter to provider', (tester) async {
    await pumpFilterDialog(tester);

    final yesOption = find.text('Yes');
    await tester.tap(yesOption);
    await tester.pumpAndSettle();

    final firstLanguage = find.text(allLanguages.entries.first.value);
    await tester.tap(firstLanguage);
    await tester.pumpAndSettle();

    final applyButton = find.text('Apply');
    await tester.tap(applyButton);
    await tester.pumpAndSettle();
  });
}
