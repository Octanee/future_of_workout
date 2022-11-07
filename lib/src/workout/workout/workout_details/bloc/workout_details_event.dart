part of 'workout_details_bloc.dart';

abstract class WorkoutDetailsEvent extends Equatable {
  const WorkoutDetailsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutDetailsWorkoutSubscriptionRequested extends WorkoutDetailsEvent {
  const WorkoutDetailsWorkoutSubscriptionRequested({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class WorkoutDetailsRenameWorkout extends WorkoutDetailsEvent {
  const WorkoutDetailsRenameWorkout({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class WorkoutDetailsFavoritToggled extends WorkoutDetailsEvent {
  const WorkoutDetailsFavoritToggled();
}

class WorkoutDetailsDelete extends WorkoutDetailsEvent {
  const WorkoutDetailsDelete();
}

class WorkoutDetailsAddExercises extends WorkoutDetailsEvent {
  const WorkoutDetailsAddExercises({required this.exercises});

  final List<Exercise> exercises;

  @override
  List<Object> get props => [exercises];
}

class WorkoutDetailsReorder extends WorkoutDetailsEvent {
  const WorkoutDetailsReorder({required this.oldIndex, required this.newIndex});

  final int oldIndex;
  final int newIndex;

  @override
  List<Object> get props => [oldIndex, newIndex];
}
