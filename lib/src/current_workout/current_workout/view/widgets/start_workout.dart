import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:lottie/lottie.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              context
                  .read<CurrentWorkoutBloc>()
                  .add(const CurrentWorkoutStartWorkout());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/workout.json',
                  ),
                  const SizedBox(height: 64),
                  const BarButton(
                    text: 'Start workout',
                    icon: Icon(Icons.play_arrow),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
