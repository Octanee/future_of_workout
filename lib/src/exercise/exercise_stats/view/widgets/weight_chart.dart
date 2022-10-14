import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class WeightChart extends StatelessWidget {
  const WeightChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) =>
          previous.workoutExerciseLogs != current.workoutExerciseLogs,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AspectRatio(
            aspectRatio: 1.5,
            child: CustomCard(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 8,
                  top: 24,
                  bottom: 8,
                ),
                child: DayliChart(
                  data: state.workoutExerciseLogs.map<DayliData>((entry) {
                    final finished = entry.key.exerciseSeriesLogs
                        .where((series) => series.isFinished);

                    final maxValue = finished.map((e) => e.weight).reduce(max);

                    return DayliData(value: maxValue, date: entry.value);
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
