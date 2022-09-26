import 'package:flutter/material.dart';
import 'package:future_of_workout/src/exercise_details/exercise_details.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class AboutExerciseButton extends StatelessWidget {
  const AboutExerciseButton({required this.exerciseId, super.key});

  final String exerciseId;

  @override
  Widget build(BuildContext context) {
    return BarButton(
      text: 'About exercise',
      icon: const Icon(Icons.info_outline),
      onTap: () {
        context.pushNamed(
          ExerciseDetailsPage.name,
          params: {'exerciseId': exerciseId},
        );
      },
    );
  }
}
