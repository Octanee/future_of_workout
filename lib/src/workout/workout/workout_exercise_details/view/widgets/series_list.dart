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

        if (!state.isAdvanced) {
          return SimpleExerciseSeriesItem(
            series: list.first,
            value: list.length,
          );
        }

        return Column(
          children: list.map<Widget>((series) {
            return AdvancedExerciseSeriesItem(
              series: series,
            );
          }).toList(),
        );
      },
    );
  }
}
