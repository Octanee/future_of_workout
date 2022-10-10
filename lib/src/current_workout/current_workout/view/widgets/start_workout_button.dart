import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: 'Start workout',
      icon: const Icon(Icons.play_arrow),
      onTap: () {
        context
            .read<CurrentWorkoutBloc>()
            .add(const CurrentWorkoutStartWorkout());
      },
    );
  }
}
