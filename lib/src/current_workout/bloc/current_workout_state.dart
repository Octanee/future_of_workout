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
    this.time = 0,
  });

  final CurrentWorkoutStatus status;
  final Workout? workout;
  final List<CurrentWorkoutExercise> exercises;
  final CurrentWorkoutExercise? currentWorkoutExercise;
  final int time;

  @override
  List<Object?> get props => [
        status,
        workout,
        exercises,
        currentWorkoutExercise,
        time,
      ];

  CurrentWorkoutState copyWith({
    CurrentWorkoutStatus? status,
    Workout? workout,
    List<CurrentWorkoutExercise>? exercises,
    CurrentWorkoutExercise? currentWorkoutExercise,
    int? time,
  }) {
    return CurrentWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
      exercises: exercises ?? this.exercises,
      currentWorkoutExercise:
          currentWorkoutExercise ?? this.currentWorkoutExercise,
      time: time ?? this.time,
    );
  }
}
