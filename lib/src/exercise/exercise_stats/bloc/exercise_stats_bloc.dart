import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_repository/exercise_repository.dart';
import 'package:goal_repository/goal_repository.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'exercise_stats_event.dart';
part 'exercise_stats_state.dart';

class ExerciseStatsBloc extends Bloc<ExerciseStatsEvent, ExerciseStatsState> {
  ExerciseStatsBloc({
    required ExerciseRepository exerciseRepository,
    required WorkoutLogRepository workoutLogRepository,
    required GoalRepository goalRepository,
  })  : _exerciseRepository = exerciseRepository,
        _workoutLogRepository = workoutLogRepository,
        _goalRepository = goalRepository,
        super(const ExerciseStatsState()) {
    on<ExerciseStatsLoadExercise>(_onLoadExercise);
    on<ExerciseStatsLoadWorkoutLogs>(_onLoadWorkoutLogs);
    on<ExerciseStatsLoadGoal>(_onLoadGoal);
    on<ExerciseStatsPop>(_onPop);
  }

  final ExerciseRepository _exerciseRepository;
  final WorkoutLogRepository _workoutLogRepository;
  final GoalRepository _goalRepository;

  Future<void> _onLoadExercise(
    ExerciseStatsLoadExercise event,
    Emitter<ExerciseStatsState> emit,
  ) async {
    try {
      emit(state.copyWith(status: ExerciseStatsStatus.loading));

      final id = event.exerciseId;
      final exercise = _exerciseRepository.get(id: id);

      emit(
        state.copyWith(
          status: ExerciseStatsStatus.loaded,
          exercise: exercise,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ExerciseStatsStatus.failure));
    }
  }

  Future<void> _onLoadWorkoutLogs(
    ExerciseStatsLoadWorkoutLogs event,
    Emitter<ExerciseStatsState> emit,
  ) async {
    final id = event.exerciseId;

    await emit.forEach<List<WorkoutLog>>(
      _workoutLogRepository.getWorkoutLogs(),
      onData: (data) {
        final list = <WorkoutExerciseLog, DateTime>{};
        for (final workoutLog in data) {
          for (final exerciseLog in workoutLog.workoutExerciseLogs) {
            if (exerciseLog.exercise.id == id) {
              if (exerciseLog.exerciseSeriesLogs
                  .any((series) => series.isFinished)) {
                list.putIfAbsent(exerciseLog, () => workoutLog.startDate);
              }
            }
          }
        }

        final sorted = list.entries.toList()
          ..sort(
            (a, b) => b.value.compareTo(a.value),
          );

        return state.copyWith(
          status: ExerciseStatsStatus.loaded,
          workoutExerciseLogs: sorted,
        );
      },
      onError: (_, __) => state.copyWith(status: ExerciseStatsStatus.failure),
    );
  }

  Future<void> _onLoadGoal(
    ExerciseStatsLoadGoal event,
    Emitter<ExerciseStatsState> emit,
  ) async {
    final id = event.exerciseId;

    await emit.forEach<List<Goal>>(
      _goalRepository.getGoals(),
      onData: (data) {
        final goal =
            data.firstWhereOrNull((element) => element.exercise.id == id);

        return state.copyWith(
          status: ExerciseStatsStatus.loaded,
          goal: goal,
        );
      },
      onError: (_, __) => state.copyWith(status: ExerciseStatsStatus.failure),
    );
  }

  Future<void> _onPop(
    ExerciseStatsPop event,
    Emitter<ExerciseStatsState> emit,
  ) async {
    // TODO(Octane): Save all changes
  }
}
