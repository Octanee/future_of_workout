import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class RestEditDialog extends StatelessWidget {
  const RestEditDialog({
    required this.rest,
    required this.onPositive,
    this.title = 'Change REST time',
    super.key,
  });

  final String rest;
  final String title;

  final ValueChanged<int> onPositive;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: rest,
    );

    return CustomDialog(
      title: title,
      content: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.timer_outlined),
          ),
          Flexible(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NumericalRangeFormatter(min: 0, max: 999)
              ],
              textAlign: TextAlign.center,
              style: AppTextStyle.bold28,
              decoration: const InputDecoration(
                hintText: 'Rest time  ',
                suffixText: 's',
                counterText: '',
              ),
            ),
          ),
        ],
      ),
      onConfirm: () {
        final value = int.tryParse(controller.text) ?? 0;
        onPositive(value);
      },
    );
  }
}
