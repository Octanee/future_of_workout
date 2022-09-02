import 'package:flutter/material.dart';

import '../styles/styles.dart';

class BarButton extends StatelessWidget {
  const BarButton({
    required this.text,
    required this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.0),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: AppColors.white,
          boxShadow: [AppShadows.shadow15],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: _getContent(),
        ),
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
