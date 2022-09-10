import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: AppColors.white,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.yellow,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: AppColors.yellow,
    );
  }
}
