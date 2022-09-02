import 'package:go_router/go_router.dart';

import '../pages/home/home.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
    ],
  );
}
