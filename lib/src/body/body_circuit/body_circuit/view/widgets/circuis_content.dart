import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class CircuitsContent extends StatelessWidget {
  const CircuitsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyCircuitBloc, BodyCircuitState>(
      buildWhen: (previous, current) =>
          previous.measurements != current.measurements ||
          previous.period != current.period,
      builder: (context, state) {
        if (state.data.isEmpty) {
          return const AppEmptyList(
            text: 'Circuit measurement has not yet been added.',
          );
        }

        return ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: const [
            DataPeriod(),
            CircuitChangeList(),
          ],
        );
      },
    );
  }
}
