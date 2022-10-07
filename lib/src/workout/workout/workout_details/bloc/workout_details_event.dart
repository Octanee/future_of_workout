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

class WorkoutDetailsWorkoutExerciseAdded extends WorkoutDetailsEvent {
  const WorkoutDetailsWorkoutExerciseAdded({required this.workoutExercise});

  final WorkoutExercise workoutExercise;

  @override
  List<Object> get props => [workoutExercise];
}

class WorkoutDetailsWorkoutExerciseEdited extends WorkoutDetailsEvent {
  const WorkoutDetailsWorkoutExerciseEdited({required this.workoutExercise});

  final WorkoutExercise workoutExercise;

  @override
  List<Object> get props => [workoutExercise];
}

class WorkoutDetailsWorkoutExerciseRemoved extends WorkoutDetailsEvent {
  const WorkoutDetailsWorkoutExerciseRemoved({required this.workoutExercise});

  final WorkoutExercise workoutExercise;

  @override
  List<Object> get props => [workoutExercise];
}
