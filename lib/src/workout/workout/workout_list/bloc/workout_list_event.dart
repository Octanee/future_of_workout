part of 'workout_list_bloc.dart';

abstract class WorkoutListEvent extends Equatable {
  const WorkoutListEvent();

  @override
  List<Object?> get props => [];
}

class WorkoutListLoadingUser extends WorkoutListEvent {
  const WorkoutListLoadingUser();
}

class WorkoutListLoading extends WorkoutListEvent {
  const WorkoutListLoading();
}

class WorkoutListNewWorkoutAdding extends WorkoutListEvent {
  const WorkoutListNewWorkoutAdding({required this.name});

  final String name;

  @override
  List<Object?> get props => [name];
}
