import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:workout_api/workout_api.dart';

class WorkoutExerciseItem extends StatelessWidget {
  const WorkoutExerciseItem({
    super.key,
    required this.workoutExercise,
    this.onTap,
    this.onDismissed,
  });

  final WorkoutExercise workoutExercise;
  final VoidCallback? onTap;
  final DismissDirectionCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key('workoutExerciseItem_${workoutExercise.id}'),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {},
          ),
        ],
      ),
      child: CustomCard(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SvgPicture.asset(
                      workoutExercise.exercise.imagePath,
                      height: 64,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workoutExercise.exercise.name,
                      style: AppTextStyle.bold20,
                    ),
                    Text(
                      '${workoutExercise.exerciseSeries.length} series',
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
                Icons.more_vert_outlined,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
