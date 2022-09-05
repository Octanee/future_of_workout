import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../../../logic/workout_exercises_list/workout_exercises_list.dart';
import 'view.dart';

class WorkoutExercisesListPage extends StatelessWidget {
  const WorkoutExercisesListPage({required this.workout, super.key});

  static String name = 'workout-exercises-list';

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutExercisesListCubit>(
      create: (context) => WorkoutExercisesListCubit(
        workout: workout,
        workoutRepository: context.read<FakeWorkoutRepository>(),
        exerciseRepository: context.read<ExerciseRepository>(),
      ),
      child: const WorkoutExercisesListView(),
    );
  }
}
