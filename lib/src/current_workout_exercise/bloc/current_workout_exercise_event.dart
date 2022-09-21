part of 'current_workout_exercise_bloc.dart';

abstract class CurrentWorkoutExerciseEvent extends Equatable {
  const CurrentWorkoutExerciseEvent();

  @override
  List<Object> get props => [];
}

class CurrentWorkoutExerciseLoading extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseLoading({
    required this.workoutId,
    required this.workoutExerciseId,
  });

  final String workoutId;
  final String workoutExerciseId;

  @override
  List<Object> get props => [workoutId, workoutExerciseId];
}

class CurrentWorkoutExerciseCompleteSeries extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseCompleteSeries({
    required this.series,
    required this.weight,
    required this.reps,
  });

  final ExerciseSeries series;
  final double weight;
  final int reps;

  @override
  List<Object> get props => [series, weight, reps];
}

class CurrentWorkoutExerciseWorkoutExerciseComplete
    extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseWorkoutExerciseComplete();
}

class CurrentWorkoutExerciseAddSeries extends CurrentWorkoutExerciseEvent {
  const CurrentWorkoutExerciseAddSeries();
}
