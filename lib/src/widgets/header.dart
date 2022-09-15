import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class Header extends StatelessWidget {
  const Header({
    required this.text,
    this.padding = const EdgeInsets.only(bottom: 8),
    super.key,
  });

  final String text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.yellow,
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: AppTextStyle.semiBold20.copyWith(color: AppColors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
