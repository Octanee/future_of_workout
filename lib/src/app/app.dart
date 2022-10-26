import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/app_router.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/styles/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:goal_repository/goal_repository.dart';
import 'package:measurement_repository/measurement_repository.dart';
import 'package:user_repository/user_repository.dart';
import 'package:workout_log_repository/workout_log_repository.dart';
import 'package:workout_repository/workout_repository.dart';

class FutureOfWorkoutApp extends StatelessWidget {
  const FutureOfWorkoutApp({
    super.key,
    required ExerciseRepository exerciseRepository,
    required WorkoutRepository workoutRepository,
    required WorkoutLogRepository workoutLogRepository,
    required GoalRepository goalRepository,
    required MeasurementRepository measurementRepository,
    required UserRepository userRepository,
  })  : _workoutRepository = workoutRepository,
        _exerciseRepository = exerciseRepository,
        _workoutLogRepository = workoutLogRepository,
        _goalRepository = goalRepository,
        _measurementRepository = measurementRepository,
        _userRepository = userRepository;

  final ExerciseRepository _exerciseRepository;
  final WorkoutRepository _workoutRepository;
  final WorkoutLogRepository _workoutLogRepository;
  final GoalRepository _goalRepository;
  final MeasurementRepository _measurementRepository;
  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _exerciseRepository),
        RepositoryProvider.value(value: _workoutRepository),
        RepositoryProvider.value(value: _workoutLogRepository),
        RepositoryProvider.value(value: _goalRepository),
        RepositoryProvider.value(value: _measurementRepository),
        RepositoryProvider.value(value: _userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(userRepository: _userRepository)
              ..add(const AppLoading()),
          ),
          BlocProvider(
            create: (context) => CurrentWorkoutBloc(
              workoutRepository: _workoutRepository,
              workoutLogRepository: _workoutLogRepository,
            ),
          ),
          BlocProvider(
            create: (context) =>
                NavigationCubit(item: HomeNavigationItem.workouts),
          ),
        ],
        child: const FutureOfWorkoutAppView(),
      ),
    );
  }
}

class FutureOfWorkoutAppView extends StatelessWidget {
  const FutureOfWorkoutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter(bloc: context.read<AppBloc>()).router;

    return MaterialApp.router(
      title: 'Future Of Workout',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
