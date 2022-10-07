import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_exercise_logs_details/workout_exercise_logs_details.dart';
import 'package:workout_log_api/workout_log_api.dart';

class AddSeries extends StatelessWidget {
  const AddSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseLogsDetailsBloc,
        WorkoutExerciseLogsDetailsState>(
      buildWhen: (previous, current) =>
          previous.exerciseLog?.isFinished != current.exerciseLog?.isFinished,
      builder: (context, state) {
        return Visibility(
          visible: state.exerciseLog?.isFinished ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AddSeriesButton(
              onTap: () async {
                final bloc = context.read<WorkoutExerciseLogsDetailsBloc>();
                final lastSeries = state.exerciseLog!.exerciseSeriesLogs.last;
                await showDialog<void>(
                  context: context,
                  builder: (builderContext) => SeriesLogDialog(
                    weight: lastSeries.weight.toString(),
                    reps: lastSeries.reps.toString(),
                    intensity: lastSeries.intensity,
                    onConfirm: (reps, weight, intensity) {
                      bloc.add(
                        WorkoutExerciseLogsDetailsAddSeries(
                          seriesLog: ExerciseSeriesLog(
                            index: lastSeries.index + 1,
                            rest: lastSeries.rest,
                            isFinished: true,
                            weight: weight,
                            reps: reps,
                            intensity: intensity,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
