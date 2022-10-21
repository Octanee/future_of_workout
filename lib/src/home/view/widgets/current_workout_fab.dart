import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/home/home.dart';

class CurrentWorkoutFab extends StatelessWidget {
  const CurrentWorkoutFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(HomeNavigationItem.currentWorkout.icon),
      onPressed: () => context
          .read<NavigationCubit>()
          .changeDestination(item: HomeNavigationItem.currentWorkout),
    );
  }
}
