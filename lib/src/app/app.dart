import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/app_router.dart';
import 'package:future_of_workout/src/data/repositories/repositories.dart';
import 'package:future_of_workout/src/styles/app_theme.dart';

import 'package:workout_repository/workout_repository.dart';

class FutureOfWorkoutApp extends StatelessWidget {
  const FutureOfWorkoutApp({
    super.key,
    required ExerciseRepository exerciseRepository,
    required WorkoutRepository workoutRepository,
  })  : _workoutRepository = workoutRepository,
        _exerciseRepository = exerciseRepository;

  final ExerciseRepository _exerciseRepository;
  final WorkoutRepository _workoutRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _exerciseRepository),
        RepositoryProvider.value(value: _workoutRepository),
        RepositoryProvider(create: (context) => FakeExerciseRepository()),
        RepositoryProvider(create: (context) => FakeWorkoutRepository()),
      ],
      child: const FutureOfWorkoutAppView(),
    );
  }
}

class FutureOfWorkoutAppView extends StatelessWidget {
  const FutureOfWorkoutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Future Of Workout',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
