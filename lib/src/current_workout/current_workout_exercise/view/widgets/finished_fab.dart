import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class FinishedFab extends StatelessWidget {
  const FinishedFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
      buildWhen: (previous, current) =>
          previous.workoutExerciseLog?.isFinished !=
          current.workoutExerciseLog?.isFinished,
      builder: (context, state) {
        return Visibility(
          visible: state.workoutExerciseLog?.isFinished ?? false,
          child: FloatingActionButton(
            onPressed: () {
              context.pop();
            },
            child: const AppIcon(iconData: AppIcons.right),
          ),
        );
      },
    );
  }
}
