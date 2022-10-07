import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_exercise_logs_details/workout_exercise_logs_details.dart';

class RemoveSeries extends StatelessWidget {
  const RemoveSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseLogsDetailsBloc,
        WorkoutExerciseLogsDetailsState>(
      buildWhen: (previous, current) =>
          previous.exerciseLog?.exerciseSeriesLogs !=
          current.exerciseLog?.exerciseSeriesLogs,
      builder: (context, state) {
        return Visibility(
          visible: state.exerciseLog?.exerciseSeriesLogs
                  .any((series) => series.isFinished) ??
              false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RemoveSeriesButton(
              onTap: () async {
                final bloc = context.read<WorkoutExerciseLogsDetailsBloc>();
                final lastFinished = state.exerciseLog!.exerciseSeriesLogs
                    .lastWhere((series) => series.isFinished);
                await showDialog<void>(
                  context: context,
                  builder: (builderContext) => ConfirmDialog(
                    title: 'Remove series',
                    content: Text(
                      'Do you want to delete the series?',
                      style: AppTextStyle.medium16,
                    ),
                    onConfirm: () => bloc.add(
                      WorkoutExerciseLogsDetailsUpdateSeries(
                        seriesLog: lastFinished.copyWith(isFinished: false),
                      ),
                    ),
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
