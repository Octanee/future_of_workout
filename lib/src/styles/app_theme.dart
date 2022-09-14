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
          borderSide: BorderSide(color: AppColors.yellow, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.yellow, width: 3),
        ),
        contentPadding: EdgeInsets.zero,
        suffixStyle: AppTextStyle.medium16,
        hintStyle: AppTextStyle.medium16.copyWith(
          color: AppColors.grey.withOpacity(0.4),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.yellow,
        selectionColor: AppColors.yellow,
        selectionHandleColor: AppColors.yellow,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColors.yellow,
          onPrimary: AppColors.grey,
          shape: const StadiumBorder(),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: AppColors.yellow,
          shape: const StadiumBorder(),
        ),
      ),
    );
  }
}
