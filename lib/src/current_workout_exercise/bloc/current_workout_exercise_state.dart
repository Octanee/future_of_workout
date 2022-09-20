part of 'current_workout_exercise_bloc.dart';

enum CurrentWorkoutExerciseStatus {
  loading,
  loaded,
  updating,
  updated,
  complated,
  failure,
}

class CurrentWorkoutExerciseState extends Equatable {
  const CurrentWorkoutExerciseState({
    this.status = CurrentWorkoutExerciseStatus.loading,
    this.workout,
    this.workoutExercise,
    this.exerciseSeries = const {},
  });

  final CurrentWorkoutExerciseStatus status;
  final WorkoutExercise? workoutExercise;
  final Map<ExerciseSeries, bool> exerciseSeries;
  final Workout? workout;

  @override
  List<Object?> get props => [status, workoutExercise, workout, exerciseSeries];

  CurrentWorkoutExerciseState copyWith({
    CurrentWorkoutExerciseStatus? status,
    WorkoutExercise? workoutExercise,
    Map<ExerciseSeries, bool>? exerciseSeries,
    Workout? workout,
  }) {
    return CurrentWorkoutExerciseState(
      status: status ?? this.status,
      workoutExercise: workoutExercise ?? this.workoutExercise,
      exerciseSeries: exerciseSeries ?? this.exerciseSeries,
      workout: workout ?? this.workout,
    );
  }
}
