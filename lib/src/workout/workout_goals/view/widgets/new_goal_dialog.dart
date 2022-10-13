import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class NewGoalDialog extends StatelessWidget {
  const NewGoalDialog({required this.onConfirm, super.key});

  final ValueChanged<double> onConfirm;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return CustomDialog(
      title: 'New Goal',
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
      confirmButtonText: 'Add',
      onConfirm: () {
        final value = double.tryParse(controller.text) ?? 0;

        onConfirm(value);
      },
    );
  }
}
