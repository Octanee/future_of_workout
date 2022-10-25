import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';

class SetupContent extends StatelessWidget {
  const SetupContent({
    super.key,
    required this.title,
    required this.description,
    required this.children,
  });

  final String title;
  final String description;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.bold28),
        const SizedBox(height: 8),
        Text(description, style: AppTextStyle.regular16),
        for (var item in children) ...[
          const Spacer(),
          item,
        ],
        const Spacer(),
      ],
    );
  }
}
