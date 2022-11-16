import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/shared/shared.dart';
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
    on<CurrentWorkoutAdd>(_onAdd);
    on<CurrentWorkoutRestStarted>(_onRestStarted);
    on<CurrentWorkoutRestStop>(_onRestStop);
    on<CurrentWorkoutRestTicked>(_onRestTicked);
    on<CurrentWorkoutRestAdd>(_onRestAdd);
    on<CurrentWorkoutRestSubtract>(_onRestSubtract);
    on<CurrentWorkoutReorder>(_onReorder);
  }

  final WorkoutRepository _workoutRepository;
  final WorkoutLogRepository _workoutLogRepository;

  final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;
  StreamSubscription<int>? _restTickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    _restTickerSubscription?.cancel();
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
      final plan = _workoutRepository.getPlan(id: event.id!);

      final workout =
          plan.workouts.firstWhere((element) => element.id == event.workoutId);

      workoutLog = state.workoutLog == null
          ? WorkoutLog.fromWorkout(workout)
          : state.workoutLog!.copyWith(
              workoutExerciseLogs: state.workoutLog!.workoutExerciseLogs +
                  WorkoutLog.fromWorkout(workout).workoutExerciseLogs,
            );
    }

    await _workoutLogRepository.saveWorkoutLog(workoutLog: workoutLog);
    emit(state.copyWith(status: CurrentWorkoutStatus.started));
    add(const CurrentWorkoutSubscriptionRequested());
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
    _tickerSubscription = _ticker.tick(time: duration.inSeconds).listen((time) {
      add(CurrentWorkoutTicked(time: time));
    });
  }

  Future<void> _onFinish(
    CurrentWorkoutFinish event,
    Emitter<CurrentWorkoutState> emit,
  ) async {
    final workoutLog = state.workoutLog!.copyWith(endDate: DateTime.now());

    if (workoutLog.workoutExerciseLogs.any(
      (exercise) =>
          exercise.exerciseSeriesLogs.any((series) => series.isFinished),
    )) {
      await _workoutLogRepository.saveWorkoutLog(workoutLog: workoutLog);
    } else {
      await _workoutLogRepository.deleteWorkoutLog(id: workoutLog.id);
    }

    await _tickerSubscription?.cancel();
    await _restTickerSubscription?.cancel();

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

  Future<void> _onAdd(
    CurrentWorkoutAdd event,
    Emitter<CurrentWorkoutState> emit,
  ) async {
    final log = state.workoutLog!;

    final exercises = List.of(log.workoutExerciseLogs);

    for (final exercise in event.exercises) {
      final item = WorkoutExerciseLog.fromWorkoutExercise(
        WorkoutExercise(
          index: exercises.length,
          exercise: exercise,
        ),
      );
      exercises.add(item);
    }

    final workout = log.copyWith(workoutExerciseLogs: exercises);

    await _workoutLogRepository.saveWorkoutLog(workoutLog: workout);

    emit(state.copyWith(workoutLog: workout));
  }

  void _onRestStarted(
    CurrentWorkoutRestStarted event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    emit(
      state.copyWith(
        status: CurrentWorkoutStatus.rest,
        restDuration: () => event.restDuration,
        workoutExerciseId: event.workoutExerciseId,
      ),
    );

    _restTickerSubscription?.cancel();
    _restTickerSubscription =
        _ticker.countdown(time: event.restDuration).listen((duration) {
      add(CurrentWorkoutRestTicked(restDuration: duration));
    });
  }

  FutureOr<void> _onRestStop(
    CurrentWorkoutRestStop event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    _restTickerSubscription?.cancel();
    emit(
      state.copyWith(
        restDuration: () => null,
        status: CurrentWorkoutStatus.restComplete,
      ),
    );
  }

  void _onRestTicked(
    CurrentWorkoutRestTicked event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    emit(
      event.restDuration > 0
          ? state.copyWith(restDuration: () => event.restDuration)
          : state.copyWith(
              restDuration: () => null,
              status: CurrentWorkoutStatus.restComplete,
            ),
    );
  }

  FutureOr<void> _onRestAdd(
    CurrentWorkoutRestAdd event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    add(
      CurrentWorkoutRestStarted(
        restDuration: state.restDuration! + 15,
        workoutExerciseId: state.workoutExerciseId!,
      ),
    );
  }

  FutureOr<void> _onRestSubtract(
    CurrentWorkoutRestSubtract event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    final duration = (state.restDuration! - 15).clamp(1, 999);
    add(
      CurrentWorkoutRestStarted(
        restDuration: duration,
        workoutExerciseId: state.workoutExerciseId!,
      ),
    );
  }

  Future<void> _onReorder(
    CurrentWorkoutReorder event,
    Emitter<CurrentWorkoutState> emit,
  ) async {
    final log = state.workoutLog!;
    final list = List.of(log.workoutExerciseLogs);

    final exercise = list.removeAt(event.oldIndex);
    final index =
        event.newIndex > event.oldIndex ? event.newIndex - 1 : event.newIndex;

    list.insert(index, exercise);

    final workout = log.copyWith(workoutExerciseLogs: list);
    await _workoutLogRepository.saveWorkoutLog(workoutLog: workout);
    emit(state.copyWith(workoutLog: workout));
  }
}
