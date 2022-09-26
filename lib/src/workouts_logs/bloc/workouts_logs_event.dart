part of 'workouts_logs_bloc.dart';

abstract class WorkoutsLogsEvent extends Equatable {
  const WorkoutsLogsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutsLogsLoadingRequest extends WorkoutsLogsEvent{
  const WorkoutsLogsLoadingRequest();
}
