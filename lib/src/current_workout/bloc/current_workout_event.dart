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

class CurrentWorkoutWorkoutExerciseSeriesFinished extends CurrentWorkoutEvent {
  const CurrentWorkoutWorkoutExerciseSeriesFinished({
    required this.workoutExercise,
    required this.index,
  });

  final WorkoutExercise workoutExercise;
  final int index;

  @override
  List<Object> get props => [workoutExercise, index];
}

class CurrentWorkoutFinishWorkout extends CurrentWorkoutEvent {
  const CurrentWorkoutFinishWorkout();
}
