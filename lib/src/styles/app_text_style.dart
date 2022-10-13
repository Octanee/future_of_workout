import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  const AppTextStyle._();

  static TextStyle bold96 = _workSans(
    fontSize: 96,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold28 = _workSans(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold24 = _workSans(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold20 = _workSans(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static TextStyle bold16 = _workSans(
    fontWeight: FontWeight.w700,
  );

  static TextStyle semiBold12 = _workSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold16 = _workSans(
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold20 = _workSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle medium16 = _workSans(
    fontWeight: FontWeight.w500,
  );

  static TextStyle medium20 = _workSans(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle _workSans({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.workSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: AppColors.grey,
    );
  }
}
