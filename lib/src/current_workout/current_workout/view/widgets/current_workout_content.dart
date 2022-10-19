import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class CurrentWorkoutContent extends StatelessWidget {
  const CurrentWorkoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      buildWhen: (previous, current) =>
          previous.workoutLog?.workoutExerciseLogs !=
          current.workoutLog?.workoutExerciseLogs,
      builder: (context, state) {
        if (state.workoutLog!.workoutExerciseLogs.isEmpty) {
          return Column(
            children: const [
              AddExercise(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 200),
                child: AppEmptyList(
                  text: 'Add some exercises.',
                ),
              ),
            ],
          );
        }

        return Column(
          children: const [
            ExerciseLogsList(),
            AddExercise(),
          ],
        );
      },
    );
  }
}
