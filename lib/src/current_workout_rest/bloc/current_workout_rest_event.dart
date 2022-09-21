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

class CurrentWorkoutRestResumed extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestResumed();
}

class CurrentWorkoutRestTicked extends CurrentWorkoutRestEvent {
  const CurrentWorkoutRestTicked({required this.duration});
  final int duration;

  @override
  List<Object> get props => [duration];
}
