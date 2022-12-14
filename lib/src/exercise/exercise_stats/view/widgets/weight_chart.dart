import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';

import 'package:future_of_workout/src/shared/one_rep_max_calculator.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:user_repository/user_repository.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) =>
          previous.data != current.data ||
          previous.chartType != current.chartType,
      builder: (context, state) {
        final unit = context.read<AppBloc>().state.user!.weightUnit;
        final data = _getData(
          data: state.data,
          chartType: state.chartType,
          unit: unit,
        );

        final goal = state.chartType == ChartType.weight && state.goal != null
            ? UnitConverter.dispalyedWeight(unit: unit, value: state.goal!.goal)
            : null;

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
                  goal: goal,
                  isCurved: false,
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
    required List<MapEntry<WorkoutExerciseLog, DateTime>> data,
    required ChartType chartType,
    required WeightUnit unit,
  }) {
    return data.map<DayliData>((entry) {
      final finished =
          entry.key.exerciseSeriesLogs.where((series) => series.isFinished);

      final double value;

      switch (chartType) {
        case ChartType.weight:
          value = finished.map((series) => series.weight).reduce(max);
          break;
        case ChartType.volume:
          value = finished.fold(
            0,
            (previousValue, series) =>
                previousValue + (series.weight * series.reps),
          );
          break;
        case ChartType.oneRepMax:
          value = finished
              .map(
                (series) => OneRepMaxCalculator.calculate(
                  reps: series.reps,
                  weight: series.weight,
                  intensity: series.intensity,
                ),
              )
              .reduce(max);
          break;
      }

      return DayliData(
        value: UnitConverter.dispalyedWeight(unit: unit, value: value),
        date: entry.value,
      );
    }).toList();
  }
}
