import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    required this.onPressed,
    this.isVisible = false,
    super.key,
  });

  final bool isVisible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 4,
            color: AppColors.yellow,
          ),
          foregroundColor: AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: onPressed,
        child: const Icon(Icons.keyboard_arrow_left_rounded),
      ),
    );
  }
}
