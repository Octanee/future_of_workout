import 'package:flutter/material.dart';

import 'package:future_of_workout/src/presentation/styles/styles.dart';

class WorkoutExercisesListCategoryTab extends StatelessWidget {
  const WorkoutExercisesListCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Category!',
        style: AppTextStyle.semiBold16,
      ),
    );
  }
}
