import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class WorkoutExerciseLogItem extends StatelessWidget {
  const WorkoutExerciseLogItem({
    super.key,
    required this.workoutExerciseLog,
    this.onTap,
    this.markCompleted = true,
  });

  final WorkoutExerciseLog workoutExerciseLog;
  final VoidCallback? onTap;
  final bool markCompleted;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomCard(
          onTap: onTap,
          child: Row(
            children: [
              Row(
                children: [
                  _buildIcon(constraints.maxWidth * 0.25),
                  _ExerciseData(workoutExerciseLog: workoutExerciseLog),
                ],
              ),
              const Spacer(),
              if (onTap != null)
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: AppIcon(iconData: AppIcons.right),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIcon(double size) {
    if (workoutExerciseLog.isFinished && markCompleted) {
      return _CompleteIcon(size: size);
    }
    return _ExerciseImage(
      workoutExerciseLog: workoutExerciseLog,
      size: size,
    );
  }
}

class _ExerciseData extends StatelessWidget {
  const _ExerciseData({required this.workoutExerciseLog});

  final WorkoutExerciseLog workoutExerciseLog;

  @override
  Widget build(BuildContext context) {
    final series = workoutExerciseLog.exerciseSeriesLogs.length;
    final finished = workoutExerciseLog.exerciseSeriesLogs
        .where((log) => log.isFinished)
        .length;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workoutExerciseLog.exercise.name,
          style: AppTextStyle.bold20,
        ),
        Row(
          children: [
            Text(
              '$finished / ',
              style: AppTextStyle.medium16,
            ),
            Text(
              context.locale.seriesCount(series),
              style: AppTextStyle.medium16,
            ),
          ],
        ),
      ],
    );
  }
}

class _ExerciseImage extends StatelessWidget {
  const _ExerciseImage({
    required this.workoutExerciseLog,
    required this.size,
  });

  final WorkoutExerciseLog workoutExerciseLog;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          workoutExerciseLog.exercise.imagePath,
          height: 64,
        ),
      ),
    );
  }
}

class _CompleteIcon extends StatelessWidget {
  const _CompleteIcon({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: AppColors.yellow,
          ),
          child: const AppIcon(
            iconData: AppIcons.check,
          ),
        ),
      ),
    );
  }
}
