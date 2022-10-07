import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'workout_exercise_logs_details_event.dart';
part 'workout_exercise_logs_details_state.dart';

class WorkoutExerciseLogsDetailsBloc extends Bloc<
    WorkoutExerciseLogsDetailsEvent, WorkoutExerciseLogsDetailsState> {
  WorkoutExerciseLogsDetailsBloc({
    required WorkoutLogRepository workoutLogRepository,
  })  : _repository = workoutLogRepository,
        super(const WorkoutExerciseLogsDetailsState()) {
    on<WorkoutExerciseLogsDetailsSubscriptionRequest>(_onSubscriptionRequest);
    on<WorkoutExerciseLogsDetailsPop>(_onPop);
    on<WorkoutExerciseLogsDetailsUpdateSeries>(_onUpdateSeries);
    on<WorkoutExerciseLogsDetailsAddSeries>(_onAddSeries);
  }

  final WorkoutLogRepository _repository;

  Future<void> _onSubscriptionRequest(
    WorkoutExerciseLogsDetailsSubscriptionRequest event,
    Emitter<WorkoutExerciseLogsDetailsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutExerciseLogsDetailsStatus.loading));

    final log = _repository.get(id: event.workoutLogId);

    final exerciseLog = log.workoutExerciseLogs
        .firstWhere((element) => element.id == event.workoutExerciseLogId);

    emit(
      state.copyWith(
        status: WorkoutExerciseLogsDetailsStatus.loaded,
        exerciseLog: exerciseLog,
        workoutLog: log,
      ),
    );
  }

  Future<void> _onPop(
    WorkoutExerciseLogsDetailsPop event,
    Emitter<WorkoutExerciseLogsDetailsState> emit,
  ) async {
    if (state.status == WorkoutExerciseLogsDetailsStatus.updated) {
      final workoutLog = state.workoutLog!;

      final exerciseLog = state.exerciseLog!;
      final exerciseIndex = workoutLog.workoutExerciseLogs
          .indexWhere((element) => element.id == exerciseLog.id);
      final logs = List.of(workoutLog.workoutExerciseLogs);
      logs[exerciseIndex] = exerciseLog;

      final log = workoutLog.copyWith(workoutExerciseLogs: logs);

      await _repository.saveWorkoutLog(workoutLog: log);
    }
  }

  void _onUpdateSeries(
    WorkoutExerciseLogsDetailsUpdateSeries event,
    Emitter<WorkoutExerciseLogsDetailsState> emit,
  ) {
    final exerciseLog = state.exerciseLog!;

    final seriesIndex = exerciseLog.exerciseSeriesLogs
        .indexWhere((series) => series.id == event.seriesLog.id);
    final logs = List.of(exerciseLog.exerciseSeriesLogs);
    logs[seriesIndex] = event.seriesLog;

    final complete = !logs.any((log) => !log.isFinished);

    final log =
        exerciseLog.copyWith(exerciseSeriesLogs: logs, isFinished: complete);

    emit(
      state.copyWith(
        status: WorkoutExerciseLogsDetailsStatus.updated,
        exerciseLog: log,
      ),
    );
  }

  void _onAddSeries(
    WorkoutExerciseLogsDetailsAddSeries event,
    Emitter<WorkoutExerciseLogsDetailsState> emit,
  ) {
    final exerciseLog = state.exerciseLog!;

    final logs = List.of(exerciseLog.exerciseSeriesLogs)..add(event.seriesLog);

    final log = exerciseLog.copyWith(exerciseSeriesLogs: logs);

    emit(
      state.copyWith(
        status: WorkoutExerciseLogsDetailsStatus.updated,
        exerciseLog: log,
      ),
    );
  }
}
