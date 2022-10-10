import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';
import 'package:workout_log_api/workout_log_api.dart';

class SeriesItem extends StatelessWidget {
  const SeriesItem({super.key, required this.series, this.isClickable = false});

  final ExerciseSeriesLog series;
  final bool isClickable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ExerciseSeriesLogItem(
        series: series,
        onTap: isClickable
            ? () async {
                final bloc = context.read<WorkoutExerciseLogsDetailsBloc>();
                await showDialog<void>(
                  context: context,
                  builder: (builderContext) => SeriesLogDialog(
                    weight: series.weight.toString(),
                    reps: series.reps.toString(),
                    intensity: series.intensity,
                    onConfirm: (reps, weight, intensity) {
                      bloc.add(
                        WorkoutExerciseLogsDetailsUpdateSeries(
                          seriesLog: series.copyWith(
                            weight: weight,
                            reps: reps,
                            intensity: intensity,
                            isFinished: true,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            : null,
      ),
    );
  }
}
