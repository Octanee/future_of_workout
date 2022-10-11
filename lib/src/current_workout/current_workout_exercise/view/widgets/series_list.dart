import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';

class SeriesList extends StatelessWidget {
  const SeriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
      builder: (context, state) {
        final list = state.workoutExerciseLog!.exerciseSeriesLogs;
        return Column(
          children: list.map<Widget>((series) {
            var todo = false;
            try {
              final firstTodo = list.firstWhere(
                (s) => s.isFinished == false,
              );
              todo = series == firstTodo;
            } catch (_) {}

            return SeriesItem(series: series, isNext: todo);
          }).toList(),
        );
      },
    );
  }
}
