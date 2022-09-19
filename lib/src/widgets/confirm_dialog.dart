import 'package:flutter/material.dart';

import 'package:future_of_workout/src/widgets/widgets.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmButtonText = 'Yes',
  });

  final String title;
  final Widget content;
  final String confirmButtonText;

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: content,
      onConfirm: onConfirm,
      confirmButtonText: confirmButtonText,
    );
  }
}
