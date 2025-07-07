import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/widgets/molecules/multi_chip_group.dart';
import 'package:flutter_test/flutter_test.dart';

class TestWrapper extends StatefulWidget {
  final List<ChipOption<String>> options;

  const TestWrapper({Key? key, required this.options}) : super(key: key);

  @override
  _TestWrapperState createState() => _TestWrapperState();
}

class _TestWrapperState extends State<TestWrapper> {
  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return MultiSelectChipGroup<String>(
      title: 'Test Chips',
      selectedValues: selectedValues,
      options: widget.options,
      onChanged: (updated) {
        setState(() {
          selectedValues = updated;
        });
      },
    );
  }
}

void main() {
  testWidgets('MultiSelectChipGroup displays options and toggles selection',
      (WidgetTester tester) async {
    final options = [
      ChipOption(value: 'A', label: 'Option A'),
      ChipOption(value: 'B', label: 'Option B'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TestWrapper(options: options),
        ),
      ),
    );

    expect(find.text('Option A'), findsOneWidget);
    expect(find.text('Option B'), findsOneWidget);

    await tester.tap(find.text('Option A'));
    await tester.pumpAndSettle();

    final state = tester.state<_TestWrapperState>(find.byType(TestWrapper));
    expect(state.selectedValues, contains('A'));

    await tester.tap(find.text('Option A'));
    await tester.pumpAndSettle();

    expect(state.selectedValues, isNot(contains('A')));
  });
}
