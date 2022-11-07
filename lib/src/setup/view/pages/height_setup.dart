import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/setup/setup.dart';
import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:user_repository/user_repository.dart';

class HeightSetup extends StatelessWidget {
  const HeightSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return SetupContent(
      title: context.locale.setupHeightTitle,
      description: context.locale.setupHeightDescription,
      children: [
        const _LengthUnitBar(),
        BlocBuilder<SetupBloc, SetupState>(
          buildWhen: (previous, current) =>
              previous.user.lengthUnit != current.user.lengthUnit,
          builder: (context, state) {
            switch (state.user.lengthUnit) {
              case LengthUnit.centimeter:
                return _HeightCentimeterPicker(height: state.user.height);
              case LengthUnit.inch:
                return _HeightInchPicker(height: state.user.height);
            }
          },
        ),
      ],
    );
  }
}

class _LengthUnitBar extends StatelessWidget {
  const _LengthUnitBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetupBloc, SetupState>(
      buildWhen: (previous, current) =>
          previous.user.lengthUnit != current.user.lengthUnit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ToggleBar(
            initialIndex:
                state.user.lengthUnit == LengthUnit.centimeter ? 0 : 1,
            onChange: (value) {
              final unit = LengthUnit.values[value];
              if (unit != state.user.lengthUnit) {
                context.read<SetupBloc>().add(
                      SetupLengthUnitChange(
                        lengthUnit: unit,
                      ),
                    );
              }
            },
            tabs: [
              Tab(
                child: Text(
                  context.locale.lengthUnitType(LengthUnit.centimeter.name),
                ),
              ),
              Tab(
                child: Text(
                  context.locale.lengthUnitType(LengthUnit.inch.name),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _HeightCentimeterPicker extends StatefulWidget {
  const _HeightCentimeterPicker({required this.height});

  final double height;

  @override
  State<_HeightCentimeterPicker> createState() =>
      _HeightCentimeterPickerState();
}

class _HeightCentimeterPickerState extends State<_HeightCentimeterPicker> {
  late double _value;

  final minValue = 100;
  final maxValue = 255;

  @override
  void initState() {
    _value = widget.height;
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
          context.read<SetupBloc>().add(SetupHeightChange(height: value));
        }),
      ),
    );
  }
}

class _HeightInchPicker extends StatefulWidget {
  const _HeightInchPicker({required this.height});

  final double height;

  @override
  State<_HeightInchPicker> createState() => _HeightInchPickerState();
}

class _HeightInchPickerState extends State<_HeightInchPicker> {
  late double _value;

  final minValue = 40;
  final maxValue = 100;

  @override
  void initState() {
    _value = widget.height;
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
          context.read<SetupBloc>().add(SetupHeightChange(height: value));
        }),
      ),
    );
  }
}
