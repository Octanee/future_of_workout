import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/workout/workout.dart';

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
        return Column(
          // TODO(Octane): OnTap only when previous series isFinished
          children:
              logs.map<Widget>((series) => SeriesItem(series: series)).toList(),
        );
      },
    );
  }
}
