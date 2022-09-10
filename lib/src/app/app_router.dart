import 'package:future_of_workout/src/home/home.dart';
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
      )
    ],
  );
}
