import 'package:flutter/material.dart';
import 'package:future_of_workout/src/body/body/body.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/bold_text.dart';
import 'package:future_of_workout/src/widgets/cards/cards.dart';
import 'package:go_router/go_router.dart';

class CircuitChangeItem extends StatelessWidget {
  const CircuitChangeItem({required this.circuitChange, super.key});

  final CircuitChange circuitChange;

  @override
  Widget build(BuildContext context) {
    final difference = circuitChange.lastValue - circuitChange.firstValue;

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
                  _buildColumn(
                    title: 'First:',
                    value: '${circuitChange.firstValue}',
                  ),
                  _buildColumn(
                    isMiddle: true,
                    title: 'Last:',
                    value: '${circuitChange.lastValue}',
                  ),
                  _buildColumn(
                    title: 'Change',
                    value: '${difference > 0 ? '+' : ''}$difference',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildColumn({
    required String title,
    required String value,
    bool isMiddle = false,
  }) {
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
              boldText: value,
              mediumText: ' cm',
            ),
          ],
        ),
      ),
    );
  }
}
