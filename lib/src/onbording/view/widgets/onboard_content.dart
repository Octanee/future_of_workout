import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.title,
    required this.description,
    required this.child,
  });

  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.bold28),
        const SizedBox(height: 8),
        Text(description, style: AppTextStyle.regular16),
        const Spacer(),
        child,
        const Spacer(),
      ],
    );
  }
}
