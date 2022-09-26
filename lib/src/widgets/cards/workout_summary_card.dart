import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:workout_log_api/workout_log_api.dart';

class WorkoutSummaryCard extends StatelessWidget {
  const WorkoutSummaryCard({required this.workoutLog, super.key});

  final WorkoutLog workoutLog;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildDate(), _buildTime()],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildExercises(), _buildKcal()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDate() {
    final formatter = DateFormat('dd MMM');

    final text = _buildText(
      bold: formatter.format(workoutLog.startDate),
    );
    return _buildRow(
      isReverse: false,
      text: text,
      icon: const Icon(Icons.calendar_month_outlined),
    );
  }

  Widget _buildTime() {
    final time = workoutLog.endDate!.difference(workoutLog.startDate);

    final text = _buildText(
      bold: '${time.inMinutes} ',
      medium: 'min',
    );
    return _buildRow(
      isReverse: true,
      text: text,
      icon: const Icon(Icons.watch_later_outlined),
    );
  }

  Widget _buildKcal() {
    final time = workoutLog.endDate!.difference(workoutLog.startDate).inMinutes;
    final kcal = 200 * time ~/ 60;
    final text = _buildText(
      bold: '$kcal ',
      medium: 'kcal',
    );
    return _buildRow(
      isReverse: true,
      text: text,
      icon: const Icon(Icons.local_fire_department_outlined),
    );
  }

  Widget _buildExercises() {
    final exercises = workoutLog.workoutExerciseLogs
        .where((exercise) => exercise.isFinished)
        .toList()
        .length;
    final text = _buildText(
      bold: '$exercises ',
      medium: 'exercises',
    );
    return _buildRow(
      text: text,
      icon: const Icon(Icons.repeat_rounded),
      isReverse: false,
    );
  }

  Widget _buildRow({
    required Widget text,
    required Icon icon,
    required bool isReverse,
  }) {
    final children = [
      text,
      const SizedBox(width: 8),
      icon,
    ];
    return Row(
      mainAxisAlignment:
          isReverse ? MainAxisAlignment.end : MainAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      children: isReverse ? children : children.reversed.toList(),
    );
  }

  Widget _buildText({required String bold, String medium = ''}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: bold, style: AppTextStyle.semiBold20),
          TextSpan(text: medium, style: AppTextStyle.medium16),
        ],
      ),
    );
  }
}
