import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/workout/workout.dart';
import 'package:go_router/go_router.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutListBloc, WorkoutListState>(
      buildWhen: (previous, current) => previous.workouts != current.workouts,
      builder: (context, state) {
        final list = state.workouts;
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          physics: const BouncingScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            final workout = list[index];
            return WorkoutItem(
              workout: workout,
              isReverse: index.isOdd,
              onToggleFavorite: (isFavorite) =>
                  context.read<WorkoutListBloc>().add(
                        WorkoutListWorkoutFavoriteToggled(
                          workout: workout,
                          isFavorite: isFavorite,
                        ),
                      ),
              onTap: () {
                context.goNamed(
                  WorkoutDetailsPage.name,
                  params: {
                    'homePageTab': WorkoutsPage.name,
                    'workoutId': workout.id,
                  },
                );
              },
            );
          },
          // for (final workout in list)
        );
      },
    );
  }
}
