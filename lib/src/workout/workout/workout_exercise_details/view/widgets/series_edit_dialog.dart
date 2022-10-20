import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/shared/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class SeriesEditDialog extends StatelessWidget {
  const SeriesEditDialog({
    required this.weight,
    required this.reps,
    required this.rest,
    required this.onConfirm,
    this.title = 'Change Series',
    super.key,
  });

  final String weight;
  final String reps;
  final String rest;
  final String title;

  final void Function(int reps, double weight, int rest) onConfirm;

  @override
  Widget build(BuildContext context) {
    final weightController = TextEditingController(text: weight);
    final repsController = TextEditingController(text: reps);
    final restController = TextEditingController(text: rest);

    return CustomDialog(
      title: title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getWeight(controller: weightController),
          _getReps(controller: repsController),
          _getRest(controller: restController)
        ],
      ),
      onConfirm: () {
        final weight = double.tryParse(weightController.text) ?? 0;
        final reps = int.tryParse(repsController.text) ?? 0;
        final rest = int.tryParse(restController.text) ?? 0;

        onConfirm(reps, weight, rest);
      },
    );
  }

  Widget _getRest({required TextEditingController controller}) {
    return Row(
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
              hintText: 'Rest time',
              suffixText: 's',
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }

  Widget _getReps({required TextEditingController controller}) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.repeat_rounded),
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
              hintText: 'Reps',
              suffixText: 'reps',
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }

  Widget _getWeight({required TextEditingController controller}) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(Icons.sports_bar_outlined),
        ),
        Flexible(
          child: TextField(
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
        ),
      ],
    );
  }
}
