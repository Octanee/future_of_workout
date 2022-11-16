part of 'current_workout_bloc.dart';

abstract class CurrentWorkoutEvent extends Equatable {
  const CurrentWorkoutEvent();

  @override
  List<Object?> get props => [];
}

class CurrentWorkoutStartWorkout extends CurrentWorkoutEvent {
  const CurrentWorkoutStartWorkout({this.id, this.workoutId});

  final String? id;
  final String? workoutId;

  @override
  List<Object?> get props => [id, workoutId];
}

class CurrentWorkoutSubscriptionRequested extends CurrentWorkoutEvent {
  const CurrentWorkoutSubscriptionRequested();
}

class CurrentWorkoutFinish extends CurrentWorkoutEvent {
  const CurrentWorkoutFinish();
}

class CurrentWorkoutClear extends CurrentWorkoutEvent {
  const CurrentWorkoutClear();
}

class CurrentWorkoutTicked extends CurrentWorkoutEvent {
  const CurrentWorkoutTicked({required this.time});

  final int time;

  @override
  List<Object?> get props => [time];
}

class CurrentWorkoutAdd extends CurrentWorkoutEvent {
  const CurrentWorkoutAdd({required this.exercises});

  final List<Exercise> exercises;

  @override
  List<Object?> get props => exercises;
}

class CurrentWorkoutRestStarted extends CurrentWorkoutEvent {
  const CurrentWorkoutRestStarted({
    required this.restDuration,
    required this.workoutExerciseId,
  });

  final int restDuration;
  final String workoutExerciseId;

  @override
  List<Object> get props => [restDuration, workoutExerciseId];
}

class CurrentWorkoutRestStop extends CurrentWorkoutEvent {
  const CurrentWorkoutRestStop();
}

class CurrentWorkoutRestAdd extends CurrentWorkoutEvent {
  const CurrentWorkoutRestAdd({required this.value});

  final int value;

  @override
  List<Object?> get props => [value];
}

class CurrentWorkoutRestSubtract extends CurrentWorkoutEvent {
  const CurrentWorkoutRestSubtract({required this.value});

  final int value;

  @override
  List<Object?> get props => [value];
}

class CurrentWorkoutRestTicked extends CurrentWorkoutEvent {
  const CurrentWorkoutRestTicked({required this.restDuration});
  final int restDuration;

  @override
  List<Object> get props => [restDuration];
}

class CurrentWorkoutReorder extends CurrentWorkoutEvent {
  const CurrentWorkoutReorder({required this.oldIndex, required this.newIndex});

  final int oldIndex;
  final int newIndex;

  @override
  List<Object?> get props => [oldIndex, newIndex];
}
