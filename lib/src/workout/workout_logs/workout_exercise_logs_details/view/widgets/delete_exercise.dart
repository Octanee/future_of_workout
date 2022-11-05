import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';

class DeleteExercise extends StatelessWidget {
  const DeleteExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseLogsDetailsBloc,
        WorkoutExerciseLogsDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: DeleteButton(
            text: context.local.deleteExercise,
            dialogText:
                context.local.deleteText(state.exerciseLog!.exercise.name),
            onConfirm: () => context.read<WorkoutExerciseLogsDetailsBloc>().add(
                  const WorkoutExerciseLogsDetailsDelete(),
                ),
          ),
        );
      },
    );
  }
}
