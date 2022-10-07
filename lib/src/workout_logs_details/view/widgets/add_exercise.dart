import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/workout_logs_details/workout_logs_details.dart';

class AddExercise extends StatelessWidget {
  const AddExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return AddExerciseButton(
      onTap: () => context
          .read<WorkoutLogsDetailsBloc>()
          .add(const WorkoutLogsDetailsAddExercise()),
    );
  }
}
