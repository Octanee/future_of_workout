import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ReplaceButton extends StatelessWidget {
  const ReplaceButton({required this.onTap, this.text = 'Replace', super.key});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text,
      icon: const AppIcon(iconData: AppIcons.repeat),
      onTap: onTap,
    );
  }
}
