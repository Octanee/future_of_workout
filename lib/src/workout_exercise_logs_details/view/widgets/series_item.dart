import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_exercise_logs_details/workout_exercise_logs_details.dart';
import 'package:workout_log_api/workout_log_api.dart';

class SeriesItem extends StatelessWidget {
  const SeriesItem({super.key, required this.series});

  final ExerciseSeriesLog series;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ExerciseSeriesLogItem(
        series: series,
        onTap: () async {
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
        },
      ),
    );
  }
}
