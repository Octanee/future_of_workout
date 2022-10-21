import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/shared/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/dialogs/custom_dialog.dart';

class NumberDialog<T extends num> extends StatefulWidget {
  const NumberDialog({
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
  final T? value;
  final ValueChanged<T> onConfirm;
  final String confirmButtonText;
  final String negativeButtonText;
  final String? hintText;
  final String? suffixText;
  final int maxValue;

  @override
  State<NumberDialog<T>> createState() => _NumberDialogState<T>();
}

class _NumberDialogState<T extends num> extends State<NumberDialog<T>> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value?.toStringAsFixed(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: widget.title,
      confirmButtonText: widget.confirmButtonText,
      negativeButtonText: widget.negativeButtonText,
      onConfirm: () {
        final value = num.tryParse(controller.text) as T?;

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
                  RegExp(r'^\d*\.?\d{0,1}'),
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
