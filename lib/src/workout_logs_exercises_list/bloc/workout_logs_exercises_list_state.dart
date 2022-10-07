part of 'workout_logs_exercises_list_bloc.dart';

enum WorkoutLogsExercisesListStatus {
  initial,
  loadingWorkout,
  loadedWorkout,
  loadingExercises,
  loadedExercises,
  updating,
  updated,
  failure,
}

class WorkoutLogsExercisesListState extends Equatable {
  const WorkoutLogsExercisesListState({
    this.status = WorkoutLogsExercisesListStatus.initial,
    this.exercises = const [],
    this.selected = const {},
    this.workoutLog,
  });

  final WorkoutLogsExercisesListStatus status;
  final List<Exercise> exercises;
  final Map<Exercise, bool> selected;

  final WorkoutLog? workoutLog;

  @override
  List<Object?> get props => [status, exercises, selected, workoutLog];

  WorkoutLogsExercisesListState copyWith({
    WorkoutLogsExercisesListStatus? status,
    List<Exercise>? exercises,
    Map<Exercise, bool>? selected,
    WorkoutLog? workoutLog,
  }) {
    return WorkoutLogsExercisesListState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      selected: selected ?? this.selected,
      workoutLog: workoutLog ?? this.workoutLog,
    );
  }
}
