part of 'workout_logs_bloc.dart';

enum WorkoutLogsStatus {
  initial,
  loading,
  loaded,
  failure,
}

class WorkoutLogsState extends Equatable {
  const WorkoutLogsState({
    this.status = WorkoutLogsStatus.initial,
    this.logs = const [],
  });

  final WorkoutLogsStatus status;
  final List<WorkoutLog> logs;

  @override
  List<Object> get props => [status, logs];

  WorkoutLogsState copyWith({
    WorkoutLogsStatus? status,
    List<WorkoutLog>? logs,
  }) {
    return WorkoutLogsState(
      status: status ?? this.status,
      logs: logs ?? this.logs,
    );
  }
}
