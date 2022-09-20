import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/custom_card.dart';
import 'package:workout_api/workout_api.dart';

class CurrentWorkoutExerciseSeriesItem extends StatelessWidget {
  const CurrentWorkoutExerciseSeriesItem({
    super.key,
    required this.index,
    required this.exerciseSeries,
    this.isFinished = false,
    this.onTap,
  });

  final int index;
  final ExerciseSeries exerciseSeries;
  final bool isFinished;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
      child: CustomCard(
        onTap: onTap,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(64),
                color: AppColors.yellow,
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: AppTextStyle.bold28,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        exerciseSeries.weight.toString(),
                        style: AppTextStyle.bold28,
                      ),
                      Text(
                        'kg',
                        style: AppTextStyle.medium16,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '/',
                      style:
                          AppTextStyle.bold28.copyWith(color: AppColors.yellow),
                    ),
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        exerciseSeries.reps.toString(),
                        style: AppTextStyle.bold28,
                      ),
                      Text(
                        'reps',
                        style: AppTextStyle.medium16,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
