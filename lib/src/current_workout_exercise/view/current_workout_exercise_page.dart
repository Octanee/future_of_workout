import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/current_workout_exercise/current_workout_exercise.dart';
import 'package:future_of_workout/src/current_workout_rest/current_workout_rest.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class CurrentWorkoutExercisePage extends StatelessWidget {
  const CurrentWorkoutExercisePage({
    super.key,
  });

  static String name = 'current-workout-exercise';
  static String path = name;

  @override
  Widget build(BuildContext context) {
    return const CurrentWorkoutExerciseView();
  }
}

class CurrentWorkoutExerciseView extends StatelessWidget {
  const CurrentWorkoutExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentExercise = context.select(
      (CurrentWorkoutBloc bloc) => bloc.state.currentWorkoutExercise,
    )!;

    return AppScaffold(
      title: currentExercise.exercise.name,
      floatingActionButton: currentExercise.isFinished
          ? FloatingActionButton(
              onPressed: () {
                context.pop();
              },
              child: const Icon(Icons.navigate_next_rounded),
            )
          : null,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          ...currentExercise.series.map<Widget>((series) {
            var todo = false;
            try {
              final firstTodo = currentExercise.series.firstWhere(
                (s) => s.isFinished == false,
              );
              todo = series == firstTodo;
            } catch (_) {}

            return CurrentWorkoutSeriesItem(
              series: series,
              onTap: todo || series.isFinished
                  ? () async {
                      final bloc = context.read<CurrentWorkoutBloc>();
                      await showDialog<void>(
                        context: context,
                        builder: (builderContext) => SeriesDialog(
                          weight: series.weight.toString(),
                          reps: series.reps.toString(),
                          onConfirm: (reps, weight) {
                            bloc.add(
                              CurrentWorkoutSeriesFinished(
                                series: series.copyWith(
                                  weight: weight,
                                  reps: reps,
                                ),
                              ),
                            );
                            if (!series.isFinished) {
                              context.goNamed(
                                CurrentWorkoutRestPage.name,
                                params: {
                                  'time': series.rest.toString(),
                                  'workoutId': bloc.state.workout!.id
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
  }
}