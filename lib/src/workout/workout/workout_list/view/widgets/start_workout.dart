import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: StartButton(
        text: 'Start workout',
        onTap: () {
          context
              .read<CurrentWorkoutBloc>()
              .add(const CurrentWorkoutStartWorkout());
          context.goNamed(
            HomePage.name,
            params: {'homePageTab': CurrentWorkoutPage.name},
          );
        },
      ),
    );
  }
}
