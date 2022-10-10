import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/buttons/buttons.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';

class RemoveSeries extends StatelessWidget {
  const RemoveSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
      buildWhen: (previous, current) =>
          previous.workoutExercise?.exerciseSeries !=
          current.workoutExercise?.exerciseSeries,
      builder: (context, state) {
        return Visibility(
          visible: state.workoutExercise?.exerciseSeries.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RemoveButton(
              text: 'Remove series',
              onConfirm: () => context
                  .read<WorkoutExerciseDetailsBloc>()
                  .add(const WorkoutExerciseDetailsRemovedSeries()),
            ),
          ),
        );
      },
    );
  }
}