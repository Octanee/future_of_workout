import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/setup/setup.dart';
import 'package:future_of_workout/src/setup/view/widgets/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeSetup extends StatefulWidget {
  const AgeSetup({super.key});

  @override
  State<AgeSetup> createState() => _AgeSetupState();
}

class _AgeSetupState extends State<AgeSetup> {
  int? _value;

  @override
  Widget build(BuildContext context) {
    _value ??= context.read<SetupBloc>().state.user.age;

    const itemHeight = 64.0;
    const itemWidth = 128.0;

    return SetupContent(
      title: context.locale.setupAgeTitle,
      description: context.locale.setupAgeDescription,
      children: [
        Center(
          child: NumberPicker(
            decoration: const BoxDecoration(
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
            minValue: 1,
            maxValue: 123,
            value: _value!,
            onChanged: (value) => setState(() {
              _value = value;
              context.read<SetupBloc>().add(SetupAgeChange(age: value));
            }),
          ),
        ),
      ],
    );
  }
}
