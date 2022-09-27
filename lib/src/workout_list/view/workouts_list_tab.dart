import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/app_loading.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout_details/workout_details.dart';
import 'package:future_of_workout/src/workout_list/workout_list.dart';
import 'package:future_of_workout/src/workouts/workouts.dart';
import 'package:go_router/go_router.dart';
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final bloc = context.read<WorkoutListBloc>();

          await showDialog<String>(
            context: context,
            builder: (context) => NewWorkoutDialog(
              onConfirm: (value) =>
                  bloc.add(WorkoutListNewWorkoutAdding(name: value)),
            ),
          );
        },
      ),
      body: BlocConsumer<WorkoutListBloc, WorkoutListState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == WorkoutListStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Workout list error')),
              );
          } else if (state.status == WorkoutListStatus.added) {
            context.goNamed(
              WorkoutDetailsPage.name,
              params: {
                'homePageTab': WorkoutsPage.name,
                'workoutId': state.newWorkoutId,
              },
            );
          }
        },
        builder: (context, state) {
          if (state.workouts.isEmpty) {
            return _buildEmptyListWidgets(state.status);
          }

          return _buildListView(workouts: state.workouts, context: context);
        },
      ),
    );
  }

  Widget _buildListView({
    required List<Workout> workouts,
    required BuildContext context,
  }) {
    return GridView(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.5,
      ),
      children: [
        for (final workout in workouts)
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
              context.goNamed(
                WorkoutDetailsPage.name,
                params: {
                  'homePageTab': WorkoutsPage.name,
                  'workoutId': workout.id,
                },
              );
            },
          ),
      ],
    );
  }

  Widget _buildEmptyListWidgets(WorkoutListStatus status) {
    if (status == WorkoutListStatus.loading) {
      return const AppLoading();
    } else if (status != WorkoutListStatus.loaded) {
      return const SizedBox();
    } else {
      return const Center(
        child: Text('List of workouts is empty.'),
      );
    }
  }
}
