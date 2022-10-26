import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/body/body_weight/body_weight.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';

import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyWeightBloc, BodyWeightState>(
      buildWhen: (previous, current) =>
          previous.period != current.period ||
          previous.measurements != current.measurements,
      builder: (context, state) {
        final unit = context.read<AppBloc>().state.user!.weightUnit;

        final data = _getData(data: state.data, unit: unit);
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
                  suffix: unit.sufix,
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

  List<DayliData> _getData({
    required List<MapEntry<DateTime, double>> data,
    required WeightUnit unit,
  }) {
    return data.map<DayliData>((entry) {
      final value = UnitConverter.dispalyedWeight(
        unit: unit,
        value: entry.value,
      );

      return DayliData(value: value, date: entry.key);
    }).toList();
  }
}
