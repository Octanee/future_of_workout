import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:local_storage_measurement_api/local_storage_measurement_api.dart';

class CircuitsList extends StatelessWidget {
  const CircuitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyCircuitAddBloc, BodyCircuitAddState>(
      buildWhen: (previous, current) =>
          previous.measurement != current.measurement,
      builder: (context, state) {
        final measurement = state.measurement!;
        return Column(
          children: MeasurementPlace.values
              .map<Widget>(
                (place) => CircuitItem(
                  place: place,
                  value: measurement.circuit(place: place),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
