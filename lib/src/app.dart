import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/repositories.dart';
import 'presentation/router/app_router.dart';

class FutureOfWorkoutApp extends StatelessWidget {
  const FutureOfWorkoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FakeWorkoutRepository(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
      ),
    );
  }

  
}
