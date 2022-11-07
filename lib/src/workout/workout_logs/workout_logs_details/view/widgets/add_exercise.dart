import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/workout/workout_logs/workout_logs.dart';
import 'package:go_router/go_router.dart';

class AddExercise extends StatelessWidget {
  const AddExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AddButton(
        text: context.locale.addExercise,
        onTap: () {
          context.pushNamed(
            ExerciseListPage.name,
            extra: ExerciseListExtra(
              selectionType: SelectionType.multiple,
              onConfirm: (selected) async {
                context
                    .read<WorkoutLogsDetailsBloc>()
                    .add(WorkoutLogsDetailsAddExercises(exercises: selected));
              },
            ),
          );
        },
      ),
    );
  }
}
