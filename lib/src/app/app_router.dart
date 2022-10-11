import 'package:flutter/cupertino.dart';
import 'package:future_of_workout/src/app/app_transitions.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/${WorkoutsPage.name}',
    routes: [
      _homeRoute,
      _exerciseDetailsRoute,
      _exerciseListRoute,
    ],
  );

  static final GoRoute _exerciseDetailsRoute = GoRoute(
    name: ExerciseDetailsPage.name,
    path: ExerciseDetailsPage.path,
    pageBuilder: (context, state) {
      final exerciseId = state.params['exerciseId']!;
      return _buildTransition(
        key: state.pageKey,
        child: ExerciseDetailsPage(exerciseId: exerciseId),
      );
    },
  );

  static final GoRoute _exerciseListRoute = GoRoute(
    name: ExerciseListPage.name,
    path: ExerciseListPage.path,
    pageBuilder: (context, state) {
      final extra = state.extra! as ExerciseListExtra;
      return _buildTransition(
        key: state.pageKey,
        child: ExerciseListPage(extra: extra),
      );
    },
  );

  static final GoRoute _homeRoute = GoRoute(
    name: HomePage.name,
    path: HomePage.path,
    builder: (context, state) {
      final name = state.params['homePageTab'];
      final item = HomeNavigationItem.values
          .firstWhere((element) => element.name == name);
      return HomePage(item: item);
    },
    routes: [
      _workoutDetailsRoute,
      _workoutLogDetailsRoute,
      _currentWorkoutExerciseRoute,
      _currentWorkoutSummaryRoute,
    ],
  );

  static final GoRoute _workoutDetailsRoute = GoRoute(
    name: WorkoutDetailsPage.name,
    path: WorkoutDetailsPage.path,
    pageBuilder: (context, state) {
      final workoutId = state.params['workoutId']!;
      return _buildTransition(
        key: state.pageKey,
        child: WorkoutDetailsPage(workoutId: workoutId),
      );
    },
    routes: [
      _workoutExercisesListRoute,
      _workoutExerciseDetailsRoute,
    ],
  );

  static final GoRoute _workoutExercisesListRoute = GoRoute(
    name: WorkoutExercisesListPage.name,
    path: WorkoutExercisesListPage.path,
    pageBuilder: (context, state) {
      final workoutId = state.params['workoutId']!;
      return _buildTransition(
        key: state.pageKey,
        child: WorkoutExercisesListPage(workoutId: workoutId),
      );
    },
  );

  static final GoRoute _workoutExerciseDetailsRoute = GoRoute(
    name: WorkoutExerciseDetailsPage.name,
    path: WorkoutExerciseDetailsPage.path,
    pageBuilder: (context, state) {
      final workoutId = state.params['workoutId']!;
      final workoutExerciseId = state.params['workoutExerciseId']!;
      return _buildTransition(
        key: state.pageKey,
        child: WorkoutExerciseDetailsPage(
          workoutId: workoutId,
          workoutExerciseId: workoutExerciseId,
        ),
      );
    },
  );

  static final GoRoute _currentWorkoutExerciseRoute = GoRoute(
    name: CurrentWorkoutExercisePage.name,
    path: CurrentWorkoutExercisePage.path,
    pageBuilder: (context, state) {
      final currentWorkoutExerciseId =
          state.params['currentWorkoutExerciseId']!;
      return _buildTransition(
        key: state.pageKey,
        child: CurrentWorkoutExercisePage(
          currentWorkoutExerciseId: currentWorkoutExerciseId,
        ),
      );
    },
    routes: [
      _currentWorkoutRestRoute,
    ],
  );

  static final GoRoute _currentWorkoutRestRoute = GoRoute(
    name: CurrentWorkoutRestPage.name,
    path: CurrentWorkoutRestPage.path,
    pageBuilder: (context, state) {
      final time = int.tryParse(state.params['time']!) ?? 120;
      return _buildTransition(
        key: state.pageKey,
        child: CurrentWorkoutRestPage(
          duration: time,
        ),
      );
    },
  );

  static final GoRoute _currentWorkoutSummaryRoute = GoRoute(
    name: CurrentWorkoutSummaryPage.name,
    path: CurrentWorkoutSummaryPage.path,
    pageBuilder: (context, state) {
      return _buildTransition(
        key: state.pageKey,
        child: const CurrentWorkoutSummaryPage(),
      );
    },
  );

  static final GoRoute _workoutLogDetailsRoute = GoRoute(
    name: WorkoutLogsDetailsPage.name,
    path: WorkoutLogsDetailsPage.path,
    pageBuilder: (context, state) {
      final id = state.params['workoutLogId']!;
      return _buildTransition(
        key: state.pageKey,
        child: WorkoutLogsDetailsPage(workoutLogId: id),
      );
    },
    routes: [
      _workoutExerciseLogDetailsRoute,
      _workoutLogExerciseListRoute,
    ],
  );

  static final GoRoute _workoutExerciseLogDetailsRoute = GoRoute(
    name: WorkoutExerciseLogsDetailsPage.name,
    path: WorkoutExerciseLogsDetailsPage.path,
    pageBuilder: (context, state) {
      final workoutLogId = state.params['workoutLogId']!;
      final workoutExerciseLogId = state.params['workoutExerciseLogId']!;
      return _buildTransition(
        key: state.pageKey,
        child: WorkoutExerciseLogsDetailsPage(
          workoutLogId: workoutLogId,
          workoutExerciseLogId: workoutExerciseLogId,
        ),
      );
    },
  );

  static final GoRoute _workoutLogExerciseListRoute = GoRoute(
    name: WorkoutLogsExercisesListPage.name,
    path: WorkoutLogsExercisesListPage.path,
    pageBuilder: (context, state) {
      final workoutLogId = state.params['workoutLogId']!;
      return _buildTransition(
        key: state.pageKey,
        child: WorkoutLogsExercisesListPage(
          workoutLogId: workoutLogId,
        ),
      );
    },
  );

  static CustomTransitionPage<void> _buildTransition({
    required ValueKey<String> key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          AppTransitions()
              .buildTransitions(animation, secondaryAnimation, child),
    );
  }
}
