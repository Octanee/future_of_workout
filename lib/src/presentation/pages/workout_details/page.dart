import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:future_of_workout/src/data/repositories/repositories.dart';
import 'package:future_of_workout/src/logic/home/home.dart';
import 'package:future_of_workout/src/logic/workout_details/workout_details.dart';
import 'package:future_of_workout/src/presentation/pages/workout_details/view.dart';

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
          createdListCubit: createdListCubit,
        )..add(WorkoutDetailsLoadWorkout(id: workoutId));
      },
      child: const WorkoutDetailsView(),
    );
  }
}
