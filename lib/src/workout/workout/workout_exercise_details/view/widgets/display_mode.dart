import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout/workout_exercise_details/workout_exercise_details.dart';

class DisplayMode extends StatelessWidget {
  const DisplayMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
      buildWhen: (previous, current) =>
          previous.isAdvanced != current.isAdvanced,
      builder: (context, state) {
        final isAdvanced = state.isAdvanced;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: BarButton(
            text: isAdvanced ? 'Simple mode' : 'Advanced mode',
            icon: isAdvanced
                ? const AppIcon(iconData: AppIcons.listLess)
                : const AppIcon(iconData: AppIcons.listMore),
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
