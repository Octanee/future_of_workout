import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';

import 'package:future_of_workout/src/widgets/widgets.dart';

class CircuitChart extends StatelessWidget {
  const CircuitChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyCircuitDetailsBloc, BodyCircuitDetailsState>(
      buildWhen: (previous, current) =>
          previous.period != current.period ||
          previous.measurements != current.measurements,
      builder: (context, state) {
        final data = _getData(data: state.data);
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CustomCard(
            child: ClipRRect(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 8,
                  top: 24,
                  bottom: 8,
                ),
                child: DayliChart(
                  suffix: 'cm',
                  period: state.period.days,
                  data: data,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<DayliData> _getData({required List<MapEntry<DateTime, double>> data}) {
    return data.map<DayliData>((entry) {
      return DayliData(value: entry.value, date: entry.key);
    }).toList();
  }
}
