part of 'current_workout_bloc.dart';

abstract class CurrentWorkoutEvent extends Equatable {
  const CurrentWorkoutEvent();

  @override
  List<Object?> get props => [];
}

class CurrentWorkoutStartWorkout extends CurrentWorkoutEvent {
  const CurrentWorkoutStartWorkout({this.id});

  final String? id;

  @override
  List<Object?> get props => [id];
}

class CurrentWorkoutSubscriptionRequested extends CurrentWorkoutEvent {
  const CurrentWorkoutSubscriptionRequested();
}

class CurrentWorkoutFinish extends CurrentWorkoutEvent {
  const CurrentWorkoutFinish();
}

class CurrentWorkoutClear extends CurrentWorkoutEvent {
  const CurrentWorkoutClear();
}

class CurrentWorkoutTicked extends CurrentWorkoutEvent {
  const CurrentWorkoutTicked({required this.time});

  final int time;

  @override
  List<Object?> get props => [time];
}
