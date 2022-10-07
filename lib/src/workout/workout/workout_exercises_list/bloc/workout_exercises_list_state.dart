part of 'workout_exercises_list_bloc.dart';

enum WorkoutExercisesListStatus {
  initial,
  loadingWorkout,
  loadedWorkout,
  loadingExercises,
  loadedExercises,
  updating,
  updated,
  failure,
}

class WorkoutExercisesListState extends Equatable {
  const WorkoutExercisesListState({
    this.status = WorkoutExercisesListStatus.initial,
    this.exercises = const [],
    this.selected = const {},
    this.workout,
  });

  final WorkoutExercisesListStatus status;
  final List<Exercise> exercises;
  final Map<Exercise, bool> selected;

  final Workout? workout;

  @override
  List<Object?> get props => [status, exercises, selected, workout];

  WorkoutExercisesListState copyWith({
    WorkoutExercisesListStatus? status,
    List<Exercise>? exercises,
    Map<Exercise, bool>? selected,
    Workout? workout,
  }) {
    return WorkoutExercisesListState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      selected: selected ?? this.selected,
      workout: workout ?? this.workout,
    );
  }
}
