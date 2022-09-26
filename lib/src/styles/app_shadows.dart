import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class AppShadows {
  const AppShadows._();

  static BoxShadow shadow10 = BoxShadow(
    color: AppColors.grey.withOpacity(0.10),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

  static BoxShadow shadow15 = BoxShadow(
    color: AppColors.grey.withOpacity(0.15),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

  static BoxShadow shadow20 = BoxShadow(
    color: AppColors.grey.withOpacity(0.20),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

  static BoxShadow shadow25 = BoxShadow(
    color: AppColors.grey.withOpacity(0.25),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

    static BoxShadow shadow50 = BoxShadow(
    color: AppColors.grey.withOpacity(0.5),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );
}
