import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class RenameWorkoutDialog extends StatelessWidget {
  const RenameWorkoutDialog({
    required this.onConfirm,
    required this.name,
    super.key,
  });

  final ValueChanged<String> onConfirm;
  final String name;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: name);
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
