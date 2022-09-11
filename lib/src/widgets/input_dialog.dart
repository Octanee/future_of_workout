import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/app_text_style.dart';

class InputDialog extends StatelessWidget {
  const InputDialog({
    super.key,
    required this.title,
    required this.onConfirm,
    required this.onNegative,
    this.negativeButtonText = 'Cancel',
    this.confirmButtonText = 'Confirm',
    this.initValue,
    this.hintText,
  });

  final String title;
  final String? initValue;
  final String? hintText;
  final ValueChanged<String> onConfirm;
  final VoidCallback onNegative;
  final String negativeButtonText;
  final String confirmButtonText;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(text: initValue);

    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyle.semiBold20,
      ),
      content: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: onNegative,
          style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
          child: Text(negativeButtonText),
        ),
        ElevatedButton(
          onPressed: textController.text.isNotEmpty
              ? () => onConfirm(textController.text)
              : null,
          style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
