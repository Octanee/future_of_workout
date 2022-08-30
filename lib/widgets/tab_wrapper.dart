import 'package:flutter/material.dart';
import '../various/colors.dart';

class TabWrapper extends StatelessWidget {
  const TabWrapper({
    required this.child,
    this.hasFloatingActionButton = false,
    this.onPressedFloatingActionButton,
    this.floatingActionButtonIcon,
    Key? key,
  })  : assert(hasFloatingActionButton == true
            ? (onPressedFloatingActionButton != null &&
                floatingActionButtonIcon != null)
            : true),
        super(key: key);

  final Widget child;
  final bool hasFloatingActionButton;
  final void Function()? onPressedFloatingActionButton;
  final IconData? floatingActionButtonIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: hasFloatingActionButton
          ? FloatingActionButton(
              backgroundColor: AppColors.yellow,
              onPressed: onPressedFloatingActionButton,
              child: Icon(
                floatingActionButtonIcon,
                size: 32,
                color: AppColors.grey,
              ),
            )
          : null,
      body: child,
    );
  }
}
