import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/buttons/buttons.dart';
import 'package:future_of_workout/src/workout/workout/workout_exercise_details/workout_exercise_details.dart';

class DisplayMode extends StatelessWidget {
  const DisplayMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
      buildWhen: (previous, current) =>
          previous.isAdvanced != current.isAdvanced,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: BarButton(
            text: state.isAdvanced ? 'Simple mode' : 'Advanced mode',
            icon: const Icon(Icons.display_settings_rounded),
            onTap: () {
              context
                  .read<WorkoutExerciseDetailsBloc>()
                  .add(const WorkoutExerciseDetailsChangeDisplayMode());
            },
          ),
        );
      },
    );
  }
}
