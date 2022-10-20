import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_of_workout/src/shared/formatter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:workout_log_api/workout_log_api.dart';

class SeriesLogDialog extends StatefulWidget {
  const SeriesLogDialog({
    required this.weight,
    required this.reps,
    required this.intensity,
    required this.onConfirm,
    this.title = 'Complete Series',
    super.key,
  });

  final String weight;
  final String reps;
  final String title;
  final SeriesLogIntensity intensity;

  final void Function(int reps, double weight, SeriesLogIntensity intensity)
      onConfirm;

  @override
  State<SeriesLogDialog> createState() => _SeriesLogDialogState();
}

class _SeriesLogDialogState extends State<SeriesLogDialog> {
  late double _value;
  late TextEditingController weightController;
  late TextEditingController repsController;
  
  @override
  void initState() {
    _value = widget.intensity.index.toDouble();
    weightController = TextEditingController(
      text: widget.weight,
    );
    repsController = TextEditingController(
      text: widget.reps,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: widget.title,
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
          const SizedBox(height: 16),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(Icons.speed_rounded),
              ),
              Slider(
                label: SeriesLogIntensity.values[_value.round()].name,
                max: 5,
                divisions: 5,
                value: _value,
                onChanged: (value) => setState(
                  () => _value = value,
                ),
              ),
            ],
          )
        ],
      ),
      onConfirm: () {
        final weight = double.tryParse(weightController.text) ?? 0;
        final reps = int.tryParse(repsController.text) ?? 0;
        final intensity = SeriesLogIntensity.values[_value.toInt()];

        widget.onConfirm(reps, weight, intensity);
      },
    );
  }
}
