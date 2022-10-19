import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';

class CircuitItem extends StatelessWidget {
  const CircuitItem({required this.place, this.value, super.key});

  final MeasurementPlace place;
  final double? value;

  @override
  Widget build(BuildContext context) {
    final valueText = value != null ? value!.toString() : '?';
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        padding: const EdgeInsets.all(16),
        onTap: () async {
          final bloc = context.read<BodyCircuitAddBloc>();

          await showDialog<void>(
            context: context,
            builder: (context) {
              return CircuitDialog(
                value: value,
                title: place.name,
                onConfirm: (value) {
                  bloc.add(
                    BodyCircuitAddMeasurementPlaceChange(
                      place: place,
                      value: value,
                    ),
                  );
                },
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              place.name,
              style: AppTextStyle.semiBold20,
            ),
            BoldText(
              boldText: valueText,
              mediumText: ' cm',
            )
          ],
        ),
      ),
    );
  }
}
