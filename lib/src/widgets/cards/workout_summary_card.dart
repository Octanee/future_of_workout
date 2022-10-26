import 'package:flutter/material.dart';
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
              children: [
                _buildDate(),
                _buildTime(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildExercises(),
                _buildKcal(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDate() {
    final formatter = DateFormat('dd MMM');

    return _CardRow(
      boldText: formatter.format(workoutLog.startDate),
      icon: const Icon(Icons.calendar_month_outlined),
    );
  }

  Widget _buildTime() {
    final time = workoutLog.endDate!.difference(workoutLog.startDate);

    return _CardRow(
      isReverse: true,
      boldText: '${time.inMinutes} ',
      mediumText: 'min',
      icon: const Icon(Icons.watch_later_outlined),
    );
  }

  Widget _buildKcal() {
    final time = workoutLog.endDate!.difference(workoutLog.startDate).inMinutes;
    final kcal = 200 * time ~/ 60;

    return _CardRow(
      boldText: '$kcal ',
      mediumText: 'kcal',
      icon: const Icon(Icons.local_fire_department_outlined),
      isReverse: true,
    );
  }

  Widget _buildExercises() {
    final exercises = workoutLog.workoutExerciseLogs
        .where((exercise) {
          return exercise.exerciseSeriesLogs.any((series) => series.isFinished);
        })
        .toList()
        .length;

    return _CardRow(
      boldText: '$exercises ',
      mediumText: 'exercises',
      icon: const Icon(Icons.repeat_rounded),
    );
  }
}

class _CardRow extends StatelessWidget {
  const _CardRow({
    required this.boldText,
    required this.icon,
    this.mediumText = '',
    this.isReverse = false,
  });

  final String boldText;
  final String mediumText;
  final Widget icon;
  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    final children = [
      BoldText(
        boldText: boldText,
        mediumText: mediumText,
      ),
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
}
