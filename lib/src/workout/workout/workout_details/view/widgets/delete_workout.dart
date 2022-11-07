import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';

class DeleteWorkout extends StatelessWidget {
  const DeleteWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      builder: (context, state) {
        return DeleteButton(
          text: context.locale.deleteWorkout,
          dialogText: context.locale.deleteText(state.workout!.name),
          onConfirm: () => context
              .read<WorkoutDetailsBloc>()
              .add(const WorkoutDetailsDelete()),
        );
      },
    );
  }
}
