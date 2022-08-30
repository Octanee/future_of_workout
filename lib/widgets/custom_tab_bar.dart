import 'package:flutter/material.dart';

import '../various/colors.dart';
import '../various/text_style.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    required this.tabs,
    Key? key,
  }) : super(key: key);

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.10),
              blurRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: TabBar(
          labelColor: AppColors.grey,
          labelStyle: AppTextStyle.textStyleSemiBold16,
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
