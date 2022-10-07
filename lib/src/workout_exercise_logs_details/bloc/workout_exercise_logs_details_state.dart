part of 'workout_exercise_logs_details_bloc.dart';

enum WorkoutExerciseLogsDetailsStatus {
  initial,
  loading,
  loaded,
  updated,
  deleting,
  deleted,
  failure,
}

class WorkoutExerciseLogsDetailsState extends Equatable {
  const WorkoutExerciseLogsDetailsState({
    this.status = WorkoutExerciseLogsDetailsStatus.initial,
    this.exerciseLog,
    this.workoutLog,
  });

  final WorkoutExerciseLogsDetailsStatus status;
  final WorkoutExerciseLog? exerciseLog;
  final WorkoutLog? workoutLog;

  @override
  List<Object?> get props => [status, exerciseLog, workoutLog];

  WorkoutExerciseLogsDetailsState copyWith({
    WorkoutExerciseLogsDetailsStatus? status,
    WorkoutExerciseLog? exerciseLog,
    WorkoutLog? workoutLog,
  }) {
    return WorkoutExerciseLogsDetailsState(
      status: status ?? this.status,
      exerciseLog: exerciseLog ?? this.exerciseLog,
      workoutLog: workoutLog ?? this.workoutLog,
    );
  }
}
