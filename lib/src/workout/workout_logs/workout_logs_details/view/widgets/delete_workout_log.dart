import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';

class DeleteWorkoutLog extends StatelessWidget {
  const DeleteWorkoutLog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutLogsDetailsBloc, WorkoutLogsDetailsState>(
      builder: (context, state) {
        return DeleteButton(
          text: context.locale.deleteWorkout,
          dialogText: context.locale.deleteText(state.workoutLog!.name),
          onConfirm: () => context
              .read<WorkoutLogsDetailsBloc>()
              .add(const WorkoutLogsDetailsDelete()),
        );
      },
    );
  }
}
