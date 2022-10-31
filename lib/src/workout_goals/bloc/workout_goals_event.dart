part of 'workout_goals_bloc.dart';

abstract class WorkoutGoalsEvent extends Equatable {
  const WorkoutGoalsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutGoalsSubscriptionRequested extends WorkoutGoalsEvent {
  const WorkoutGoalsSubscriptionRequested();
}

class WorkoutGoalsAdd extends WorkoutGoalsEvent {
  const WorkoutGoalsAdd({required this.exercise, required this.goal});
  
  final Exercise exercise;
  final double goal;

  @override
  List<Object> get props => [goal, exercise];
}
