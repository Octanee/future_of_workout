import 'package:exercise_repository/exercise_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';
import 'package:future_of_workout/src/widgets/widgets.dart';
import 'package:goal_repository/goal_repository.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

class ExerciseStatsPage extends StatelessWidget {
  const ExerciseStatsPage({required this.exerciseId, super.key});

  final String exerciseId;

  static String name = '/exercise-stats';
  static String path = '$name/:exerciseId';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseStatsBloc(
        exerciseRepository: context.read<ExerciseRepository>(),
        workoutLogRepository: context.read<WorkoutLogRepository>(),
        goalRepository: context.read<GoalRepository>(),
      )
        ..add(ExerciseStatsLoadExercise(exerciseId: exerciseId))
        ..add(ExerciseStatsLoadWorkoutLogs(exerciseId: exerciseId))
        ..add(ExerciseStatsLoadGoal(exerciseId: exerciseId)),
      child: const ExerciseStatsView(),
    );
  }
}

class ExerciseStatsView extends StatelessWidget {
  const ExerciseStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExerciseStatsBloc, ExerciseStatsState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        switch (state.status) {
          case ExerciseStatsStatus.initial:
          case ExerciseStatsStatus.loading:
            return const AppScaffold(body: AppLoading());
          case ExerciseStatsStatus.failure:
            return const AppScaffold(body: AppError());
          case ExerciseStatsStatus.loaded:
            final exercise = state.exercise;
            return AppScaffold(
              title: exercise?.name ?? 'Exercise',
              body: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                physics: const BouncingScrollPhysics(),
                children: const [
                  AboutExercise(),
                  AddGoal(),
                  GoalCard(),
                  DataList(),
                ],
              ),
            );
        }
      },
    );
  }
}
