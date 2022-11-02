part of 'current_workout_bloc.dart';

enum CurrentWorkoutStatus {
  initial,
  start,
  started,
  loading,
  loaded,
  rest,
  restComplete,
  finish,
  failure,
}

class CurrentWorkoutState extends Equatable {
  const CurrentWorkoutState({
    this.status = CurrentWorkoutStatus.initial,
    this.workoutLog,
    this.workoutExerciseId,
    this.time = 0,
    this.restDuration,
  });

  final CurrentWorkoutStatus status;
  final WorkoutLog? workoutLog;
  final String? workoutExerciseId;
  final int time;
  final int? restDuration;

  @override
  List<Object?> get props => [status, workoutLog, time, restDuration];

  CurrentWorkoutState copyWith({
    CurrentWorkoutStatus? status,
    WorkoutLog? workoutLog,
    String? workoutExerciseId,
    int? time,
    int? Function()? restDuration,
  }) {
    return CurrentWorkoutState(
      status: status ?? this.status,
      workoutLog: workoutLog ?? this.workoutLog,
      workoutExerciseId: workoutExerciseId ?? this.workoutExerciseId,
      time: time ?? this.time,
      restDuration: restDuration != null ? restDuration() : this.restDuration,
    );
  }

  @override
  String toString() {
    final map = {
      'status': status,
      // 'workoutLog': workoutLog,
      'time': time,
      'restDuration': restDuration,
    };
    return map.toString();
  }
}
