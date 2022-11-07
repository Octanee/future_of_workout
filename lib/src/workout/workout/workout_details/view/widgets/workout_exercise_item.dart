import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:workout_api/workout_api.dart';

class WorkoutExerciseItem extends StatelessWidget {
  const WorkoutExerciseItem({
    super.key,
    required this.workoutExercise,
    this.onTap,
  });

  final WorkoutExercise workoutExercise;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        onTap: onTap,
        child: Row(
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
                      context.locale
                          .seriesCount(workoutExercise.exerciseSeries.length),
                      style: AppTextStyle.medium16,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: AppIcon(iconData: AppIcons.right),
            ),
          ],
        ),
      ),
    );
  }
}
