import 'package:flutter/material.dart';

class RadioOption<T> {
  final T value;
  final String label;

  const RadioOption({required this.value, required this.label});
}

class RadioGroup<T> extends StatelessWidget {
  final String title;
  final T? groupValue;
  final List<RadioOption<T>> options;
  final ValueChanged<T?> onChanged;

  const RadioGroup({
    Key? key,
    required this.title,
    required this.groupValue,
    required this.options,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Column(
          // ✅ Use Column instead of Wrap
          children: options.map((option) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<T?>(
                  value: option.value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
                Text(option.label),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
