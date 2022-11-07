import 'package:flutter/services.dart';
import 'package:future_of_workout/src/common.dart';

class CircuitDialog extends StatelessWidget {
  const CircuitDialog({
    required this.title,
    required this.onConfirm,
    this.value,
    this.suffix = 'cm',
    super.key,
  });

  final double? value;
  final String title;
  final ValueChanged<double?> onConfirm;
  final String suffix;

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
        decoration: InputDecoration(
          hintText: context.locale.circuit,
          suffixText: suffix,
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
