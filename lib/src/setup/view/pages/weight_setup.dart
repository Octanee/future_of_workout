import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/setup/setup.dart';
import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:user_repository/user_repository.dart';

class WeightSetup extends StatelessWidget {
  const WeightSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return SetupContent(
      title: context.locale.setupWeightTitle,
      description: context.locale.setupWeightDescription,
      children: [
        const _WeightUnitBar(),
        BlocBuilder<SetupBloc, SetupState>(
          buildWhen: (previous, current) =>
              previous.user.weightUnit != current.user.weightUnit,
          builder: (context, state) {
            switch (state.user.weightUnit) {
              case WeightUnit.kilogram:
                return _WeightKilogramPicker(weight: state.user.weight);
              case WeightUnit.pounds:
                return _WeightPoundsPicker(weight: state.user.weight);
            }
          },
        ),
      ],
    );
  }
}

class _WeightUnitBar extends StatelessWidget {
  const _WeightUnitBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupBloc, SetupState>(
      buildWhen: (previous, current) =>
          previous.user.weightUnit != current.user.weightUnit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ToggleBar(
            initialIndex: state.user.weightUnit == WeightUnit.kilogram ? 0 : 1,
            onChange: (value) {
              final unit = WeightUnit.values[value];
              if (unit != state.user.weightUnit) {
                context.read<SetupBloc>().add(
                      SetupWeightUnitChange(
                        weightUnit: unit,
                      ),
                    );
              }
            },
            tabs: [
              Tab(
                child: Text(
                  context.locale.weightUnitType(WeightUnit.kilogram.name),
                ),
              ),
              Tab(
                child: Text(
                  context.locale.weightUnitType(WeightUnit.pounds.name),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WeightKilogramPicker extends StatefulWidget {
  const _WeightKilogramPicker({required this.weight});

  final double weight;

  @override
  State<_WeightKilogramPicker> createState() => __WeightKilogramPickerState();
}

class __WeightKilogramPickerState extends State<_WeightKilogramPicker> {
  late double _value;

  final minValue = 25;
  final maxValue = 255;

  @override
  void initState() {
    _value = widget.weight.clamp(minValue, maxValue).toDouble();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const itemHeight = 64.0;
    const itemWidth = 128.0;

    return Center(
      child: DecimalNumberPicker(
        decimalDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.yellow, width: 2),
            bottom: BorderSide(color: AppColors.yellow, width: 2),
          ),
        ),
        integerDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.yellow, width: 2),
            bottom: BorderSide(color: AppColors.yellow, width: 2),
          ),
        ),
        itemHeight: itemHeight,
        itemWidth: itemWidth,
        itemCount: 7,
        textStyle: AppTextStyle.semiBold20,
        selectedTextStyle:
            AppTextStyle.bold48.copyWith(color: AppColors.yellow),
        minValue: minValue,
        maxValue: maxValue,
        value: _value,
        onChanged: (value) => setState(() {
          _value = value;
          context.read<SetupBloc>().add(SetupWeightChange(weight: value));
        }),
      ),
    );
  }
}

class _WeightPoundsPicker extends StatefulWidget {
  const _WeightPoundsPicker({required this.weight});

  final double weight;

  @override
  State<_WeightPoundsPicker> createState() => __WeightPoundsPickerState();
}

class __WeightPoundsPickerState extends State<_WeightPoundsPicker> {
  late double _value;

  final minValue = 55;
  final maxValue = 562;

  @override
  void initState() {
    _value = double.parse(
      widget.weight.clamp(minValue, maxValue).toStringAsFixed(1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const itemHeight = 64.0;
    const itemWidth = 128.0;

    return Center(
      child: DecimalNumberPicker(
        decimalDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.yellow, width: 2),
            bottom: BorderSide(color: AppColors.yellow, width: 2),
          ),
        ),
        integerDecoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.yellow, width: 2),
            bottom: BorderSide(color: AppColors.yellow, width: 2),
          ),
        ),
        itemHeight: itemHeight,
        itemWidth: itemWidth,
        itemCount: 7,
        textStyle: AppTextStyle.semiBold20,
        selectedTextStyle:
            AppTextStyle.bold48.copyWith(color: AppColors.yellow),
        minValue: minValue,
        maxValue: maxValue,
        value: _value,
        onChanged: (value) => setState(() {
          _value = value;
          context.read<SetupBloc>().add(SetupWeightChange(weight: value));
        }),
      ),
    );
  }
}
