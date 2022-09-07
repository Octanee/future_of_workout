import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/repositories.dart';
import '../../../logic/workout_details/workout_details.dart';
import 'view.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({required this.workoutId, Key? key})
      : super(key: key);

  static String name = 'workout-details';

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutDetailsBloc>(
      create: (context) {
        final repository = context.read<FakeWorkoutRepository>();

        return WorkoutDetailsBloc(workoutId: workoutId, repository: repository)
          ..add(WorkoutDetailsLoadWorkout(id: workoutId));
      },
      child: const WorkoutDetailsView(),
    );
  }
}
