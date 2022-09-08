import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:future_of_workout/src/data/repositories/repositories.dart';
import 'package:future_of_workout/src/logic/home/home.dart';
import 'package:future_of_workout/src/presentation/pages/home/view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String name = 'home';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => CreatedListCubit(
              repository: context.read<FakeWorkoutRepository>(),)
            ..fetchList(),
        ),
      ],
      child: const HomeView(),
    );
  }
}
