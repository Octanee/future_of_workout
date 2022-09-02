import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.child,
    this.padding,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets? padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.white,
          boxShadow: [AppShadows.shadow15],
        ),
        child: child,
      ),
    );
  }
}
