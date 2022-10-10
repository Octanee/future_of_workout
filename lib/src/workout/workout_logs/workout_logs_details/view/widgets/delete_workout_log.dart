import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/buttons/buttons.dart';
import 'package:future_of_workout/src/workout/workout.dart';

class DeleteWorkoutLog extends StatelessWidget {
  const DeleteWorkoutLog({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteButton(
      text: 'Delete workout',
      dialogText: 'Are you sure you want to delete workout?',
      onConfirm: () => context
          .read<WorkoutLogsDetailsBloc>()
          .add(const WorkoutLogsDetailsDelete()),
    );
  }
}
