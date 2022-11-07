import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';

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
          visible: state.exerciseLog?.exerciseSeriesLogs.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ListRemoveButton(
              text: context.locale.deleteSeries,
              dialogText: context.locale.deleteSeriesText,
              onConfirm: () async {
                context
                    .read<WorkoutExerciseLogsDetailsBloc>()
                    .add(const WorkoutExerciseLogsDetailsRemoveSeries());
              },
            ),
          ),
        );
      },
    );
  }
}
