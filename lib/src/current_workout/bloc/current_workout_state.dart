part of 'current_workout_bloc.dart';

abstract class CurrentWorkoutState extends Equatable {
  const CurrentWorkoutState();
  
  @override
  List<Object> get props => [];
}

class CurrentWorkoutInitial extends CurrentWorkoutState {}
