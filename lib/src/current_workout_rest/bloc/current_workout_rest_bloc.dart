import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/current_workout_rest/current_workout_rest.dart';

part 'current_workout_rest_event.dart';
part 'current_workout_rest_state.dart';

class CurrentWorkoutRestBloc
    extends Bloc<CurrentWorkoutRestEvent, CurrentWorkoutRestState> {
  CurrentWorkoutRestBloc({required Ticker ticker, required int duration})
      : _ticker = ticker,
        super(CurrentWorkoutRestInitial(duration: duration)) {
    on<CurrentWorkoutRestStarted>(_onStarted);
    on<CurrentWorkoutRestPaused>(_onPaused);
    on<CurrentWorkoutRestResumed>(_onResumed);
    on<CurrentWorkoutRestTicked>(_onTicked);
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
    emit(CurrentWorkoutRestRunInProgress(duration: event.duration));

    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker.tick(ticks: event.duration).listen(
          (duration) => add(CurrentWorkoutRestTicked(duration: duration)),
        );
  }

  void _onPaused(
    CurrentWorkoutRestPaused event,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    if (state is CurrentWorkoutRestRunInProgress) {
      _tickerSubscription?.pause();
      emit(CurrentWorkoutRestRunPause(duration: state.duration));
    }
  }

  void _onResumed(
    CurrentWorkoutRestResumed resume,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    if (state is CurrentWorkoutRestRunPause) {
      _tickerSubscription?.resume();
      emit(CurrentWorkoutRestRunInProgress(duration: state.duration));
    }
  }

  void _onTicked(
    CurrentWorkoutRestTicked event,
    Emitter<CurrentWorkoutRestState> emit,
  ) {
    emit(
      event.duration > 0
          ? CurrentWorkoutRestRunInProgress(duration: event.duration)
          : const CurrentWorkoutRestRunComplete(),
    );
  }
}
