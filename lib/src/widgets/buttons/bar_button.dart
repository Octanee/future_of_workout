import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    required this.text,
    required this.icon,
    this.onTap,
    this.size = 40,
    super.key,
  });

  final String text;
  final Widget icon;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomBar(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyle.semiBold20,
          ),
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              color: AppColors.yellow,
            ),
            child: icon,
          ),
        ],
      ),
    );
  }
}
