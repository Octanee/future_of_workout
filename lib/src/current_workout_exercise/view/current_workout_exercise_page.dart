import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/current_workout_exercise/bloc/current_workout_exercise_bloc.dart';
import 'package:future_of_workout/src/current_workout_exercise/current_workout_exercise.dart';
import 'package:future_of_workout/src/current_workout_rest/current_workout_rest.dart';
import 'package:future_of_workout/src/exercise_details/exercise_details.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class CurrentWorkoutExercisePage extends StatelessWidget {
  const CurrentWorkoutExercisePage({
    required this.currentWorkoutExerciseId,
    super.key,
  });

  static String name = 'current-workout-exercise';
  static String path = '$name/:currentWorkoutExerciseId';

  final String currentWorkoutExerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentWorkoutExerciseBloc(
        workoutLogRepository: context.read<WorkoutLogRepository>(),
      )..add(
          CurrentWorkoutExerciseSubscriptionRequested(
            id: currentWorkoutExerciseId,
          ),
        ),
      child: const CurrentWorkoutExerciseView(),
    );
  }
}

class CurrentWorkoutExerciseView extends StatelessWidget {
  const CurrentWorkoutExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentWorkoutExerciseBloc, CurrentWorkoutExerciseState>(
      builder: (context, state) {
        if (state.status == CurrentWorkoutExerciseStatus.loading) {
          return _buildLoading();
        }
        final workoutExerciseLog = state.workoutExerciseLog!;
        return AppScaffold(
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(
                  ExerciseDetailsPage.name,
                  params: {'exerciseId': workoutExerciseLog.exercise.id},
                );
              },
              icon: const Icon(Icons.info_outline),
            ),
          ],
          floatingActionButton: workoutExerciseLog.isFinished
              ? FloatingActionButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Icon(Icons.navigate_next_rounded),
                )
              : null,
          title: workoutExerciseLog.exercise.name,
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              ...workoutExerciseLog.exerciseSeriesLogs.map<Widget>((series) {
                var todo = false;
                try {
                  final firstTodo =
                      workoutExerciseLog.exerciseSeriesLogs.firstWhere(
                    (s) => s.isFinished == false,
                  );
                  todo = series == firstTodo;
                } catch (_) {}

                return ExerciseSeriesLogItem(
                  series: series,
                  onTap: todo || series.isFinished
                      ? () async {
                          final bloc =
                              context.read<CurrentWorkoutExerciseBloc>();
                          await showDialog<void>(
                            context: context,
                            builder: (builderContext) => SeriesLogDialog(
                              weight: series.weight.toString(),
                              reps: series.reps.toString(),
                              onConfirm: (reps, weight) {
                                bloc.add(
                                  CurrentWorkoutExerciseSeriesComplete(
                                    series: series.copyWith(
                                      weight: weight,
                                      reps: reps,
                                      isFinished: true,
                                    ),
                                  ),
                                );
                                if (!series.isFinished) {
                                  context.goNamed(
                                    CurrentWorkoutRestPage.name,
                                    params: {
                                      'homePageTab': CurrentWorkoutPage.name,
                                      'currentWorkoutExerciseId': series.id,
                                      'time': series.rest.toString(),
                                    },
                                  );
                                }
                              },
                            ),
                          );
                        }
                      : null,
                );
              }),
              AddSeriesButton(
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoading() {
    return const AppScaffold(
      body: AppLoading(),
    );
  }
}
