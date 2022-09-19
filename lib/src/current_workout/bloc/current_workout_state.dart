part of 'current_workout_bloc.dart';

enum CurrentWorkoutStatus {
  loading,
  loaded,
  updating,
  updated,
  finish,
  failure,
}

class CurrentWorkoutState extends Equatable {
  const CurrentWorkoutState({
    this.workout,
    this.status = CurrentWorkoutStatus.loading,
    this.workoutExercises = const {},
  });

  final CurrentWorkoutStatus status;
  final Workout? workout;
  final Map<WorkoutExercise, bool> workoutExercises;

  @override
  List<Object?> get props => [status, workout, workoutExercises];

  CurrentWorkoutState copyWith({
    CurrentWorkoutStatus? status,
    Workout? workout,
    Map<WorkoutExercise, bool>? workoutExercises,
  }) {
    return CurrentWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
      workoutExercises: workoutExercises ?? this.workoutExercises,
    );
  }
}
