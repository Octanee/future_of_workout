import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class TextFloatingActionButton extends StatelessWidget {
  const TextFloatingActionButton({
    required this.text,
    this.isLoading = false,
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: AppTextStyle.semiBold16,
            ),
    );
  }
}
