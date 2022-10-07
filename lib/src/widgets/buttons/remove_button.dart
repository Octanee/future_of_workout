import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    required this.onConfirm,
    this.text = 'Remove',
    this.dialogText = 'Are you sure you want to remove?',
    super.key,
  });

  final VoidCallback onConfirm;
  final String text;
  final String dialogText;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text,
      icon: const Icon(Icons.remove),
      onTap: () async {
        await showDialog<void>(
          context: context,
          builder: (builderContext) => ConfirmDialog(
            title: text,
            content: Text(
              dialogText,
              style: AppTextStyle.medium16,
            ),
            onConfirm: onConfirm,
          ),
        );
      },
    );
  }
}
