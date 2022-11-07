import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/body/body/body.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:go_router/go_router.dart';
import 'package:user_repository/user_repository.dart';

class CircuitChangeItem extends StatelessWidget {
  const CircuitChangeItem({required this.circuitChange, super.key});

  final CircuitChange circuitChange;

  @override
  Widget build(BuildContext context) {
    final difference = circuitChange.lastValue - circuitChange.firstValue;
    final unit = context.read<AppBloc>().state.user!.lengthUnit;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        onTap: () {
          context.goNamed(
            BodyCircuitDetailsPage.name,
            params: {
              'homePageTab': BodyPage.name,
              'measurementPlace': circuitChange.place.name,
            },
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                context.locale.measurementPlace(circuitChange.place.name),
                style: AppTextStyle.bold20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  _CircuitColumn(
                    unit: unit,
                    title: '${context.locale.first}:',
                    value: circuitChange.firstValue,
                  ),
                  _CircuitColumn(
                    unit: unit,
                    isMiddle: true,
                    title: '${context.locale.last}:',
                    value: circuitChange.lastValue,
                  ),
                  _CircuitColumn(
                    unit: unit,
                    title: '${context.locale.change}:',
                    value: difference,
                    addPlus: difference > 0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CircuitColumn extends StatelessWidget {
  const _CircuitColumn({
    required this.title,
    required this.value,
    required this.unit,
    this.isMiddle = false,
    this.addPlus = false,
  });

  final String title;
  final double value;
  final bool isMiddle;
  final bool addPlus;
  final LengthUnit unit;

  @override
  Widget build(BuildContext context) {
    final prefix = addPlus ? '+' : '';
    final displayed =
        UnitConverter.dispalyedLength(unit: unit, value: value).toString();

    final text = prefix + displayed;

    return Flexible(
      fit: FlexFit.tight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: isMiddle
              ? const Border(
                  left: BorderSide(color: AppColors.grey),
                  right: BorderSide(color: AppColors.grey),
                )
              : null,
        ),
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyle.regular16,
            ),
            BoldText(
              boldText: text,
              mediumText: unit.sufix,
            ),
          ],
        ),
      ),
    );
  }
}
