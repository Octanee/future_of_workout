import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';

class CircuitChangeList extends StatelessWidget {
  const CircuitChangeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyCircuitBloc, BodyCircuitState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        return Column(
          children: state.data
              .map<Widget>(
                (circuitChange) => CircuitChangeItem(
                  circuitChange: circuitChange,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
