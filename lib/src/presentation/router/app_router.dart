import 'package:go_router/go_router.dart';

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
            name: 'workout',
            path: 'workout/:id',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: WorkoutDetailsPage(id: state.params['id']!),
              transitionsBuilder: (context, animation, secondaryAnimation,
                      child) =>
                  AppTransitions()
                      .buildTransitions(animation, secondaryAnimation, child),
            ),
          ),
        ],
      ),
    ],
  );
}
