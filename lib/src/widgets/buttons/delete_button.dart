import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    required this.onConfirm,
    this.text = 'Delete',
    this.dialogText = 'Are you sure you want to delete?',
    super.key,
  });

  final VoidCallback onConfirm;
  final String text;
  final String dialogText;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: text,
      icon: const AppIcon(iconData: AppIcons.trash),
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
