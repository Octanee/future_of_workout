import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:future_of_workout/src/data/repositories/repositories.dart';
import 'package:future_of_workout/src/workout_details/bloc/workout_details_bloc.dart';
import 'package:future_of_workout/src/workout_details/view.dart';
import 'package:future_of_workout/src/workouts/cubit/created_list_cubit.dart';


class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage(
      {required this.workoutId, required this.createdListCubit, super.key,});

  static String name = 'workout-details';

  final String workoutId;
  final CreatedListCubit createdListCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutDetailsBloc>(
      create: (context) {
        final repository = context.read<FakeWorkoutRepository>();

        return WorkoutDetailsBloc(
          workoutId: workoutId,
          repository: repository,
        )..add(WorkoutDetailsLoadWorkout(id: workoutId));
      },
      child: const WorkoutDetailsView(),
    );
  }
}
