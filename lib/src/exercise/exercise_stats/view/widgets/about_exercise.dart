import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/buttons/about_exercise_button.dart';

class AboutExercise extends StatelessWidget {
  const AboutExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.exercise != current.exercise,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: AboutExerciseButton(exerciseId: state.exercise!.id),
        );
      },
    );
  }
}
