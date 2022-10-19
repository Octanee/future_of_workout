import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ExerciseLogsList extends StatelessWidget {
  const ExerciseLogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      buildWhen: (previous, current) =>
          previous.workoutLog?.workoutExerciseLogs !=
          current.workoutLog?.workoutExerciseLogs,
      builder: (context, state) {
        return Column(
          children: state.workoutLog!.workoutExerciseLogs
              .map<Widget>(
                (workoutExerciseLog) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: WorkoutExerciseLogItem(
                    workoutExerciseLog: workoutExerciseLog,
                    onTap: () {
                      context.goNamed(
                        CurrentWorkoutExercisePage.name,
                        params: {
                          'homePageTab': CurrentWorkoutPage.name,
                          'currentWorkoutExerciseId': workoutExerciseLog.id
                        },
                      );
                    },
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
