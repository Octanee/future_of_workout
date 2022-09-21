import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';

import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';

class CurrentWorkoutExerciseItem extends StatelessWidget {
  const CurrentWorkoutExerciseItem({
    super.key,
    required this.exercise,
    this.onTap,
  });

  final CurrentWorkoutExercise exercise;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: CustomCard(
        onTap: onTap,
        child: Row(
          children: [
            Row(
              children: [
                if (!exercise.isFinished)
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        exercise.exercise.imagePath,
                        height: 64,
                      ),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(64),
                        color: AppColors.yellow,
                      ),
                      child: const Icon(Icons.check),
                    ),
                  ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.exercise.name,
                      style: AppTextStyle.bold20,
                    ),
                    Text(
                      '${exercise.series.length} series',
                      style: AppTextStyle.medium16,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
