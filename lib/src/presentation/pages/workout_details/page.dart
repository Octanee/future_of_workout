import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../logic/workout_details/workout_details.dart';
import 'view.dart';

class WorkoutDetailsPage extends StatelessWidget {
  const WorkoutDetailsPage({required this.workout, Key? key}) : super(key: key);

  static String name = 'workout-details';

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutDetailsBloc>(
      create: (context) {
        final repository = context.read<FakeWorkoutRepository>();

        return WorkoutDetailsBloc(workout: workout, repository: repository);
      },
      child: const WorkoutDetailsView(),
    );
  }
}
