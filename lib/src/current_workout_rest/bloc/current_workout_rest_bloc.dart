import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/current_workout_rest/current_workout_rest.dart';
import 'package:future_of_workout/src/ticker.dart';

part 'current_workout_rest_event.dart';
part 'current_workout_rest_state.dart';

class CurrentWorkoutRestBloc
    extends Bloc<CurrentWorkoutRestEvent, CurrentWorkoutRestState> {
  CurrentWorkoutRestBloc({required Ticker ticker, required int duration})
      : _ticker = ticker,
        super(CurrentWorkoutRestState(duration: duration)) {
    on<CurrentWorkoutRestStarted>(_onStarted);
    on<CurrentWorkoutRestPaused>(_onPaused);
    on<CurrentWorkoutRestResumed>(_onResumed);
    on<CurrentWorkoutRestStop>(_onStop);
    on<CurrentWorkoutRestTicked>(_onTicked);
    on<CurrentWorkoutRestAdd>(_onAdd);
    on<CurrentWorkoutRestSubtract>(_onSubtract);
  }

  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStarted(
    CurrentWorkoutRestStarted event,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    emit(state.copyWith(duration: event.duration));

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.countdown(time: event.duration).listen(
          (duration) => add(CurrentWorkoutRestTicked(duration: duration)),
        );
  }

  void _onPaused(
    CurrentWorkoutRestPaused event,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    if (state.status == CurrentWorkoutRestStatus.runInProgress) {
      _tickerSubscription?.pause();
      emit(
        state.copyWith(
          status: CurrentWorkoutRestStatus.runPause,
          duration: state.duration,
        ),
      );
    }
  }

  void _onResumed(
    CurrentWorkoutRestResumed resume,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    if (state.status == CurrentWorkoutRestStatus.runPause) {
      _tickerSubscription?.resume();
      emit(
        state.copyWith(
          status: CurrentWorkoutRestStatus.runInProgress,
          duration: state.duration,
        ),
      );
    }
  }

  void _onStop(
    CurrentWorkoutRestStop event,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    emit(state.copyWith(status: CurrentWorkoutRestStatus.complete));
  }

  void _onTicked(
    CurrentWorkoutRestTicked event,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    emit(
      event.duration > 0
          ? state.copyWith(
              status: CurrentWorkoutRestStatus.runInProgress,
              duration: event.duration,
            )
          : state.copyWith(status: CurrentWorkoutRestStatus.complete),
    );
  }

  void _onAdd(
    CurrentWorkoutRestAdd event,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    add(CurrentWorkoutRestStarted(duration: state.duration + 15));
  }

  void _onSubtract(
    CurrentWorkoutRestSubtract event,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    add(CurrentWorkoutRestStarted(duration: state.duration - 15));
  }
}
