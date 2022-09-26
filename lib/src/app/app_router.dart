import 'package:future_of_workout/src/app/app_transitions.dart';
import 'package:future_of_workout/src/current_workout_exercise/view/current_workout_exercise_page.dart';
import 'package:future_of_workout/src/current_workout_rest/current_workout_rest.dart';
import 'package:future_of_workout/src/current_workout_summary/view/view.dart';
import 'package:future_of_workout/src/exercise_details/exercise_details.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/workout_details/workout_details.dart';
import 'package:future_of_workout/src/workout_exercise_details/workout_exercise_details.dart';
import 'package:future_of_workout/src/workout_exercises_list/workout_exercises_list.dart';
import 'package:future_of_workout/src/workouts/workouts.dart';

import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/${WorkoutsPage.name}',
    routes: [
      _homeRoute,
      _exerciseDetailsRoute,
    ],
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
      _currentWorkoutExerciseRoute,
      _currentWorkoutSummaryRoute,
    ],
  );

  static final GoRoute _workoutDetailsRoute = GoRoute(
    name: WorkoutDetailsPage.name,
    path: WorkoutDetailsPage.path,
    pageBuilder: (context, state) {
      final workoutId = state.params['workoutId']!;
      return CustomTransitionPage(
        key: state.pageKey,
        child: WorkoutDetailsPage(workoutId: workoutId),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            AppTransitions()
                .buildTransitions(animation, secondaryAnimation, child),
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
      return CustomTransitionPage(
        key: state.pageKey,
        child: WorkoutExercisesListPage(workoutId: workoutId),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            AppTransitions()
                .buildTransitions(animation, secondaryAnimation, child),
      );
    },
  );

  static final GoRoute _workoutExerciseDetailsRoute = GoRoute(
    name: WorkoutExerciseDetailsPage.name,
    path: WorkoutExerciseDetailsPage.path,
    pageBuilder: (context, state) {
      final workoutId = state.params['workoutId']!;
      final workoutExerciseId = state.params['workoutExerciseId']!;
      return CustomTransitionPage(
        key: state.pageKey,
        child: WorkoutExerciseDetailsPage(
          workoutId: workoutId,
          workoutExerciseId: workoutExerciseId,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            AppTransitions()
                .buildTransitions(animation, secondaryAnimation, child),
      );
    },
  );

  static final GoRoute _exerciseDetailsRoute = GoRoute(
    name: ExerciseDetailsPage.name,
    path: ExerciseDetailsPage.path,
    pageBuilder: (context, state) {
      final exerciseId = state.params['exerciseId']!;

      return CustomTransitionPage(
        key: state.pageKey,
        child: ExerciseDetailsPage(exerciseId: exerciseId),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            AppTransitions()
                .buildTransitions(animation, secondaryAnimation, child),
      );
    },
  );

  static final GoRoute _currentWorkoutExerciseRoute = GoRoute(
    name: CurrentWorkoutExercisePage.name,
    path: CurrentWorkoutExercisePage.path,
    pageBuilder: (context, state) {
      final currentWorkoutExerciseId =
          state.params['currentWorkoutExerciseId']!;

      return CustomTransitionPage(
        key: state.pageKey,
        child: CurrentWorkoutExercisePage(
          currentWorkoutExerciseId: currentWorkoutExerciseId,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            AppTransitions()
                .buildTransitions(animation, secondaryAnimation, child),
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
      return CustomTransitionPage(
        key: state.pageKey,
        child: CurrentWorkoutRestPage(
          duration: time,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            AppTransitions()
                .buildTransitions(animation, secondaryAnimation, child),
      );
    },
  );

  static final GoRoute _currentWorkoutSummaryRoute = GoRoute(
    name: CurrentWorkoutSummaryPage.name,
    path: CurrentWorkoutSummaryPage.path,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const CurrentWorkoutSummaryPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            AppTransitions()
                .buildTransitions(animation, secondaryAnimation, child),
      );
    },
  );
}
