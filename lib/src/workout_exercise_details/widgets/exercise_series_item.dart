import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class ExerciseSeriesItem extends StatelessWidget {
  const ExerciseSeriesItem({
    super.key,
    required this.index,
    required this.reps,
    required this.weight,
    required this.onWeightChanged,
    required this.onRepsChanged,
  });

  final int index;
  final int reps;
  final double weight;
  final ValueChanged<double> onWeightChanged;
  final ValueChanged<int> onRepsChanged;

  @override
  Widget build(BuildContext context) {
    final weightController = TextEditingController(text: weight.toString());
    final repsController = TextEditingController(text: reps.toString());

    final weightFocusNode = FocusNode()
      ..addListener(() {
        final value = double.tryParse(weightController.text);
        if (value != null) onWeightChanged(value);
      });

    final repsFocusNode = FocusNode()
      ..addListener(() {
        final value = int.tryParse(repsController.text);
        if (value != null) onRepsChanged(value);
      });

    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: CustomCard(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(64),
                color: AppColors.yellow,
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: AppTextStyle.bold28,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 108,
                    child: TextField(
                      focusNode: weightFocusNode,
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,2}'),
                        ),
                        NumericalRangeFormatter(min: 0, max: 999)
                      ],
                      textAlign: TextAlign.end,
                      onEditingComplete: weightFocusNode.unfocus,
                      style: AppTextStyle.bold28,
                      decoration: const InputDecoration(
                        suffixText: 'kg',
                        counterText: '',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '/',
                      style:
                          AppTextStyle.bold28.copyWith(color: AppColors.yellow),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: TextField(
                      focusNode: repsFocusNode,
                      controller: repsController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        NumericalRangeFormatter(max: 999, min: 1)
                      ],
                      textAlign: TextAlign.end,
                      onEditingComplete: repsFocusNode.unfocus,
                      style: AppTextStyle.bold28,
                      decoration: const InputDecoration(
                        suffixText: 'Reps',
                        counterText: '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
