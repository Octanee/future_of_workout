import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    required this.tabs,
    super.key,
  });

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.white,
          boxShadow: [AppShadows.shadow15],
        ),
        child: TabBar(
          labelColor: AppColors.grey,
          labelStyle: AppTextStyle.semiBold16,
          indicator: BoxDecoration(
            color: AppColors.yellow,
            borderRadius: BorderRadius.circular(16),
          ),
          tabs: tabs,
        ),
      ),
    );
  }
}
