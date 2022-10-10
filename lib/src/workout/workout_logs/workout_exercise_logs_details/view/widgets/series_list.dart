import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/workout/workout.dart';
import 'package:workout_log_api/workout_log_api.dart';

class SeriesList extends StatelessWidget {
  const SeriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseLogsDetailsBloc,
        WorkoutExerciseLogsDetailsState>(
      buildWhen: (previous, current) =>
          previous.exerciseLog!.exerciseSeriesLogs !=
          current.exerciseLog!.exerciseSeriesLogs,
      builder: (context, state) {
        final logs = state.exerciseLog!.exerciseSeriesLogs;
        ExerciseSeriesLog? previousSeries;
        return Column(
          children: logs.map<Widget>((series) {
            final item = SeriesItem(
              series: series,
              isClickable: previousSeries?.isFinished ?? true,
            );

            previousSeries = series;

            return item;
          }).toList(),
        );
      },
    );
  }
}
