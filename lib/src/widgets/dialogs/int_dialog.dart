import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/shared/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/dialogs/custom_dialog.dart';

class IntDialog extends StatefulWidget {
  const IntDialog({
    required this.onConfirm,
    this.title = 'Add value',
    this.value,
    this.confirmButtonText = 'Add',
    this.negativeButtonText = 'Cancel',
    this.hintText,
    this.suffixText,
    this.maxValue = 999,
    super.key,
  });

  final String title;
  final int? value;
  final ValueChanged<int> onConfirm;
  final String confirmButtonText;
  final String negativeButtonText;
  final String? hintText;
  final String? suffixText;
  final int maxValue;

  @override
  State<IntDialog> createState() => _IntDialogState();
}

class _IntDialogState extends State<IntDialog> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value?.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: widget.title,
      confirmButtonText: widget.confirmButtonText,
      negativeButtonText: widget.negativeButtonText,
      onConfirm: () {
        final value = int.tryParse(controller.text);

        if (value != null) {
          widget.onConfirm(value);
        }
      },
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericalRangeFormatter(min: 0, max: widget.maxValue)
              ],
              textAlign: TextAlign.center,
              style: AppTextStyle.bold28,
              decoration: InputDecoration(
                hintText: widget.hintText,
                suffixText: widget.suffixText,
                counterText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
