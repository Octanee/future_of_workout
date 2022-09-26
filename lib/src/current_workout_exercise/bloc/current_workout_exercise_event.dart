part of 'current_workout_exercise_bloc.dart';

abstract class CurrentWorkoutExerciseEvent extends Equatable {
  const CurrentWorkoutExerciseEvent();

  @override
  List<Object> get props => [];
}

class CurrentWorkoutExerciseSubscriptionRequested
    extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseSubscriptionRequested({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

class CurrentWorkoutExerciseSeriesComplete extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseSeriesComplete({
    required this.series,
  });

  final ExerciseSeriesLog series;

  @override
  List<Object> get props => [series];
}

class CurrentWorkoutExerciseComplete extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseComplete();
}
