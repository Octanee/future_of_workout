import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/styles.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64),
          color: AppColors.yellow,
        ),
        child: child,
      ),
    );
  }
}
