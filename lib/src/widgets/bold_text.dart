import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    required this.boldText,
    this.mediumText = '',
    super.key,
  });

  final String boldText;
  final String mediumText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: boldText, style: AppTextStyle.semiBold20),
          TextSpan(text: mediumText, style: AppTextStyle.medium16),
        ],
      ),
    );
  }
}
