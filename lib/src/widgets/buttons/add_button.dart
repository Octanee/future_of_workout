import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class AddButton extends StatelessWidget {
  const AddButton({required this.onTap, this.text = 'Add', super.key});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text,
      icon: const AppIcon(iconData: AppIcons.plus),
      onTap: onTap,
    );
  }
}
