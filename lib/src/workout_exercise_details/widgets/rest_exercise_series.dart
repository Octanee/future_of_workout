import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class RestExerciseSeries extends StatelessWidget {
  const RestExerciseSeries({
    super.key,
    required this.rest,
    required this.onValueChanged,
  });

  final int rest;
  final ValueChanged<String> onValueChanged;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: rest.toString());

    final focusNode = FocusNode()
      ..addListener(() {
        onValueChanged(controller.text);
      });

    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: CustomCard(
        onTap: focusNode.requestFocus,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer_outlined),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'REST',
                style: AppTextStyle.semiBold20,
              ),
            ),
            Text(
              ':',
              style: AppTextStyle.bold20.copyWith(color: AppColors.yellow),
            ),
            SizedBox(
              width: 64,
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                keyboardType: TextInputType.number,
                onEditingComplete: focusNode.unfocus,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  NumericalRangeFormatter(min: 0, max: 999)
                ],
                textAlign: TextAlign.center,
                style: AppTextStyle.bold28,
                decoration: const InputDecoration(
                  suffixText: 's',
                  counterText: '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
