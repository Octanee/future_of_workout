import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'workout_logs_details_event.dart';
part 'workout_logs_details_state.dart';

class WorkoutLogsDetailsBloc
    extends Bloc<WorkoutLogsDetailsEvent, WorkoutLogsDetailsState> {
  WorkoutLogsDetailsBloc({required WorkoutLogRepository workoutLogRepository})
      : _repository = workoutLogRepository,
        super(const WorkoutLogsDetailsState()) {
    on<WorkoutLogsDetailsSubscriptionRequest>(_onSubscriptionRequest);
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
      onError: (_, __) =>
          state.copyWith(status: WorkoutLogsDetailsStatus.failure),
    );
  }
}
