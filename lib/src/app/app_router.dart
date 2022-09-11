import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/workout_details/workout_details.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/${HomeNavigationItem.workouts.name}',
    routes: [
      GoRoute(
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
        ],
      )
    ],
  );

  static final GoRoute _workoutDetailsRoute = GoRoute(
    name: WorkoutDetailsPage.name,
    path: WorkoutDetailsPage.path,
    builder: (context, state) {
      final workoutId = state.params['workoutId']!;
      return WorkoutDetailsPage(workoutId: workoutId);
    },
  );
}
