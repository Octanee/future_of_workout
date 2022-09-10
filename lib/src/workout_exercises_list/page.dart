// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:future_of_workout/src/data/repositories/repositories.dart';
// import 'package:future_of_workout/src/workout_exercises_list/cubit/workout_exercises_list_cubit.dart';
// import 'package:future_of_workout/src/workout_exercises_list/view.dart';

// class WorkoutExercisesListPage extends StatelessWidget {
//   const WorkoutExercisesListPage({required this.workoutId, super.key});

//   static String name = 'workout-exercises-list';

//   final String workoutId;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<WorkoutExercisesListCubit>(
//       create: (context) => WorkoutExercisesListCubit(
//         workoutId: workoutId,
//         workoutRepository: context.read<FakeWorkoutRepository>(),
//         exerciseRepository: context.read<FakeExerciseRepository>(),
//       )..fetchList(),
//       child: const WorkoutExercisesListView(),
//     );
//   }
// }