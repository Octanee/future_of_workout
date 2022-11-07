import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:go_router/go_router.dart';

class AddExercise extends StatelessWidget {
  const AddExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return ListAddButton(
      text: context.locale.addExercise,
      onTap: () {
        context.pushNamed(
          ExerciseListPage.name,
          extra: ExerciseListExtra(
            selectionType: SelectionType.multiple,
            onConfirm: (selected) async {
              context
                  .read<CurrentWorkoutBloc>()
                  .add(CurrentWorkoutAdd(exercises: selected));
            },
          ),
        );
      },
    );
  }
}
