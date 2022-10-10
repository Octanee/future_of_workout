import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout.dart';
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
    return BlocConsumer<WorkoutListBloc, WorkoutListState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == WorkoutListStatus.added) {
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
        switch (state.status) {
          case WorkoutListStatus.initial:
          case WorkoutListStatus.loading:
            return const AppScaffold(
              body: AppLoading(),
            );
          case WorkoutListStatus.failure:
            return const AppScaffold(
              body: AppError(),
            );
          case WorkoutListStatus.empty:
            return const AppScaffold(
              floatingActionButton: AddWorkout(),
              body: AppEmptyList(
                text: 'No workout was found..',
                buttonText: 'Add workout',
              ),
            );
          case WorkoutListStatus.loaded:
          case WorkoutListStatus.added:
            return const AppScaffold(
              floatingActionButton: AddWorkout(),
              body: WorkoutList(),
            );
        }
      },
    );
  }
}
