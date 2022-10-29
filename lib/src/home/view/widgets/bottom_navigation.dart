import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/home/home.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final currentWorkout = context.watch<CurrentWorkoutBloc>().state.workoutLog;

    return BottomAppBar(
      elevation: 2,
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          Visibility(
            visible: currentWorkout != null,
            child: const Flexible(fit: FlexFit.tight, child: SizedBox()),
          ),
          const NavigationItem(item: HomeNavigationItem.workouts),
          const NavigationItem(item: HomeNavigationItem.body),
          const NavigationItem(item: HomeNavigationItem.settings),
        ],
      ),
    );
  }
}
