import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/home/home.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:go_router/go_router.dart';

class StartWorkoutButton extends StatelessWidget {
  const StartWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      buildWhen: (previous, current) =>
          previous.workout?.workoutExercises !=
          current.workout?.workoutExercises,
      builder: (context, state) {
        return Visibility(
          visible: state.workout?.workoutExercises.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: BarButton(
              text: 'Start workout',
              icon: const Icon(Icons.play_arrow_outlined),
              onTap: () {
                context
                    .read<CurrentWorkoutBloc>()
                    .add(CurrentWorkoutStartWorkout(id: state.workout!.id));
                context.goNamed(
                  HomePage.name,
                  params: {'homePageTab': CurrentWorkoutPage.name},
                );
              },
            ),
          ),
        );
      },
    );
  }
}