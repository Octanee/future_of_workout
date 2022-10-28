import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:lottie/lottie.dart';

class TextFloatingActionButton extends StatelessWidget {
  const TextFloatingActionButton({
    required this.text,
    this.isLoading = false,
    this.onPressed,
    this.lottieName = 'assets/lottie/loading.json',
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final String text;
  final String lottieName;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: isLoading
          ? Lottie.asset(
              lottieName,
            )
          : Text(
              text,
              style: AppTextStyle.semiBold16,
            ),
    );
  }
}
