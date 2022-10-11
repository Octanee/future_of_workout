import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/buttons/add_button.dart';

class AddSeries extends StatelessWidget {
  const AddSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
      buildWhen: (previous, current) =>
          previous.workoutExerciseLog?.isFinished !=
          current.workoutExerciseLog?.isFinished,
      builder: (context, state) {
        return Visibility(
          visible: state.workoutExerciseLog?.isFinished ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AddButton(
              text: 'Add series',
              onTap: () {
                context
                    .read<CurrentWorkoutExerciseBloc>()
                    .add(const CurrentWorkoutExerciseAddSeries());
              },
            ),
          ),
        );
      },
    );
  }
}
