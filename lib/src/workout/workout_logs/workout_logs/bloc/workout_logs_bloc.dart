import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'workout_logs_event.dart';
part 'workout_logs_state.dart';

class WorkoutLogsBloc extends Bloc<WorkoutLogsEvent, WorkoutLogsState> {
  WorkoutLogsBloc({required WorkoutLogRepository workoutLogRepository})
      : _repository = workoutLogRepository,
        super(const WorkoutLogsState()) {
    on<WorkoutLogsLoadingRequest>(_onLoadingRequest);
  }

  final WorkoutLogRepository _repository;

  Future<void> _onLoadingRequest(
    WorkoutLogsLoadingRequest event,
    Emitter<WorkoutLogsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutLogsStatus.loading));

    await emit.forEach<List<WorkoutLog>>(
      _repository.getWorkoutLogs(),
      onData: (logs) {
        if (logs.isEmpty) {
          return state.copyWith(status: WorkoutLogsStatus.empty);
        }
        logs.sort(
          (a, b) => b.startDate.compareTo(a.startDate),
        );
        return state.copyWith(status: WorkoutLogsStatus.loaded, logs: logs);
      },
      onError: (_, __) => state.copyWith(status: WorkoutLogsStatus.failure),
    );
  }
}
