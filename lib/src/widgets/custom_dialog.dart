import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/app_text_style.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.negativeButtonText = 'Cancel',
    this.confirmButtonText = 'Save',
  });

  final String title;
  final Widget content;

  final VoidCallback onConfirm;
  final String negativeButtonText;
  final String confirmButtonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyle.semiBold20,
      ),
      content: content,
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(negativeButtonText),
        ),
        ElevatedButton(
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
