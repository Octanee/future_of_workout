import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class EditButton extends StatelessWidget {
  const EditButton({required this.onTap, this.text = 'Edit', super.key});

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text,
      icon: const AppIcon(iconData: AppIcons.pencil),
      onTap: onTap,
    );
  }
}
