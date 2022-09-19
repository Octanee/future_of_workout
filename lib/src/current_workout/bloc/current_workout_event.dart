part of 'current_workout_bloc.dart';

abstract class CurrentWorkoutEvent extends Equatable {
  const CurrentWorkoutEvent();

  @override
  List<Object> get props => [];
}

class CurrentWorkoutLoadingWorkout extends CurrentWorkoutEvent {
  const CurrentWorkoutLoadingWorkout({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class CurrentWorkoutWorkoutExerciseFinished extends CurrentWorkoutEvent {
  const CurrentWorkoutWorkoutExerciseFinished({required this.workoutExercise});

  final WorkoutExercise workoutExercise;

  @override
  List<Object> get props => [workoutExercise];
}

class CurrentWorkoutFinishWorkout extends CurrentWorkoutEvent {
  const CurrentWorkoutFinishWorkout();
}
