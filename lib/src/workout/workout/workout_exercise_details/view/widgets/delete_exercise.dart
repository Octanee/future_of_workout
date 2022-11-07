import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout/workout_exercise_details/workout_exercise_details.dart';

class DeleteExercise extends StatelessWidget {
  const DeleteExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
      buildWhen: (previous, current) =>
          previous.workoutExercise?.exercise !=
          current.workoutExercise?.exercise,
      builder: (context, state) {
        final exercise = state.workoutExercise!.exercise;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: DeleteButton(
            text: context.locale.deleteExercise,
            dialogText: context.locale.deleteText(exercise.name),
            onConfirm: () => context
                .read<WorkoutExerciseDetailsBloc>()
                .add(const WorkoutExerciseDetailsDeleteWorkoutExercise()),
          ),
        );
      },
    );
  }
}
