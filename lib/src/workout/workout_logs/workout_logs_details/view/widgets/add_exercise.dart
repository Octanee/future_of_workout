import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/workout/workout.dart';
import 'package:go_router/go_router.dart';

class AddExercise extends StatelessWidget {
  const AddExercise({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutLogId = context
        .select((WorkoutLogsDetailsBloc bloc) => bloc)
        .state
        .workoutLog!
        .id;
    return AddExerciseButton(
      onTap: () => context.goNamed(
        WorkoutLogsExercisesListPage.name,
        params: {
          'homePageTab': WorkoutsPage.name,
          'workoutLogId': workoutLogId,
        },
      ),
    );
  }
}