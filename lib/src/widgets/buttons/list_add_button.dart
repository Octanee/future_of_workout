import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ListAddButton extends StatelessWidget {
  const ListAddButton({required this.onTap, this.text = 'Add', super.key});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text,
      icon: const AppIcon(iconData: AppIcons.listAdd),
      onTap: onTap,
    );
  }
}
