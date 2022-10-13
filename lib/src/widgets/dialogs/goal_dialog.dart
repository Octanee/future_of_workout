import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class GoalDialog extends StatelessWidget {
  const GoalDialog({
    required this.onConfirm,
    required this.title,
    this.confirmButtonText = 'Add',
    this.value,
    super.key,
  });

  final String? value;
  final String title;
  final ValueChanged<double> onConfirm;
  final String confirmButtonText;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);
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
          hintText: 'Weight',
          suffixText: 'kg',
          counterText: '',
        ),
      ),
      confirmButtonText: confirmButtonText,
      onConfirm: () {
        final value = double.tryParse(controller.text) ?? 0;

        onConfirm(value);
      },
    );
  }
}
