import 'package:flutter/material.dart';

import '../various/various.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final void Function()? onTap;

  const CustomCard({
    required this.child,
    this.padding,
    this.onTap,
    Key? key,
  }) : super(key: key);

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

    // Container(
    //   padding: padding,
    //   decoration: BoxDecoration(
    //     color: AppColors.white,
    //     borderRadius: BorderRadius.circular(16),
    //     boxShadow: [
    //       AppShadows.shadow10,
    //     ],
    //   ),
    //   child: child,
    // );
  }
}
