part of 'workout_logs_details_bloc.dart';

enum WorkoutLogsDetailsStatus {
  initial,
  loading,
  loaded,
  failure,
}

class WorkoutLogsDetailsState extends Equatable {
  const WorkoutLogsDetailsState({
    this.workoutLog,
    this.status = WorkoutLogsDetailsStatus.initial,
  });

  final WorkoutLogsDetailsStatus status;
  final WorkoutLog? workoutLog;

  @override
  List<Object?> get props => [status, workoutLog];

  WorkoutLogsDetailsState copyWith({
    WorkoutLogsDetailsStatus? status,
    WorkoutLog? workoutLog,
  }) {
    return WorkoutLogsDetailsState(
      status: status ?? this.status,
      workoutLog: workoutLog ?? this.workoutLog,
    );
  }
}
