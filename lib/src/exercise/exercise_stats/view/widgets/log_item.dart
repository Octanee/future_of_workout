import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class LogItem extends StatelessWidget {
  const LogItem({
    required this.workoutExerciseLog,
    required this.date,
    super.key,
  });

  final WorkoutExerciseLog workoutExerciseLog;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('EEE, dd MMM');

    return WorkoutExerciseLogDetailsItem(
      workoutExerciseLog: workoutExerciseLog,
      header: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          formatter.format(date),
          style: AppTextStyle.bold24,
        ),
      ),
    );
  }
}
