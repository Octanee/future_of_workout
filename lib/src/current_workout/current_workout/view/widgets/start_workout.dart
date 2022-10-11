import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Workout',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(Octane): Display fancy image
            const Icon(
              Icons.play_arrow_outlined,
              color: AppColors.yellow,
              size: 72,
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: BarButton(
                text: 'Start workout',
                icon: const Icon(Icons.play_arrow),
                onTap: () {
                  context
                      .read<CurrentWorkoutBloc>()
                      .add(const CurrentWorkoutStartWorkout());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
