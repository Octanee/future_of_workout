import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/styles.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:future_of_workout/src/workout/workout.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class WorkoutLogsExercisesListPage extends StatelessWidget {
  const WorkoutLogsExercisesListPage({required this.workoutLogId, super.key});

  static String name = 'workout-logs-exercises-list';
  static String path = name;

  final String workoutLogId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutLogsExercisesListBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
        exerciseRepository: context.read<ExerciseRepository>(),
      )
        ..add(
          WorkoutLogsExercisesListLoadingWorkout(workoutLogId: workoutLogId),
        )
        ..add(const WorkoutLogsExercisesListSubscriptionRequested()),
      child: const WorkoutLogsExercisesListView(),
    );
  }
}

class WorkoutLogsExercisesListView extends StatelessWidget {
  const WorkoutLogsExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutLogsExercisesListBloc,
        WorkoutLogsExercisesListState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == WorkoutLogsExercisesListStatus.updated) {
          context.pop();
        }
      },
      buildWhen: (previous, current) =>
          previous.exercises != current.exercises ||
          previous.selected != current.selected,
      builder: (context, state) {
        if (state.exercises.isEmpty) {
          if (state.status == WorkoutLogsExercisesListStatus.loadingExercises) {
            return const AppScaffold(body: AppLoading());
          }
          return AppScaffold(
            body: Center(
              child: Text(
                'Empty list',
                style: AppTextStyle.semiBold20,
              ),
            ),
          );
        }

        return AppScaffold(
          title: 'Exercises',
          floatingActionButton: const AddFab(),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            physics: const BouncingScrollPhysics(),
            children: [
              for (final exercise in state.exercises)
                ExerciseItem(
                  onIconPressed: () {
                    // TODO(Octane): Navigate to exercise details
                  },
                  exercise: exercise,
                  isSelected: state.selected[exercise] ?? false,
                  onTap: () => context.read<WorkoutLogsExercisesListBloc>().add(
                        WorkoutLogsExercisesListExerciseSelectionToggle(
                          exercise: exercise,
                        ),
                      ),
                ),
            ],
          ),
        );
      },
    );
  }
}
