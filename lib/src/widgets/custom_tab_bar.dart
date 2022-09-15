import 'package:flutter/material.dart';
import 'package:future_of_workout/src/extensions.dart';

import 'package:future_of_workout/src/styles/styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    required this.tabs,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    super.key,
  });

  final List<Tab> tabs;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: padding,
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.white,
          boxShadow: [AppShadows.shadow15],
        ),
        child: TabBar(
          //    isScrollable: true,
          labelPadding: EdgeInsets.zero,
          labelColor: AppColors.grey,
          labelStyle: AppTextStyle.semiBold16,
          indicator: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.yellow.darken(amount: 0.04),
                AppColors.yellow,
                AppColors.yellow.lighten(),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          tabs: tabs,
        ),
      ),
    );
  }
}
