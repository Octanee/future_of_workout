import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';

class AboutExercise extends StatelessWidget {
  const AboutExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
      buildWhen: (previous, current) =>
          previous.workoutExercise?.exercise !=
          current.workoutExercise?.exercise,
      builder: (context, state) {
        final id = state.workoutExercise!.exercise.id;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AboutExerciseButton(exerciseId: id),
        );
      },
    );
  }
}
