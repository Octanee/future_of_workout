import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';

class AddSeries extends StatelessWidget {
  const AddSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: AddButton(
        text: context.locale.addSeries,
        onTap: () => context
            .read<WorkoutExerciseDetailsBloc>()
            .add(const WorkoutExerciseDetailsAddingSeries()),
      ),
    );
  }
}
