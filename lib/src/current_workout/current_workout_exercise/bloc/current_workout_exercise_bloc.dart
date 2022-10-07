import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
    on<CurrentWorkoutExerciseSeriesComplete>(_onSeriesComplete);
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

  Future<void> _onSeriesComplete(
    CurrentWorkoutExerciseSeriesComplete event,
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

    emit(state.copyWith(status: CurrentWorkoutExerciseStatus.updated));
  }
}
