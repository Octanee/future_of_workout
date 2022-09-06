import 'package:go_router/go_router.dart';

import '../pages/error/error.dart';
import '../pages/workout_exercise_details/page.dart';
import '../pages/workout_exercises_list/workout_exercises_list.dart';
import '../pages/home/home.dart';
import '../pages/workout_details/workout_details.dart';
import 'router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/${HomePage.name}',
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: HomePage.name,
        path: '/${HomePage.name}',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: WorkoutDetailsPage.name,
            path: '${WorkoutDetailsPage.name}/:workoutId',
            pageBuilder: (context, state) {
              final workoutId = state.params['workoutId']!;
              return CustomTransitionPage(
                key: state.pageKey,
                child: WorkoutDetailsPage(workoutId: workoutId),
                transitionsBuilder: (context, animation, secondaryAnimation,
                        child) =>
                    AppTransitions()
                        .buildTransitions(animation, secondaryAnimation, child),
              );
            },
            routes: [
              GoRoute(
                  name: WorkoutExercisesListPage.name,
                  path: WorkoutExercisesListPage.name,
                  pageBuilder: (context, state) {
                    final workoutId = state.params['workoutId']!;
                    return CustomTransitionPage(
                      key: state.pageKey,
                      child: WorkoutExercisesListPage(workoutId: workoutId),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              AppTransitions().buildTransitions(
                                  animation, secondaryAnimation, child),
                    );
                  }),
              GoRoute(
                  name: WorkoutExerciseDetailsPage.name,
                  path: '${WorkoutExerciseDetailsPage.name}/:exerciseId',
                  pageBuilder: (context, state) {
                    final workoutId = state.params['workoutId']!;
                    final exerciseId = state.params['exerciseId']!;
                    final isNew = state.extra as bool;

                    return CustomTransitionPage(
                      key: state.pageKey,
                      child: WorkoutExerciseDetailsPage(
                        workoutId: workoutId,
                        exerciseId: exerciseId,
                        isNew: isNew,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              AppTransitions().buildTransitions(
                                  animation, secondaryAnimation, child),
                    );
                  }),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: ErrorPage(
        error: state.error,
        name: state.name,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          AppTransitions()
              .buildTransitions(animation, secondaryAnimation, child),
    ),
  );
}
