import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';

import 'package:future_of_workout/src/widgets/widgets.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyWeightBloc, BodyWeightState>(
      buildWhen: (previous, current) =>
          previous.period != current.period ||
          previous.weights != current.weights,
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
