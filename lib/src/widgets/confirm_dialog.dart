import 'package:flutter/material.dart';

import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
  });

  final String title;
  final String content;

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: Text(
        content,
        style: AppTextStyle.semiBold16,
      ),
      onConfirm: onConfirm,
    );
  }
}
