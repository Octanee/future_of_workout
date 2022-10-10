import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_log_api/workout_log_api.dart';

class AddSeries extends StatelessWidget {
  const AddSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseLogsDetailsBloc,
        WorkoutExerciseLogsDetailsState>(
      buildWhen: (previous, current) =>
          current.exerciseLog?.isFinished ?? false,
      builder: (context, state) {
        return Visibility(
          visible: state.exerciseLog?.isFinished ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AddButton(
              text: 'Add series',
              onTap: () async {
                final bloc = context.read<WorkoutExerciseLogsDetailsBloc>();
                ExerciseSeriesLog last;
                try {
                  last = state.exerciseLog!.exerciseSeriesLogs.last;
                } catch (_) {
                  last = ExerciseSeriesLog.fromExerciseSeries(
                    ExerciseSeries(index: 0),
                  );
                }
                await showDialog<void>(
                  context: context,
                  builder: (builderContext) => SeriesLogDialog(
                    weight: last.weight.toString(),
                    reps: last.reps.toString(),
                    intensity: last.intensity,
                    onConfirm: (reps, weight, intensity) {
                      bloc.add(
                        WorkoutExerciseLogsDetailsAddSeries(
                          seriesLog: ExerciseSeriesLog(
                            index: last.index + 1,
                            rest: last.rest,
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
