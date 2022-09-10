import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/app_loading.dart';
import 'package:future_of_workout/src/workout_list/workout_list.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutsListTab extends StatelessWidget {
  const WorkoutsListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutListBloc(
        workoutRepository: context.read<WorkoutRepository>(),
      )..add(const WorkoutListSubcriptionRequested()),
      child: const WorkoutListView(),
    );
  }
}

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutListBloc, WorkoutListState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == WorkoutListStatus.failure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text('Workout list error')));
        } else if (state.status == WorkoutListStatus.added) {
          // TODO(Octane): Navigate to WorkoutDetailsPage
        }
      },
      builder: (context, state) {
        if (state.workouts.isEmpty) {
          if (state.status == WorkoutListStatus.loaded) {
            return const AppLoading();
          } else if (state.status != WorkoutListStatus.loaded) {
            return const SizedBox();
          } else {
            return const Center(
              child: Text('List of workouts is empty.'),
            );
          }
        }

        return ListView(
          children: [
            for (final workout in state.workouts)
              WorkoutItem(
                workout: workout,
                onToggleFavorite: (isFavorite) =>
                    context.read<WorkoutListBloc>().add(
                          WorkoutListWorkoutFavoriteToggled(
                            workout: workout,
                            isFavorite: isFavorite,
                          ),
                        ),
                onTap: () {
                  // TODO(Octane): Navigate to WorkoutDetailsPage
                },
              ),
          ],
        );
      },
    );
  }
}
