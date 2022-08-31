import 'package:flutter/material.dart';

import '../various/various.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    this.padding,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          AppShadows.shadow10,
        ],
      ),
      child: child,
    );
  }
}
