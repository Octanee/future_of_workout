import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/buttons/buttons.dart';

class RemoveSeries extends StatelessWidget {
  const RemoveSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
      buildWhen: (previous, current) =>
          previous.workoutExerciseLog?.exerciseSeriesLogs !=
          current.workoutExerciseLog?.exerciseSeriesLogs,
      builder: (context, state) {
        final list = state.workoutExerciseLog!.exerciseSeriesLogs;
        return Visibility(
          visible: list.isNotEmpty && !list.last.isFinished,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RemoveButton(
              text: 'Remove series',
              onConfirm: () {
                context
                    .read<CurrentWorkoutExerciseBloc>()
                    .add(const CurrentWorkoutExerciseRemoveSeries());
              },
            ),
          ),
        );
      },
    );
  }
}
