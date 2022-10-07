part of 'current_workout_bloc.dart';

enum CurrentWorkoutStatus {
  initial,
  start,
  started,
  loading,
  loaded,
  updating,
  updated,
  finish,
  failure,
}

class CurrentWorkoutState extends Equatable {
  const CurrentWorkoutState({
    this.status = CurrentWorkoutStatus.initial,
    this.workoutLog,
    this.time = 0,
  });

  final CurrentWorkoutStatus status;
  final WorkoutLog? workoutLog;
  final int time;

  @override
  List<Object?> get props => [status, workoutLog, time];

  CurrentWorkoutState copyWith({
    CurrentWorkoutStatus? status,
    WorkoutLog? workoutLog,
    int? time,
  }) {
    return CurrentWorkoutState(
      status: status ?? this.status,
      workoutLog: workoutLog ?? this.workoutLog,
      time: time ?? this.time,
    );
  }
}
