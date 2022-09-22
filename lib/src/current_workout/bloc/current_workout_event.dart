part of 'current_workout_bloc.dart';

abstract class CurrentWorkoutEvent extends Equatable {
  const CurrentWorkoutEvent();

  @override
  List<Object?> get props => [];
}

class CurrentWorkoutLoadingWorkout extends CurrentWorkoutEvent {
  const CurrentWorkoutLoadingWorkout({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class CurrentWorkoutChangeExercise extends CurrentWorkoutEvent {
  const CurrentWorkoutChangeExercise({
    this.exercise,
  });
  final CurrentWorkoutExercise? exercise;

  @override
  List<Object?> get props => [exercise];
}

class CurrentWorkoutSeriesFinished extends CurrentWorkoutEvent {
  const CurrentWorkoutSeriesFinished({required this.series});

  final CurrentWorkoutSeries series;

  @override
  List<Object> get props => [series];
}

class CurrentWorkoutTicked extends CurrentWorkoutEvent {
  const CurrentWorkoutTicked({required this.time});

  final int time;

  @override
  List<Object?> get props => [time];
}
