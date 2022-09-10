import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    required this.text,
    required this.icon,
    this.onTap,
    super.key,
  });

  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomBar(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      onTap: onTap,
      child: _getContent(),
    );
  }

  Widget _getContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppTextStyle.semiBold20,
        ),
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: AppColors.yellow,
          ),
          child: Icon(
            icon,
            size: 24,
            color: AppColors.grey,
          ),
        )
      ],
    );
  }
}