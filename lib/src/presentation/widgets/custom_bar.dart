import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
    this.onTap,
    super.key,
  });

  final Widget child;
  final void Function()? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.0),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: AppColors.white,
          boxShadow: [AppShadows.shadow15],
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
