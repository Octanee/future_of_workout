import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/buttons/buttons.dart';
import 'package:future_of_workout/src/workout/workout/workout_exercise_details/workout_exercise_details.dart';

class DeleteExercise extends StatelessWidget {
  const DeleteExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
      buildWhen: (previous, current) =>
          previous.workoutExercise?.exercise !=
          current.workoutExercise?.exercise,
      builder: (context, state) {
        final exercise = state.workoutExercise!.exercise;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: DeleteButton(
            dialogText: 'Are you sure you want to delete ${exercise.name}',
            onConfirm: () => context
                .read<WorkoutExerciseDetailsBloc>()
                .add(const WorkoutExerciseDetailsDeleteWorkoutExercise()),
          ),
        );
      },
    );
  }
}
