import 'package:flutter/material.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

import 'package:go_router/go_router.dart';

class ReplaceExercise extends StatelessWidget {
  const ReplaceExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ReplaceButton(
        onTap: () {
          context.pushNamed(
            ExerciseListPage.name,
            params: {},
            extra: ExerciseListExtra(
              onConfirm: (selected) {},
              multiSelected: false,
            ),
          );
        },
      ),
    );
  }
}