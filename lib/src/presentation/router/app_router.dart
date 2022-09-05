import 'package:go_router/go_router.dart';

import '../../data/models/models.dart';
import '../pages/error/error.dart';
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
            path: '${WorkoutDetailsPage.name}/:id',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: WorkoutDetailsPage(
                workout: state.extra! as Workout,
              ),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  AppTransitions()
                      .buildTransitions(animation, secondaryAnimation, child),
            ),
            routes: [
              GoRoute(
                name: WorkoutExercisesListPage.name,
                path: WorkoutExercisesListPage.name,
                pageBuilder: (context, state) => CustomTransitionPage(
                  key: state.pageKey,
                  child: WorkoutExercisesListPage(
                    workout: state.extra! as Workout,
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          AppTransitions().buildTransitions(
                              animation, secondaryAnimation, child),
                ),
              ),
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
