import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/data/repositories/repositories.dart';
import 'package:future_of_workout/src/logic/workout_exercise_details/workout_exercise_details.dart';
import 'package:future_of_workout/src/presentation/pages/workout_exercise_details/view.dart';

class WorkoutExerciseDetailsPage extends StatelessWidget {
  const WorkoutExerciseDetailsPage({
    required this.workoutId,
    required this.exerciseId,
    this.isNew = true,
    super.key,
  });

  static String name = 'workout-exercise-details';

  final bool isNew;
  final String workoutId;
  final String exerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutExerciseDetailsCubit(
        exerciseId: exerciseId,
        workoutId: workoutId,
        isNew: isNew,
        workoutRepository: context.read<FakeWorkoutRepository>(),
        exerciseRepository: context.read<FakeExerciseRepository>(),
      )..fetchWorkoutExercise(),
      child: const WorkoutExerciseDetailsView(),
    );
  }
}
