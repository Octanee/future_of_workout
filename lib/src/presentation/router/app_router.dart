import 'package:go_router/go_router.dart';

import '../../data/models/models.dart';
import '../pages/error/error.dart';
import '../pages/home/home.dart';
import '../pages/workout_details/page.dart';
import 'router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: 'workout',
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
