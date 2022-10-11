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

class CurrentWorkoutExerciseUpdateSeries extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseUpdateSeries({
    required this.series,
  });

  final ExerciseSeriesLog series;

  @override
  List<Object> get props => [series];
}

class CurrentWorkoutExerciseAddSeries extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseAddSeries();
}

class CurrentWorkoutExerciseRemoveSeries extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseRemoveSeries();
}

class CurrentWorkoutExerciseComplete extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseComplete();
}
