import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/workout/workout/workout.dart';
import 'package:future_of_workout/src/workout/workout/workout_list/view/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workouts/workouts.dart';
import 'package:go_router/go_router.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutListBloc, WorkoutListState>(
      buildWhen: (previous, current) => previous.workouts != current.workouts,
      builder: (context, state) {
        final list = state.workouts;

        return Column(
          children: list.map<Widget>((workout) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: WorkoutItem(
                workout: workout,
                isReverse: list.indexOf(workout).isOdd,
                onTap: () {
                  context.goNamed(
                    WorkoutDetailsPage.name,
                    params: {
                      'homePageTab': WorkoutsPage.name,
                      'workoutId': workout.id,
                    },
                  );
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
