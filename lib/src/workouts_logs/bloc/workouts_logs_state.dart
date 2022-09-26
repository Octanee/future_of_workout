part of 'workouts_logs_bloc.dart';

enum WorkoutsLogsStatus {
  initial,
  loading,
  loaded,
  failure,
}

class WorkoutsLogsState extends Equatable {
  const WorkoutsLogsState({
    this.status = WorkoutsLogsStatus.initial,
    this.logs = const [],
  });

  final WorkoutsLogsStatus status;
  final List<WorkoutLog> logs;

  @override
  List<Object> get props => [status, logs];

  WorkoutsLogsState copyWith({
    WorkoutsLogsStatus? status,
    List<WorkoutLog>? logs,
  }) {
    return WorkoutsLogsState(
      status: status ?? this.status,
      logs: logs ?? this.logs,
    );
  }
}
