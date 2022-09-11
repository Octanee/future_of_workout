import 'package:future_of_workout/src/app/app_transitions.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/workout_details/workout_details.dart';
import 'package:future_of_workout/src/workout_list/view/workouts_list_tab.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/${WorkoutsListTab.name}',
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
    pageBuilder: (context, state) {
      final workoutId = state.params['workoutId']!;
      return CustomTransitionPage(
        key: state.pageKey,
        child: WorkoutDetailsPage(workoutId: workoutId),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            AppTransitions(duration: Duration(seconds: 4))
                .buildTransitions(animation, secondaryAnimation, child),
      );
    },
  );
}
