import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:intl/intl.dart';

class CircuitPlaceItem extends StatelessWidget {
  const CircuitPlaceItem({
    required this.dateTime,
    required this.value,
    super.key,
  });

  final DateTime dateTime;
  final double value;

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('EEE, d MMM');
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                formatter.format(dateTime),
                style: AppTextStyle.semiBold20,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: BoldText(
                boldText: '$value',
                mediumText: 'cm',
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
