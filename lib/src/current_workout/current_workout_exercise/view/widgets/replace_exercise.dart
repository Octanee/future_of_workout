import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';

import 'package:go_router/go_router.dart';

class ReplaceExercise extends StatelessWidget {
  const ReplaceExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ReplaceButton(
        text: context.local.replaceExercise,
        onTap: () {
          context.pushNamed(
            ExerciseListPage.name,
            params: {},
            extra: ExerciseListExtra(
              onConfirm: (selected) async {
                context.read<CurrentWorkoutExerciseBloc>().add(
                      CurrentWorkoutExerciseReplace(exercise: selected.first),
                    );
              },
            ),
          );
        },
      ),
    );
  }
}
