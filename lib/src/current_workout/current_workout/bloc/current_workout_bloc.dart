import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/ticker.dart';
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
        _ticker = const Ticker(),
        super(const CurrentWorkoutState()) {
    on<CurrentWorkoutStartWorkout>(_onStartWorkout);
    on<CurrentWorkoutSubscriptionRequested>(_onSubscriptionRequested);
    on<CurrentWorkoutFinish>(_onFinish);
    on<CurrentWorkoutClear>(_onClear);
    on<CurrentWorkoutTicked>(_onTicked);
  }

  final WorkoutRepository _workoutRepository;
  final WorkoutLogRepository _workoutLogRepository;

  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

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
        if (workoutLog != null) {
          _listenTickerSubscription(startDate: workoutLog.startDate);

          return state.copyWith(
            status: CurrentWorkoutStatus.loaded,
            workoutLog: workoutLog,
          );
        }

        return state.copyWith(
          status: CurrentWorkoutStatus.initial,
        );
      },
      onError: (_, __) => state.copyWith(
        status: CurrentWorkoutStatus.failure,
      ),
    );
  }

  void _listenTickerSubscription({required DateTime startDate}) {
    _tickerSubscription?.cancel();
    final duration = DateTime.now().difference(startDate);
    _tickerSubscription = _ticker
        .tick(time: duration.inSeconds)
        .listen((time) => add(CurrentWorkoutTicked(time: time)));
  }

  Future<void> _onFinish(
    CurrentWorkoutFinish event,
    Emitter<CurrentWorkoutState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWorkoutStatus.updating));

    final workoutLog = state.workoutLog!.copyWith(endDate: DateTime.now());

    await _workoutLogRepository.saveWorkoutLog(workoutLog: workoutLog);

    await _tickerSubscription!.cancel();

    emit(
      state.copyWith(
        status: CurrentWorkoutStatus.finish,
        workoutLog: workoutLog,
      ),
    );
  }

  Future<void> _onClear(
    CurrentWorkoutClear event,
    Emitter<CurrentWorkoutState> emit,
  ) async {
    emit(const CurrentWorkoutState());
  }

  void _onTicked(
    CurrentWorkoutTicked event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    emit(state.copyWith(time: event.time));
  }
}
