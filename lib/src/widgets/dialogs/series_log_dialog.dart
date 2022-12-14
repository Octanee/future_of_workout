import 'package:flutter/services.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:workout_log_api/workout_log_api.dart';

class SeriesLogDialog extends StatefulWidget {
  const SeriesLogDialog({
    required this.weight,
    required this.reps,
    required this.intensity,
    required this.onConfirm,
    required this.title,
    this.weightSuffix = 'kg',
    super.key,
  });

  final String weight;
  final String reps;
  final String title;
  final SeriesLogIntensity intensity;
  final String weightSuffix;

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
          _WeightRow(
            weightController: weightController,
            suffix: widget.weightSuffix,
          ),
          _RepsRow(repsController: repsController),
          const SizedBox(height: 16),
          _SliderRow(
            value: _value,
            onChanged: (value) => setState(() => _value = value),
          ),
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

class _SliderRow extends StatelessWidget {
  const _SliderRow({
    required this.value,
    required this.onChanged,
  });

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: AppIcon(iconData: AppIcons.intensity),
        ),
        Slider(
          label: context.locale.seriesLogIntensity(
            SeriesLogIntensity.values[value.round()].name,
          ),
          max: 5,
          divisions: 5,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _RepsRow extends StatelessWidget {
  const _RepsRow({required this.repsController});

  final TextEditingController repsController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: AppIcon(iconData: AppIcons.repeat),
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
            decoration: InputDecoration(
              hintText: context.locale.reps,
              suffixText: context.locale.reps,
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }
}

class _WeightRow extends StatelessWidget {
  const _WeightRow({required this.weightController, required this.suffix});

  final TextEditingController weightController;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: AppIcon(iconData: AppIcons.weight),
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
            decoration: InputDecoration(
              hintText: context.locale.weight,
              suffixText: suffix,
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }
}
