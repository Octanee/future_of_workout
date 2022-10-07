import 'package:flutter/material.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_exercise_logs_details/workout_exercise_logs_details.dart';
import 'package:future_of_workout/src/workouts/workouts.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class ExerciseLogItem extends StatelessWidget {
  const ExerciseLogItem({required this.log, super.key});

  final WorkoutExerciseLog log;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: WorkoutExerciseLogItem(
        markCompleted: false,
        workoutExerciseLog: log,
        onTap: () {
          context.goNamed(
            WorkoutExerciseLogsDetailsPage.name,
            params: {
              'homePageTab': WorkoutsPage.name,
              'workoutLogId': log.id,
              'workoutExerciseLogId': log.id,
            },
          );
        },
      ),
    );
  }
}
