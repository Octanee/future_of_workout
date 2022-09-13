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
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: AppColors.grey,
        iconSize: 32,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.grey,
        size: 32,
      ),
      navigationBarTheme: NavigationBarThemeData(
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>((states) {
          return const IconThemeData(color: AppColors.grey);
        }),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      toggleableActiveColor: AppColors.yellow,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.zero,
        suffixStyle: AppTextStyle.medium16,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.yellow,
        selectionColor: AppColors.yellow,
        selectionHandleColor: AppColors.yellow,
      ),
    );
  }
}
