import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';

class CurrentWorkoutContent extends StatelessWidget {
  const CurrentWorkoutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      buildWhen: (previous, current) =>
          previous.workoutLog?.workoutExerciseLogs !=
          current.workoutLog?.workoutExerciseLogs,
      builder: (context, state) {
        final isEmpty = state.workoutLog!.workoutExerciseLogs.isEmpty;

        return Column(
          children: [
            Visibility(
              visible: !isEmpty,
              child: const ExerciseLogsList(),
            ),
            const AddExercise(),
            Visibility(
              visible: isEmpty,
              child: AppEmptyList(
                text: context.locale.addExerciseText,
              ),
            ),
          ],
        );
      },
    );
  }
}
