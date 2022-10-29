import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/body/body/body.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/bold_text.dart';
import 'package:future_of_workout/src/widgets/cards/cards.dart';
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
                circuitChange.place.name,
                style: AppTextStyle.bold20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  _CircuitColumn(
                    unit: unit,
                    title: 'First:',
                    value: circuitChange.firstValue,
                  ),
                  _CircuitColumn(
                    unit: unit,
                    isMiddle: true,
                    title: 'Last:',
                    value: circuitChange.lastValue,
                  ),
                  _CircuitColumn(
                    unit: unit,
                    title: 'Change',
                    value: difference,
                    isChange: difference > 0,
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
    this.isChange = false,
  });

  final String title;
  final double value;
  final bool isMiddle;
  final bool isChange;
  final LengthUnit unit;

  @override
  Widget build(BuildContext context) {
    final plus = isChange ? '+' : '';
    final displayed =
        UnitConverter.dispalyedLength(unit: unit, value: value).toString();

    final text = plus + displayed;

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
