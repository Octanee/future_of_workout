import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';

class CircuitPlaceList extends StatelessWidget {
  const CircuitPlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyCircuitDetailsBloc, BodyCircuitDetailsState>(
      buildWhen: (previous, current) => previous.data != current.data,
      builder: (context, state) {
        final list = state.data;
        return Column(
          children: list
              .map<Widget>(
                (e) => CircuitPlaceItem(
                  dateTime: e.key,
                  value: e.value,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
