import 'dart:ui';

import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:go_router/go_router.dart';

class ExerciseLogsList extends StatelessWidget {
  const ExerciseLogsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutBloc, CurrentWorkoutState>(
      buildWhen: (previous, current) =>
          previous.workoutLog?.workoutExerciseLogs !=
          current.workoutLog?.workoutExerciseLogs,
      builder: (context, state) {
        final list = state.workoutLog!.workoutExerciseLogs;

        return ReorderableListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          shrinkWrap: true,
          proxyDecorator: _proxyDecorator,
          onReorder: (oldIndex, newIndex) {
            context.read<CurrentWorkoutBloc>().add(
                  CurrentWorkoutReorder(
                    oldIndex: oldIndex,
                    newIndex: newIndex,
                  ),
                );
          },
          itemBuilder: (context, index) {
            final item = list[index];
            return WorkoutExerciseLogItem(
              key: Key('workout_exercise_log_item_${item.id}'),
              workoutExerciseLog: item,
              onTap: () {
                if (state.workoutExerciseId == item.id) {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                }
                context.goNamed(
                  CurrentWorkoutExercisePage.name,
                  params: CurrentWorkoutExercisePage.params(
                    workoutExerciseLog: item.id,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final animValue = Curves.easeInOut.transform(animation.value);
        final elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }
}
