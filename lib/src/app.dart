import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:future_of_workout/src/data/repositories/repositories.dart';
import 'package:future_of_workout/src/presentation/router/app_router.dart';

class FutureOfWorkoutApp extends StatelessWidget {
  const FutureOfWorkoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => FakeWorkoutRepository(),
        ),
        RepositoryProvider(
          create: (context) => FakeExerciseRepository(),
        ),
      ],
      
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }
}
