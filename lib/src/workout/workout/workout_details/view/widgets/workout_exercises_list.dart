import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';

class WorkoutExercisesList extends StatelessWidget {
  const WorkoutExercisesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      buildWhen: (previous, current) =>
          previous.workout?.workoutExercises !=
          current.workout?.workoutExercises,
      builder: (context, state) {
        final list = state.workout!.workoutExercises;

        return Column(
          children: list
              .map<Widget>(
                (item) => WorkoutExerciseItem(
                  workoutExercise: item,
                  onTap: () => context.goNamed(
                    WorkoutExerciseDetailsPage.name,
                    params: {
                      'homePageTab': WorkoutsPage.name,
                      'workoutId': state.workout!.id,
                      'workoutExerciseId': item.id,
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
