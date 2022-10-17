import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class BoldText extends StatelessWidget {
  const BoldText({
    required this.boldText,
    this.mediumText = '',
    this.textAlign = TextAlign.start,
    super.key,
  });

  final String boldText;
  final String mediumText;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(text: boldText, style: AppTextStyle.semiBold20),
          TextSpan(text: mediumText, style: AppTextStyle.medium16),
        ],
      ),
    );
  }
}
