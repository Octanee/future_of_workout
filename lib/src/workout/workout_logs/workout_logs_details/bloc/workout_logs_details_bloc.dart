import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'workout_logs_details_event.dart';
part 'workout_logs_details_state.dart';

class WorkoutLogsDetailsBloc
    extends Bloc<WorkoutLogsDetailsEvent, WorkoutLogsDetailsState> {
  WorkoutLogsDetailsBloc({required WorkoutLogRepository workoutLogRepository})
      : _repository = workoutLogRepository,
        super(const WorkoutLogsDetailsState()) {
    on<WorkoutLogsDetailsSubscriptionRequest>(_onSubscriptionRequest);
    on<WorkoutLogsDetailsDelete>(_onDelete);
    on<WorkoutLogsDetailsAddExercises>(_onAddExercises);
  }

  final WorkoutLogRepository _repository;

  Future<void> _onSubscriptionRequest(
    WorkoutLogsDetailsSubscriptionRequest event,
    Emitter<WorkoutLogsDetailsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutLogsDetailsStatus.loading));

    await emit.forEach<WorkoutLog?>(
      _repository.getWorkout(id: event.id),
      onData: (log) {
        return state.copyWith(
          status: WorkoutLogsDetailsStatus.loaded,
          workoutLog: log,
        );
      },
      onError: (_, __) => state.copyWith(
        status: WorkoutLogsDetailsStatus.failure,
      ),
    );
  }

  Future<void> _onDelete(
    WorkoutLogsDetailsDelete event,
    Emitter<WorkoutLogsDetailsState> emit,
  ) async {
    try {
      await _repository.deleteWorkoutLog(id: state.workoutLog!.id);
      emit(state.copyWith(status: WorkoutLogsDetailsStatus.deleted));
    } catch (e) {
      emit(state.copyWith(status: WorkoutLogsDetailsStatus.failure));
    }
  }

  Future<void> _onAddExercises(
    WorkoutLogsDetailsAddExercises event,
    Emitter<WorkoutLogsDetailsState> emit,
  ) async {
    final exercisesLogs = List.of(state.workoutLog!.workoutExerciseLogs);

    for (final exercise in event.exercises) {
      final item = WorkoutExerciseLog.fromWorkoutExercise(
        WorkoutExercise(exercise: exercise, index: exercisesLogs.length),
      );
      exercisesLogs.add(item);
    }

    final log = state.workoutLog!.copyWith(workoutExerciseLogs: exercisesLogs);
    await _repository.saveWorkoutLog(workoutLog: log);

    emit(
      state.copyWith(
        status: WorkoutLogsDetailsStatus.updated,
        workoutLog: log,
      ),
    );
  }
}
