import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isSelected = false,
    this.isCompleted = false,
  });

  final bool isSelected;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: AnimatedContainer(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 300),
        height: isSelected ? 32 : 16,
        width: 4,
        decoration: BoxDecoration(
          color: isCompleted ? AppColors.yellow : AppColors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
