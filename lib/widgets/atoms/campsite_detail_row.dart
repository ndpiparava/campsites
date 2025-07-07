import 'package:flutter/material.dart';
import '../../styles/theme.dart';

class DetailRow extends StatelessWidget {
  final String label;
  final String detail;
  final double labelWidth;

  const DetailRow({
    Key? key,
    required this.label,
    required this.detail,
    this.labelWidth = 130,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: labelWidth,
            child: Text(label, style: AppTheme.textStyles.bodyMediumBold),
          ),
          Expanded(
            child: Text(detail),
          ),
        ],
      ),
    );
  }
}
