import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';

import '../../../logic/repositories/repositories.dart';
import '../../../logic/state_management/state_management.dart';
import 'view.dart';

class WorkoutExercisesListPage extends StatelessWidget {
  const WorkoutExercisesListPage({required this.workoutId, super.key});

  static String name = 'workout-exercises-list';

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutExercisesListCubit>(
      create: (context) => WorkoutExercisesListCubit(
        workoutId: workoutId,
        workoutRepository: context.read<FakeWorkoutRepository>(),
        exerciseRepository: context.read<FakeExerciseRepository>(),
      )..fetchList(),
      child: const WorkoutExercisesListView(),
    );
  }
}
