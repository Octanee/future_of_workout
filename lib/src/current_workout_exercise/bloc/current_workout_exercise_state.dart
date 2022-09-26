part of 'current_workout_exercise_bloc.dart';

enum CurrentWorkoutExerciseStatus {
  loading,
  loaded,
  updating,
  updated,
  failure,
}

class CurrentWorkoutExerciseState extends Equatable {
  const CurrentWorkoutExerciseState({
    this.status = CurrentWorkoutExerciseStatus.loading,
    this.workoutExerciseLog,
    this.workoutLog,
  });

  final CurrentWorkoutExerciseStatus status;
  final WorkoutExerciseLog? workoutExerciseLog;
  final WorkoutLog? workoutLog;

  @override
  List<Object?> get props => [status, workoutExerciseLog, workoutLog];

  CurrentWorkoutExerciseState copyWith({
    CurrentWorkoutExerciseStatus? status,
    WorkoutExerciseLog? workoutExerciseLog,
    WorkoutLog? workoutLog,
  }) {
    return CurrentWorkoutExerciseState(
      status: status ?? this.status,
      workoutExerciseLog: workoutExerciseLog ?? this.workoutExerciseLog,
      workoutLog: workoutLog ?? this.workoutLog,
    );
  }
}
