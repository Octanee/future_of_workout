import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:workout_log_api/workout_log_api.dart';

class WorkoutLogItem extends StatelessWidget {
  const WorkoutLogItem({
    super.key,
    required this.log,
    this.isReverse = false,
    this.onTap,
  });

  final WorkoutLog log;
  final bool isReverse;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomCard(
          key: Key('workout_log_item_${log.id}'),
          onTap: onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Row(
              children: _getContent(constraints.maxWidth / 2),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _getContent(double size) {
    final list = [
      Align(
        alignment: isReverse ? Alignment.topRight : Alignment.topLeft,
        child: _getData(size),
      ),
      _getBody(size),
    ];

    if (isReverse) {
      return list.reversed.toList();
    }
    return list;
  }

  Widget _getData(double size) {
    return SizedBox(
      width: size,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment:
              isReverse ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(log.name, style: AppTextStyle.bold24),
            const SizedBox(height: 16),
            _buildDate(),
            const SizedBox(height: 8),
            _buildTime(),
            const SizedBox(height: 8),
            _buildExercises(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _getBody(double size) {
    return BodyContainer(
      size: size,
      body: log.body(),
    );
  }

  Widget _buildDate() {
    final formatter = DateFormat('dd MMM');

    final text = _buildText(
      bold: formatter.format(log.startDate),
    );
    return _buildRow(
      text: text,
      icon: const Icon(Icons.calendar_month_outlined),
    );
  }

  Widget _buildTime() {
    final time = log.endDate!.difference(log.startDate);

    final text = _buildText(
      bold: '${time.inMinutes} ',
      medium: 'min',
    );
    return _buildRow(
      text: text,
      icon: const Icon(Icons.watch_later_outlined),
    );
  }

  Widget _buildExercises() {
    final exercises = log.workoutExerciseLogs
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
    );
  }

  Widget _buildRow({
    required Widget text,
    required Icon icon,
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
