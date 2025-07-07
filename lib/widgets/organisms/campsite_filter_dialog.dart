import 'package:flutter/material.dart';
import 'package:flutter_campsite_app/models/campsite_filter.dart';
import 'package:flutter_campsite_app/providers/campsite_provider.dart';
import 'package:flutter_campsite_app/utils/constants.dart';
import 'package:flutter_campsite_app/widgets/molecules/multi_chip_group.dart';
import 'package:flutter_campsite_app/widgets/molecules/radio_group.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterDialog extends ConsumerStatefulWidget {
  final List<RadioOption<bool?>> campfireOptions;
  final List<ChipOption<String>> languageOptions;

  const FilterDialog({
    super.key,
    this.campfireOptions = defaultCampfireOptions,
    this.languageOptions = const [],
  });

  @override
  ConsumerState<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<FilterDialog> {
  bool? campfireAllowed;
  List<String> selectedLanguages = [];

  @override
  void initState() {
    super.initState();
    final filter = ref.read(campsiteFilterProvider);
    campfireAllowed = filter.campfireAllowed;
    selectedLanguages = filter.languages ?? [];
  }

  @override
  Widget build(BuildContext context) {
    // Fallback to `allLanguages` if none injected
    final chipOptions = widget.languageOptions.isNotEmpty
        ? widget.languageOptions
        : allLanguages.entries
            .map((entry) => ChipOption(
                  value: entry.key,
                  label: entry.value,
                ))
            .toList();

    return AlertDialog(
      title: const Text('Filter Campsites'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioGroup<bool?>(
              title: 'Campfires allowed:',
              groupValue: campfireAllowed,
              options: widget.campfireOptions,
              onChanged: (value) => setState(() => campfireAllowed = value),
            ),
            const SizedBox(height: 12),
            MultiSelectChipGroup<String>(
              title: 'Languages:',
              selectedValues: selectedLanguages,
              options: chipOptions,
              onChanged: (updated) =>
                  setState(() => selectedLanguages = updated),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            ref.read(campsiteFilterProvider.notifier).state =
                const CampsiteFilter();
            Navigator.pop(context);
          },
          child: const Text('Clear'),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(campsiteFilterProvider.notifier).state = CampsiteFilter(
              campfireAllowed: campfireAllowed,
              languages: selectedLanguages,
            );
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
