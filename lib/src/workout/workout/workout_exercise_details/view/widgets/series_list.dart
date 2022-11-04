import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';

class SeriesList extends StatelessWidget {
  const SeriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
      buildWhen: (previous, current) =>
          previous.workoutExercise?.exerciseSeries !=
              current.workoutExercise?.exerciseSeries ||
          previous.isAdvanced != current.isAdvanced,
      builder: (context, state) {
        final list = state.workoutExercise!.exerciseSeries;

        if (list.isEmpty) {
          return Container();
        }

        // TODO(Animation): Animated list
        if (!state.isAdvanced) {
          return ExerciseSeriesItem(
            series: list.first,
            value: list.length,
            isMulti: true,
          );
        }

        return Column(
          children: list.map<Widget>((series) {
            return ExerciseSeriesItem(
              series: series,
              value: series.index,
            );
          }).toList(),
        );
      },
    );
  }
}
