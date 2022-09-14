import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';

class SeriesEditDialog extends StatelessWidget {
  const SeriesEditDialog({
    required this.weight,
    required this.reps,
    required this.onPositive,
    this.title = 'Change Series',
    super.key,
  });

  final String weight;
  final String reps;
  final String title;

  final void Function(int reps, double weight) onPositive;

  @override
  Widget build(BuildContext context) {
    final weightController = TextEditingController(
      text: weight,
    );
    final repsController = TextEditingController(
      text: reps,
    );

    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyle.semiBold20,
      ),
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
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final weight = double.tryParse(weightController.text) ?? 0;
            final reps = int.tryParse(repsController.text) ?? 0;

            onPositive(reps, weight);
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
