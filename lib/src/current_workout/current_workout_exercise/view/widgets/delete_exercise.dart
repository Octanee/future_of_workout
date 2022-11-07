import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';

class DeleteExercise extends StatelessWidget {
  const DeleteExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
      buildWhen: (previous, current) =>
          previous.workoutExerciseLog?.exerciseSeriesLogs !=
          current.workoutExerciseLog?.exerciseSeriesLogs,
      builder: (context, state) {
        return Visibility(
          visible:
              !state.workoutExerciseLog!.exerciseSeriesLogs.first.isFinished,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DeleteButton(
              dialogText: context.local
                  .deleteText(state.workoutExerciseLog!.exercise.name),
              onConfirm: () {
                context
                    .read<CurrentWorkoutExerciseBloc>()
                    .add(const CurrentWorkoutExerciseDelete());
              },
            ),
          ),
        );
      },
    );
  }
}
