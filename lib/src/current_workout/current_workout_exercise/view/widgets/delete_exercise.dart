import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/buttons/buttons.dart';

class DeleteExercise extends StatelessWidget {
  const DeleteExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
      buildWhen: (previous, current) =>
          previous.workoutExerciseLog?.exerciseSeriesLogs !=
          current.workoutExerciseLog?.exerciseSeriesLogs,
      builder: (context, state) {
        return Visibility(
          visible:
              !state.workoutExerciseLog!.exerciseSeriesLogs.first.isFinished,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DeleteButton(
              text: 'Delete exercise',
              onConfirm: () {
                //TODO(Octane): Delete exercise
              },
            ),
          ),
        );
      },
    );
  }
}
