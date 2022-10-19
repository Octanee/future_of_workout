import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/dialogs/custom_dialog.dart';

class CircuitDialog extends StatelessWidget {
  const CircuitDialog({
    required this.title,
    required this.onConfirm,
    this.value,
    super.key,
  });

  final double? value;
  final String title;
  final ValueChanged<double?> onConfirm;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value?.toString());
    return CustomDialog(
      title: title,
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'^\d*\.?\d{0,2}'),
          ),
          NumericalRangeFormatter(min: 0, max: 999)
        ],
        textAlign: TextAlign.center,
        style: AppTextStyle.bold28,
        decoration: const InputDecoration(
          hintText: 'Circuit',
          suffixText: 'cm',
          counterText: '',
        ),
      ),
      onConfirm: () {
        final value = double.tryParse(controller.text);

        onConfirm(value);
      },
    );
  }
}
