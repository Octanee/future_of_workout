import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';


class WorkoutExercisesListMuscleTab extends StatelessWidget {
  const WorkoutExercisesListMuscleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Muscle!',
        style: AppTextStyle.semiBold16,
      ),
    );
  }
}
