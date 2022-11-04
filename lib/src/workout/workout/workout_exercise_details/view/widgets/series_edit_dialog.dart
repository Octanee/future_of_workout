import 'package:flutter/services.dart';
import 'package:future_of_workout/src/common.dart';

class SeriesEditDialog extends StatelessWidget {
  const SeriesEditDialog({
    required this.weight,
    required this.reps,
    required this.rest,
    required this.onConfirm,
    required this.title,
    this.weightSuffix = 'kg',
    super.key,
  });

  final String weight;
  final String reps;
  final String rest;
  final String title;
  final String weightSuffix;

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
          _WeightRow(controller: weightController, suffix: weightSuffix),
          _RepsRow(controller: repsController),
          _RestRow(controller: restController)
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
}

class _WeightRow extends StatelessWidget {
  const _WeightRow({required this.controller, required this.suffix});

  final TextEditingController controller;
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
              hintText: context.local.weight,
              suffixText: suffix,
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }
}

class _RepsRow extends StatelessWidget {
  const _RepsRow({required this.controller});

  final TextEditingController controller;

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
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              NumericalRangeFormatter(min: 0, max: 999)
            ],
            textAlign: TextAlign.center,
            style: AppTextStyle.bold28,
            decoration: InputDecoration(
              hintText: context.local.reps,
              suffixText: context.local.reps,
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }
}

class _RestRow extends StatelessWidget {
  const _RestRow({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 16),
          child: AppIcon(iconData: AppIcons.stopwatch),
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
            decoration: InputDecoration(
              hintText: context.local.restTime,
              suffixText: 's',
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }
}
