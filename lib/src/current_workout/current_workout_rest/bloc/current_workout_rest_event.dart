part of 'current_workout_rest_bloc.dart';

abstract class CurrentWorkoutRestEvent extends Equatable {
  const CurrentWorkoutRestEvent();

  @override
  List<Object> get props => [];
}

class CurrentWorkoutRestStarted extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestStarted({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}

class CurrentWorkoutRestPaused extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestPaused();
}

class CurrentWorkoutRestStop extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestStop();
}

class CurrentWorkoutRestResumed extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestResumed();
}

class CurrentWorkoutRestAdd extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestAdd();
}

class CurrentWorkoutRestSubtract extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestSubtract();
}

class CurrentWorkoutRestTicked extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestTicked({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}
