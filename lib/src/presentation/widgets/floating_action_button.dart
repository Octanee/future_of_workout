import 'package:flutter/material.dart';

import 'package:future_of_workout/src/presentation/styles/styles.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    this.onPressedFloatingActionButton,
    this.floatingActionButtonIcon,
    super.key,
  });

  final void Function()? onPressedFloatingActionButton;
  final IconData? floatingActionButtonIcon;
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.yellow,
      onPressed: onPressedFloatingActionButton,
      child: Icon(
        floatingActionButtonIcon,
        size: 32,
        color: AppColors.grey,
      ),
    );
  }
}
