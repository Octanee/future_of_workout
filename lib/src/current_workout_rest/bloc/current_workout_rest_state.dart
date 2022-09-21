part of 'current_workout_rest_bloc.dart';

abstract class CurrentWorkoutRestState extends Equatable {
  const CurrentWorkoutRestState({required this.duration});

  final int duration;

  @override
  List<Object> get props => [duration];
}

class CurrentWorkoutRestInitial extends CurrentWorkoutRestState {
  const CurrentWorkoutRestInitial({required super.duration});

  @override
  String toString() => 'CurrentWorkoutRestInitial { duration: $duration }';
}

class CurrentWorkoutRestRunPause extends CurrentWorkoutRestState {
  const CurrentWorkoutRestRunPause({required super.duration});

  @override
  String toString() => 'CurrentWorkoutRestRunPause { duration: $duration }';
}

class CurrentWorkoutRestRunInProgress extends CurrentWorkoutRestState {
  const CurrentWorkoutRestRunInProgress({required super.duration});

  @override
  String toString() =>
      'CurrentWorkoutRestRunInProgress { duration: $duration }';
}

class CurrentWorkoutRestRunComplete extends CurrentWorkoutRestState {
  const CurrentWorkoutRestRunComplete() : super(duration: 0);

  @override
  String toString() => 'CurrentWorkoutRestRunComplete';
}
