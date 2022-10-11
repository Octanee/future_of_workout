import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
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
    return BlocConsumer<CurrentWorkoutExerciseBloc,
        CurrentWorkoutExerciseState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == CurrentWorkoutExerciseStatus.delete) {
          context.pop();
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case CurrentWorkoutExerciseStatus.initial:
          case CurrentWorkoutExerciseStatus.loading:
            return const AppScaffold(body: AppLoading());
          case CurrentWorkoutExerciseStatus.failure:
            return const AppScaffold(body: AppError());
          case CurrentWorkoutExerciseStatus.loaded:
          case CurrentWorkoutExerciseStatus.updating:
          case CurrentWorkoutExerciseStatus.updated:
          case CurrentWorkoutExerciseStatus.delete:
            final exerciseLog = state.workoutExerciseLog!;
            return AppScaffold(
              title: exerciseLog.exercise.name,
              floatingActionButton: const FinishedFab(),
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                children: const [
                  SeriesList(),
                  AddSeries(),
                  RemoveSeries(),
                  AboutExercise(),
                  ReplaceExercise(),
                  DeleteExercise(),
                ],
              ),
            );
        }
      },
    );
  }
}
