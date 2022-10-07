import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/styles/app_text_style.dart';
import 'package:future_of_workout/src/widgets/app_loading.dart';
import 'package:future_of_workout/src/widgets/app_scaffold.dart';
import 'package:future_of_workout/src/workout_details/view/workout_details_page.dart';
import 'package:future_of_workout/src/workout_exercises_list/workout_exercises_list.dart';
import 'package:future_of_workout/src/workout_logs_exercises_list/workout_logs_exercises_list.dart';
import 'package:future_of_workout/src/workouts/workouts.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_repository/workout_repository.dart';

class WorkoutLogsExercisesListPage extends StatelessWidget {
  const WorkoutLogsExercisesListPage({required this.workoutId, super.key});

  static String name = 'workout-exercises-list';
  static String path = name;

  final String workoutId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutExercisesListBloc(
        workoutRepository: context.read<WorkoutRepository>(),
        exerciseRepository: context.read<ExerciseRepository>(),
      )
        ..add(WorkoutExerciseListLoadingWorkout(workoutId: workoutId))
        ..add(const WorkoutExercisesListSubscriptionRequested()),
      child: const WorkoutLogsExercisesListView(),
    );
  }
}

class WorkoutLogsExercisesListView extends StatelessWidget {
  const WorkoutLogsExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Exercises',
      floatingActionButton: const AddFab(),
      body: BlocConsumer<WorkoutExercisesListBloc, WorkoutExercisesListState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == WorkoutExercisesListStatus.updated) {
            context.goNamed(
              WorkoutDetailsPage.name,
              params: {
                'homePageTab': WorkoutsPage.name,
                'workoutId': state.workout!.id,
              },
            );
          }
        },
        builder: (context, state) {
          if (state.exercises.isEmpty) {
            if (state.status == WorkoutExercisesListStatus.loadingExercises) {
              return const AppLoading();
            } else if (state.status ==
                WorkoutExercisesListStatus.loadedExercises) {
              return Center(
                child: Text(
                  'Empty list',
                  style: AppTextStyle.semiBold20,
                ),
              );
            }
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            physics: const BouncingScrollPhysics(),
            children: [
              for (final exercise in state.exercises)
                ExerciseItem(
                  onIconPressed: () {},
                  exercise: exercise,
                  isSelected: state.selected[exercise] ?? false,
                  onTap: () => context.read<WorkoutExercisesListBloc>().add(
                        WorkoutExercisesListExerciseSelectionToggle(
                          exercise: exercise,
                        ),
                      ),
                ),
            ],
          );
        },
      ),
    );
  }
}
