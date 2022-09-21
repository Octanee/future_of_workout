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
    this.exerciseSeries = const [],
    this.completedExerciseSeries = const [],
  });

  final CurrentWorkoutExerciseStatus status;
  final WorkoutExercise? workoutExercise;
  final List<ExerciseSeries> exerciseSeries;
  final List<ExerciseSeries> completedExerciseSeries;
  final Workout? workout;

  @override
  List<Object?> get props => [status, workoutExercise, workout, exerciseSeries];

  CurrentWorkoutExerciseState copyWith({
    CurrentWorkoutExerciseStatus? status,
    WorkoutExercise? workoutExercise,
    List<ExerciseSeries>? exerciseSeries,
    List<ExerciseSeries>? completedExerciseSeries,
    Workout? workout,
  }) {
    return CurrentWorkoutExerciseState(
      status: status ?? this.status,
      workoutExercise: workoutExercise ?? this.workoutExercise,
      exerciseSeries: exerciseSeries ?? this.exerciseSeries,
      completedExerciseSeries:
          completedExerciseSeries ?? this.completedExerciseSeries,
      workout: workout ?? this.workout,
    );
  }
}
