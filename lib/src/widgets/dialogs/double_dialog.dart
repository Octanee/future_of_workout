import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/shared/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/dialogs/custom_dialog.dart';

class DoubleDialog extends StatefulWidget {
  const DoubleDialog({
    required this.onConfirm,
    this.title = 'Add value',
    this.value,
    this.confirmButtonText = 'Add',
    this.negativeButtonText = 'Cancel',
    this.hintText,
    this.suffixText,
    this.maxValue = 999,
    this.decimalPoint = 1,
    super.key,
  });

  final String title;
  final double? value;
  final ValueChanged<double> onConfirm;
  final String confirmButtonText;
  final String negativeButtonText;
  final String? hintText;
  final String? suffixText;
  final int maxValue;
  final int decimalPoint;

  @override
  State<DoubleDialog> createState() => _DoubleDialogState();
}

class _DoubleDialogState extends State<DoubleDialog> {
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
        final value = double.tryParse(controller.text);

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
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d*\.?\d{0,' '${widget.decimalPoint}' '}'),
                ),
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
