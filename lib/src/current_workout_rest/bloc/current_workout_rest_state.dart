part of 'current_workout_rest_bloc.dart';

enum CurrentWorkoutRestStatus {
  initial,
  runPause,
  runInProgress,
  complete,
}

class CurrentWorkoutRestState extends Equatable {
  const CurrentWorkoutRestState({
    required this.duration,
    this.status = CurrentWorkoutRestStatus.initial,
  });

  final CurrentWorkoutRestStatus status;
  final int duration;

  @override
  List<Object> get props => [status, duration];

  CurrentWorkoutRestState copyWith({
    CurrentWorkoutRestStatus? status,
    int? duration,
  }) {
    return CurrentWorkoutRestState(
      status: status ?? this.status,
      duration: duration ?? this.duration,
    );
  }
}
