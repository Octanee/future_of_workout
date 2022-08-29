import 'package:flutter/material.dart';
import 'package:future_of_workout/custom/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    Key? key,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
