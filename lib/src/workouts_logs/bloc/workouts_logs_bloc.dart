import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'workouts_logs_event.dart';
part 'workouts_logs_state.dart';

class WorkoutsLogsBloc extends Bloc<WorkoutsLogsEvent, WorkoutsLogsState> {
  WorkoutsLogsBloc({required WorkoutLogRepository workoutLogRepository})
      : _repository = workoutLogRepository,
        super(const WorkoutsLogsState()) {
    on<WorkoutsLogsLoadingRequest>(_onLoadingRequest);
  }

  final WorkoutLogRepository _repository;

  Future<void> _onLoadingRequest(
    WorkoutsLogsLoadingRequest event,
    Emitter<WorkoutsLogsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutsLogsStatus.loading));

    await emit.forEach<List<WorkoutLog>>(
      _repository.getWorkoutLogs(),
      onData: (logs) {
        logs.sort(
          (a, b) => b.startDate.compareTo(a.startDate),
        );
        return state.copyWith(status: WorkoutsLogsStatus.loaded, logs: logs);
      },
      onError: (_, __) => state.copyWith(status: WorkoutsLogsStatus.failure),
    );
  }
}
