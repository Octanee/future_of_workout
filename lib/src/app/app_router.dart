import 'package:flutter/cupertino.dart';
import 'package:future_of_workout/src/app/app_transitions.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/body/body_circuit/body_circuit.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/setup/setup.dart';
import 'package:future_of_workout/src/shared/shared.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  factory AppRouter({required AppBloc bloc}) {
    _instance.router = _router(bloc: bloc);
    return _instance;
  }

  AppRouter._();

  static final AppRouter _instance = AppRouter._();

  late GoRouter router;

  static GoRouter _router({required AppBloc bloc}) {
    return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(bloc.stream),
      initialLocation: '/${WorkoutsPage.name}',
      routes: [
        _setupRoute,
        _homeRoute,
        _exerciseDetailsRoute,
        _exerciseListRoute,
        _exerciseStatsRoute
      ],
      redirect: (state) {
        if (state.location != SetupPage.name &&
            bloc.state.status == AppStatus.loaded &&
            bloc.state.user == null) {
          return SetupPage.name;
        }

        return null;
      },
    );
  }

  static final GoRoute _setupRoute = GoRoute(
    name: SetupPage.name,
    path: SetupPage.path,
    pageBuilder: (context, state) {
      return _buildTransition(
        key: state.pageKey,
        child: const SetupPage(),
      );
    },
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

  static final GoRoute _exerciseStatsRoute = GoRoute(
    name: ExerciseStatsPage.name,
    path: ExerciseStatsPage.path,
    pageBuilder: (context, state) {
      final exerciseId = state.params['exerciseId']!;
      return _buildTransition(
        key: state.pageKey,
        child: ExerciseStatsPage(exerciseId: exerciseId),
      );
    },
  );

  static final GoRoute _exerciseListRoute = GoRoute(
    name: ExerciseListPage.name,
    path: ExerciseListPage.path,
    pageBuilder: (context, state) {
      final extra = (state.extra as ExerciseListExtra?) ??
          ExerciseListExtra(
            onConfirm: (_) async => logger.e('Implement onConfirm'),
          );
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
      _bodyCircuitAddRoute,
      _bodyCircuitDetailsRoute
    ],
  );

  static final GoRoute _bodyCircuitAddRoute = GoRoute(
    name: BodyCircuitAddPage.name,
    path: BodyCircuitAddPage.path,
    pageBuilder: (context, state) {
      final measurementKey = state.params['measurementKey']!;
      return _buildTransition(
        key: state.pageKey,
        child: BodyCircuitAddPage(measurementKey: measurementKey),
      );
    },
  );

  static final GoRoute _bodyCircuitDetailsRoute = GoRoute(
    name: BodyCircuitDetailsPage.name,
    path: BodyCircuitDetailsPage.path,
    pageBuilder: (context, state) {
      final measurementPlace = state.params['measurementPlace']!;
      return _buildTransition(
        key: state.pageKey,
        child: BodyCircuitDetailsPage(measurementPlace: measurementPlace),
      );
    },
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
      _workoutExerciseDetailsRoute,
    ],
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
