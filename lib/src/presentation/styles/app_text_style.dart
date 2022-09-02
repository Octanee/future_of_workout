import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styles.dart';

class AppTextStyle {
  const AppTextStyle._();
  
  static TextStyle bold28 = GoogleFonts.workSans(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.grey,
  );

  static TextStyle semiBold16 = GoogleFonts.workSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
  );

  static TextStyle semiBold20 = GoogleFonts.workSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.grey,
  );

  static TextStyle bold20 = GoogleFonts.workSans(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );

  static TextStyle medium16 = GoogleFonts.workSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
}
