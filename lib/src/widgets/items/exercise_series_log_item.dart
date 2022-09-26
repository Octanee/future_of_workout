import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/custom_card.dart';
import 'package:workout_log_api/workout_log_api.dart';

class ExerciseSeriesLogItem extends StatelessWidget {
  const ExerciseSeriesLogItem({
    super.key,
    required this.series,
    this.onTap,
  });

  final ExerciseSeriesLog series;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              color: series.isFinished ? AppColors.grey : AppColors.yellow,
            ),
            child: Center(
              child: Text(
                '${series.index}',
                style: AppTextStyle.bold28.copyWith(
                  color: series.isFinished ? AppColors.yellow : AppColors.grey,
                ),
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
                      series.weight.toString(),
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
                      series.reps.toString(),
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
    );
  }
}
