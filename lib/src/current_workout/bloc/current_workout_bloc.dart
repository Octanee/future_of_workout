import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_log_repository/workout_log_repository.dart';
import 'package:workout_repository/workout_repository.dart';

part 'current_workout_event.dart';
part 'current_workout_state.dart';

class CurrentWorkoutBloc
    extends Bloc<CurrentWorkoutEvent, CurrentWorkoutState> {
  CurrentWorkoutBloc({
    required WorkoutRepository workoutRepository,
    required WorkoutLogRepository workoutLogRepository,
  })  : _workoutRepository = workoutRepository,
        _workoutLogRepository = workoutLogRepository,
        super(const CurrentWorkoutState()) {
    on<CurrentWorkoutStartWorkout>(_onStartWorkout);
    on<CurrentWorkoutSubscriptionRequested>(_onSubscriptionRequested);
  }

  final WorkoutRepository _workoutRepository;
  final WorkoutLogRepository _workoutLogRepository;

  Future<void> _onStartWorkout(
    CurrentWorkoutStartWorkout event,
    Emitter<CurrentWorkoutState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWorkoutStatus.start));

    WorkoutLog workoutLog;

    if (event.id == null) {
      workoutLog = WorkoutLog();
    } else {
      final workout = _workoutRepository.get(id: event.id!);
      workoutLog = state.workoutLog == null
          ? WorkoutLog.fromWorkout(workout)
          : state.workoutLog!.copyWith(
              workoutExerciseLogs: state.workoutLog!.workoutExerciseLogs +
                  WorkoutLog.fromWorkout(workout).workoutExerciseLogs,
            );
    }

    await _workoutLogRepository.saveWorkoutLog(workoutLog: workoutLog);
    emit(state.copyWith(status: CurrentWorkoutStatus.started));
  }

  Future<void> _onSubscriptionRequested(
    CurrentWorkoutSubscriptionRequested event,
    Emitter<CurrentWorkoutState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWorkoutStatus.loading));

    await emit.forEach<WorkoutLog?>(
      _workoutLogRepository.getCurrentWorkout(),
      onData: (workoutLog) {
        return state.copyWith(
          status: CurrentWorkoutStatus.loaded,
          workoutLog: workoutLog,
        );
      },
      onError: (_, __) => state.copyWith(
        status: CurrentWorkoutStatus.failure,
      ),
    );
  }
}
