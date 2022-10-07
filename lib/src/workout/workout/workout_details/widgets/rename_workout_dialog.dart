import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class RenameWorkoutDialog extends StatelessWidget {
  const RenameWorkoutDialog({required this.onConfirm, super.key});

  final ValueChanged<String> onConfirm;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return CustomDialog(
      title: 'Change name',
      content: TextField(
        controller: controller,
        style: AppTextStyle.bold28,
        decoration: const InputDecoration(
          hintText: 'Name',
        ),
      ),
      onConfirm: () {
        final name = controller.text;

        onConfirm(name);
      },
    );
  }
}
