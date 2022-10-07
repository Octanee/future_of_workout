part of 'workout_logs_bloc.dart';

abstract class WorkoutLogsEvent extends Equatable {
  const WorkoutLogsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutLogsLoadingRequest extends WorkoutLogsEvent{
  const WorkoutLogsLoadingRequest();
}
