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
    this.exercises = const [],
    this.currentWorkoutExercise,
    this.startDate,
  });

  final CurrentWorkoutStatus status;
  final Workout? workout;
  final List<CurrentWorkoutExercise> exercises;
  final CurrentWorkoutExercise? currentWorkoutExercise;
  final DateTime? startDate;

  @override
  List<Object?> get props => [
        status,
        workout,
        exercises,
        currentWorkoutExercise,
        startDate,
      ];

  CurrentWorkoutState copyWith({
    CurrentWorkoutStatus? status,
    Workout? workout,
    List<CurrentWorkoutExercise>? exercises,
    CurrentWorkoutExercise? currentWorkoutExercise,
    DateTime? startDate,
  }) {
    return CurrentWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
      exercises: exercises ?? this.exercises,
      currentWorkoutExercise:
          currentWorkoutExercise ?? this.currentWorkoutExercise,
      startDate: startDate ?? this.startDate,
    );
  }
}
