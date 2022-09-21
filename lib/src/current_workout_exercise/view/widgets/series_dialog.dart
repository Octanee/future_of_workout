import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class SeriesDialog extends StatelessWidget {
  const SeriesDialog({
    required this.weight,
    required this.reps,
    required this.onConfirm,
    this.title = 'Complete Series',
    super.key,
  });

  final String weight;
  final String reps;
  final String title;

  final void Function(int reps, double weight) onConfirm;

  @override
  Widget build(BuildContext context) {
    final weightController = TextEditingController(
      text: weight,
    );
    final repsController = TextEditingController(
      text: reps,
    );

    return CustomDialog(
      title: title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.sports_bar_outlined),
              ),
              Flexible(
                child: TextField(
                  controller: weightController,
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
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.repeat_rounded),
              ),
              Flexible(
                child: TextField(
                  controller: repsController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    NumericalRangeFormatter(min: 0, max: 999)
                  ],
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bold28,
                  decoration: const InputDecoration(
                    hintText: 'Reps',
                    suffixText: 'reps',
                    counterText: '',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      onConfirm: () {
        final weight = double.tryParse(weightController.text) ?? 0;
        final reps = int.tryParse(repsController.text) ?? 0;

        onConfirm(reps, weight);
      },
    );
  }
}
