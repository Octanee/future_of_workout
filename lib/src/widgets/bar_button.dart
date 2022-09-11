import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    required this.text,
    required this.icon,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    super.key,
  });

  final String text;
  final Icon icon;
  final void Function()? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomBar(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        onTap: onTap,
        child: _getContent(),
      ),
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
          child: icon,
        )
      ],
    );
  }
}
