import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/logger.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'current_workout_exercise_event.dart';
part 'current_workout_exercise_state.dart';

class CurrentWorkoutExerciseBloc
    extends Bloc<CurrentWorkoutExerciseEvent, CurrentWorkoutExerciseState> {
  CurrentWorkoutExerciseBloc({
    required WorkoutLogRepository workoutLogRepository,
  })  : _workoutLogRepository = workoutLogRepository,
        super(const CurrentWorkoutExerciseState()) {
    on<CurrentWorkoutExerciseSubscriptionRequested>(_onSubscriptionRequested);
    on<CurrentWorkoutExerciseAddSeries>(_onAddSeries);
    on<CurrentWorkoutExerciseRemoveSeries>(_onRemoveSeries);
    on<CurrentWorkoutExerciseUpdateSeries>(_onUpdateSeries);
  }

  final WorkoutLogRepository _workoutLogRepository;

  Future<void> _onSubscriptionRequested(
    CurrentWorkoutExerciseSubscriptionRequested event,
    Emitter<CurrentWorkoutExerciseState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWorkoutExerciseStatus.loading));

    await emit.forEach<WorkoutLog?>(
      _workoutLogRepository.getCurrentWorkout(),
      onData: (workoutLog) {
        final workoutExerciseLog = workoutLog!.workoutExerciseLogs
            .firstWhere((log) => log.id == event.id);

        return state.copyWith(
          status: CurrentWorkoutExerciseStatus.loaded,
          workoutLog: workoutLog,
          workoutExerciseLog: workoutExerciseLog,
        );
      },
      onError: (_, __) => state.copyWith(
        status: CurrentWorkoutExerciseStatus.failure,
      ),
    );
  }

  Future<void> _onUpdateSeries(
    CurrentWorkoutExerciseUpdateSeries event,
    Emitter<CurrentWorkoutExerciseState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWorkoutExerciseStatus.updating));

    final index = state.workoutExerciseLog!.exerciseSeriesLogs
        .indexWhere((series) => series.id == event.series.id);

    final seriesLogs = List.of(state.workoutExerciseLog!.exerciseSeriesLogs);
    seriesLogs[index] = event.series;

    final complete = !seriesLogs.any((log) => !log.isFinished);

    final exerciseLog = state.workoutExerciseLog!
        .copyWith(exerciseSeriesLogs: seriesLogs, isFinished: complete);

    final exerciseIndex = state.workoutLog!.workoutExerciseLogs
        .indexWhere((log) => log.id == exerciseLog.id);

    final exerciseLogs = List.of(state.workoutLog!.workoutExerciseLogs);
    exerciseLogs[exerciseIndex] = exerciseLog;

    final log = state.workoutLog!.copyWith(workoutExerciseLogs: exerciseLogs);

    await _workoutLogRepository.saveWorkoutLog(workoutLog: log);

    emit(
      state.copyWith(
        status: CurrentWorkoutExerciseStatus.updated,
        workoutLog: log,
      ),
    );
  }

  Future<void> _onAddSeries(
    CurrentWorkoutExerciseAddSeries event,
    Emitter<CurrentWorkoutExerciseState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWorkoutExerciseStatus.updating));
    final list = List.of(state.workoutExerciseLog!.exerciseSeriesLogs);

    ExerciseSeriesLog last;

    try {
      last = list.last;
    } catch (_) {
      last = ExerciseSeriesLog.fromExerciseSeries(ExerciseSeries(index: 0));
    }

    list.add(
      ExerciseSeriesLog(
        index: last.index + 1,
        weight: last.weight,
        reps: last.reps,
        rest: last.rest,
        intensity: last.intensity,
      ),
    );

    final exerciseLog = state.workoutExerciseLog!
        .copyWith(exerciseSeriesLogs: list, isFinished: false);

    final exerciseIndex = state.workoutLog!.workoutExerciseLogs
        .indexWhere((log) => log.id == exerciseLog.id);

    final exerciseLogs = List.of(state.workoutLog!.workoutExerciseLogs);
    exerciseLogs[exerciseIndex] = exerciseLog;

    final log = state.workoutLog!.copyWith(workoutExerciseLogs: exerciseLogs);

    await _workoutLogRepository.saveWorkoutLog(workoutLog: log);

    emit(
      state.copyWith(
        status: CurrentWorkoutExerciseStatus.updated,
        workoutLog: log,
      ),
    );
  }

  Future<void> _onRemoveSeries(
    CurrentWorkoutExerciseRemoveSeries event,
    Emitter<CurrentWorkoutExerciseState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWorkoutExerciseStatus.updating));

    final list = List.of(state.workoutExerciseLog!.exerciseSeriesLogs)
      ..removeLast();

    final isFinished = !list.any((series) => series.isFinished == false);

    final exerciseLog = state.workoutExerciseLog!
        .copyWith(exerciseSeriesLogs: list, isFinished: isFinished);

    final exerciseIndex = state.workoutLog!.workoutExerciseLogs
        .indexWhere((log) => log.id == exerciseLog.id);

    final exerciseLogs = List.of(state.workoutLog!.workoutExerciseLogs);
    exerciseLogs[exerciseIndex] = exerciseLog;

    final log = state.workoutLog!.copyWith(workoutExerciseLogs: exerciseLogs);

    await _workoutLogRepository.saveWorkoutLog(workoutLog: log);

    emit(
      state.copyWith(
        status: CurrentWorkoutExerciseStatus.updated,
        workoutLog: log,
      ),
    );
  }
}
