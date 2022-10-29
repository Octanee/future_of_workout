import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/app/bloc/app_bloc.dart';
import 'package:future_of_workout/src/shared/unit_converter.dart';
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
    final finished = workoutExerciseLog.exerciseSeriesLogs
        .where((series) => series.isFinished);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: finished.isNotEmpty
          ? CustomCard(
              onTap: onTap,
              child: Column(
                children: [
                  header,
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        _RepsColumn(items: finished),
                        _WeightColumn(items: finished),
                        _RestColumn(items: finished),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : header,
    );
  }
}

class _RestColumn extends StatelessWidget {
  const _RestColumn({required this.items});

  final Iterable<ExerciseSeriesLog> items;

  @override
  Widget build(BuildContext context) {
    return _SeriesColumn(
      header: const _ColumnHeader(
        name: 'Rest',
        icon: AppIcon(iconData: AppIcons.stopwatch),
      ),
      items: items
          .map<Widget>(
            (series) => BoldText(
              boldText: series.rest.toString(),
              mediumText: 's',
            ),
          )
          .toList(),
    );
  }
}

class _WeightColumn extends StatelessWidget {
  const _WeightColumn({required this.items});

  final Iterable<ExerciseSeriesLog> items;

  @override
  Widget build(BuildContext context) {
    final unit = context.read<AppBloc>().state.user!.weightUnit;

    return _SeriesColumn(
      isMiddle: true,
      header: const _ColumnHeader(
        name: 'Weight',
        icon: AppIcon(iconData: AppIcons.scale),
      ),
      items: items
          .map<Widget>(
            (series) => BoldText(
              boldText: UnitConverter.dispalyedWeight(
                unit: unit,
                value: series.weight,
              ).toString(),
              mediumText: unit.sufix,
            ),
          )
          .toList(),
    );
  }
}

class _RepsColumn extends StatelessWidget {
  const _RepsColumn({required this.items});

  final Iterable<ExerciseSeriesLog> items;

  @override
  Widget build(BuildContext context) {
    return _SeriesColumn(
      header: const _ColumnHeader(
        name: 'Reps',
        icon: AppIcon(iconData: AppIcons.repeat),
      ),
      items: items
          .map<Widget>(
            (series) => BoldText(
              boldText: series.reps.toString(),
            ),
          )
          .toList(),
    );
  }
}

class _ColumnHeader extends StatelessWidget {
  const _ColumnHeader({required this.name, required this.icon});

  final String name;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
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
}

class _SeriesColumn extends StatelessWidget {
  const _SeriesColumn({
    required this.header,
    required this.items,
    this.isMiddle = false,
  });

  final bool isMiddle;
  final Widget header;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
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
}
