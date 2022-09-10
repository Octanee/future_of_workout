import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    this.padding,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsets? padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
          boxShadow: [AppShadows.shadow15],
        ),
        child: child,
      ),
    );
  }
}
