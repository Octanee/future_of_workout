import 'dart:ui';

import 'package:future_of_workout/src/common.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';

class WorkoutExercisesList extends StatelessWidget {
  const WorkoutExercisesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
      buildWhen: (previous, current) =>
          previous.workout?.workoutExercises !=
          current.workout?.workoutExercises,
      builder: (context, state) {
        final list = state.workout!.workoutExercises;

        return ReorderableListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          onReorder: (oldIndex, newIndex) {
            context.read<WorkoutDetailsBloc>().add(
                  WorkoutDetailsReorder(
                    oldIndex: oldIndex,
                    newIndex: newIndex,
                  ),
                );
          },
          proxyDecorator: _proxyDecorator,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return WorkoutExerciseItem(
              key: Key('workout_exercise_item_${item.id}'),
              workoutExercise: item,
              onTap: () => context.goNamed(
                WorkoutExerciseDetailsPage.name,
                params: {
                  'homePageTab': WorkoutsPage.name,
                  'workoutId': state.workout!.id,
                  'workoutExerciseId': item.id,
                },
              ),
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
