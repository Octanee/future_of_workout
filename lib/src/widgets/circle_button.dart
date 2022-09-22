import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/styles.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.child,
    this.onTap,
    this.size = 48,
  });

  final double size;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size),
      child: Ink(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64),
          color: AppColors.yellow,
        ),
        child: Center(child: child),
      ),
    );
  }
}
