import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const colors = _AppColors();
  static const fontSizes = _AppFontSizes();
  static const lineHeights = _AppLineHeights();
  static const textStyles = _AppTextStyles();
}

class _AppColors {
  const _AppColors();

  static const Color primary = Colors.indigo;
  static const Color secondary = Colors.green;
  static const Color danger = Colors.red;
  static const Color textPrimary = Colors.black87;
  static const Color textInverse = Colors.white;
  static const Color grey = Color(0xFFE0E0E0);
}

extension AppColorsExtension on _AppColors {
  Color get primary => _AppColors.primary;
  Color get secondary => _AppColors.secondary;
  Color get danger => _AppColors.danger;
  Color get textPrimary => _AppColors.textPrimary;
  Color get textInverse => _AppColors.textInverse;
  Color get grey => _AppColors.grey;
}

class _AppFontSizes {
  const _AppFontSizes();

  static const double body = 16;
  static const double headline = 24;
}

extension AppFontSizesExtension on _AppFontSizes {
  double get body => _AppFontSizes.body;
  double get headline => _AppFontSizes.headline;
}

class _AppLineHeights {
  const _AppLineHeights();

  static const double normal = 1.4;
  static const double tight = 1.2;
}

extension AppLineHeightsExtension on _AppLineHeights {
  double get normal => _AppLineHeights.normal;
  double get tight => _AppLineHeights.tight;
}

class _AppTextStyles {
  const _AppTextStyles();

  TextStyle get headlineSmall => TextStyle(
        fontSize: AppTheme.fontSizes.headline,
        fontWeight: FontWeight.bold,
        color: AppTheme.colors.primary,
        height: AppTheme.lineHeights.normal,
      );

  TextStyle get bodyMedium => TextStyle(
        fontSize: AppTheme.fontSizes.body,
        color: AppTheme.colors.textPrimary,
        height: AppTheme.lineHeights.normal,
      );

  TextStyle get bodyMediumBold => TextStyle(
        fontSize: AppTheme.fontSizes.body,
        color: AppTheme.colors.textPrimary,
        height: AppTheme.lineHeights.normal,
        fontWeight: FontWeight.bold,
      );

  TextStyle get bodyMediumGreen => TextStyle(
        fontSize: AppTheme.fontSizes.body,
        color: AppTheme.colors.secondary,
        height: AppTheme.lineHeights.normal,
      );

  TextStyle get bodyMediumRed => TextStyle(
        fontSize: AppTheme.fontSizes.body,
        color: AppTheme.colors.danger,
        height: AppTheme.lineHeights.normal,
      );
}
