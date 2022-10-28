import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class StartButton extends StatelessWidget {
  const StartButton({required this.onTap, this.text = 'Start', super.key});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text,
      icon: const AppIcon(iconData: AppIcons.play),
      onTap: onTap,
    );
  }
}
