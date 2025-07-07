import 'package:flutter/material.dart';

class ChipOption<T> {
  final T value;
  final String label;

  ChipOption({required this.value, required this.label});
}

class MultiSelectChipGroup<T> extends StatelessWidget {
  final String title;
  final List<T> selectedValues;
  final List<ChipOption<T>> options;
  final ValueChanged<List<T>> onChanged;

  const MultiSelectChipGroup({
    Key? key,
    required this.title,
    required this.selectedValues,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Wrap(
          spacing: 8,
          children: options.map((option) {
            final isSelected = selectedValues.contains(option.value);

            return FilterChip(
              label: Text(option.label),
              selected: isSelected,
              onSelected: (selected) {
                final updated = List<T>.from(selectedValues);
                if (selected) {
                  updated.add(option.value);
                } else {
                  updated.remove(option.value);
                }
                onChanged(updated);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
