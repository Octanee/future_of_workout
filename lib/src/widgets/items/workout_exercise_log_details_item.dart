import 'package:flutter/material.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:workout_log_api/workout_log_api.dart';

class WorkoutExerciseLogDetailsItem extends StatelessWidget {
  const WorkoutExerciseLogDetailsItem({
    super.key,
    required this.header,
    required this.workoutExerciseLog,
    this.onTap,
  });

  final Widget header;
  final WorkoutExerciseLog workoutExerciseLog;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: CustomCard(
        onTap: onTap,
        child: Column(
          children: [
            header,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _buildColumn(
                    header: _buildColumnName(
                      name: 'Reps',
                      icon: const Icon(Icons.repeat_rounded),
                    ),
                    items: workoutExerciseLog.exerciseSeriesLogs
                        .map<Widget>(
                          (series) => _buildText(bold: series.reps.toString()),
                        )
                        .toList(),
                  ),
                  _buildColumn(
                    isMiddle: true,
                    header: _buildColumnName(
                      name: 'Weight',
                      icon: const Icon(Icons.accessibility_new_rounded),
                    ),
                    items: workoutExerciseLog.exerciseSeriesLogs
                        .map<Widget>(
                          (series) => _buildText(
                            bold: series.weight.toString(),
                            medium: 'kg',
                          ),
                        )
                        .toList(),
                  ),
                  _buildColumn(
                    header: _buildColumnName(
                      name: 'Rest',
                      icon: const Icon(Icons.repeat_rounded),
                    ),
                    items: workoutExerciseLog.exerciseSeriesLogs
                        .map<Widget>(
                          (series) => _buildText(
                            bold: series.rest.toString(),
                            medium: 's',
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn({
    required Widget header,
    required List<Widget> items,
    bool isMiddle = false,
  }) {
    return Flexible(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: isMiddle
              ? const Border(
                  left: BorderSide(color: AppColors.grey),
                  right: BorderSide(color: AppColors.grey),
                )
              : null,
        ),
        child: Column(
          children: [
            header,
            const SizedBox(height: 8),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildColumnName({required String name, required Icon icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
          style: AppTextStyle.semiBold20,
        ),
        icon,
      ],
    );
  }

  Widget _buildText({required String bold, String medium = ''}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: bold, style: AppTextStyle.semiBold16),
          TextSpan(text: medium, style: AppTextStyle.medium16),
        ],
      ),
    );
  }
}
