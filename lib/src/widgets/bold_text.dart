import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class BoldText extends StatelessWidget {
  BoldText({
    required this.boldText,
    this.mediumText = '',
    this.textAlign = TextAlign.start,
    TextStyle? boldTextStyle,
    TextStyle? mediumTextStyle,
    super.key,
  })  : boldTextStyle = boldTextStyle ?? AppTextStyle.semiBold20,
        mediumTextStyle = mediumTextStyle ?? AppTextStyle.medium16;

  final String boldText;
  final String mediumText;
  final TextAlign textAlign;
  final TextStyle boldTextStyle;
  final TextStyle mediumTextStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(text: boldText, style: boldTextStyle),
          TextSpan(text: mediumText, style: mediumTextStyle),
        ],
      ),
    );
  }
}
