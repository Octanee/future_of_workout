part of 'workouts_logs_bloc.dart';

abstract class WorkoutsLogsState extends Equatable {
  const WorkoutsLogsState();
  
  @override
  List<Object> get props => [];
}

class WorkoutsLogsInitial extends WorkoutsLogsState {}
