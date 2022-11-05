import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout/workout_exercise_details/workout_exercise_details.dart';

class DisplayMode extends StatelessWidget {
  const DisplayMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutExerciseDetailsBloc, WorkoutExerciseDetailsState>(
      buildWhen: (previous, current) =>
          previous.isAdvanced != current.isAdvanced,
      builder: (context, state) {
        final isAdvanced = state.isAdvanced;

        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: BarButton(
            text: isAdvanced
                ? context.local.simpleMode
                : context.local.advancedMode,
            icon: isAdvanced
                ? const AppIcon(iconData: AppIcons.listLess)
                : const AppIcon(iconData: AppIcons.listMore),
            onTap: () {
              context
                  .read<WorkoutExerciseDetailsBloc>()
                  .add(const WorkoutExerciseDetailsChangeDisplayMode());
            },
          ),
        );
      },
    );
  }
}
