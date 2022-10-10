import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';

class DeleteExercise extends StatelessWidget {
  const DeleteExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DeleteButton(
        text: 'Delete exercise',
        dialogText: 'Are you sure you want to delete exercise?',
        onConfirm: () => context.read<WorkoutExerciseLogsDetailsBloc>().add(
              const WorkoutExerciseLogsDetailsDelete(),
            ),
      ),
    );
  }
}
