part of 'workout_details_bloc.dart';

abstract class WorkoutDetailsState extends Equatable {
  const WorkoutDetailsState();
  
  @override
  List<Object> get props => [];
}

class WorkoutDetailsInitial extends WorkoutDetailsState {}
