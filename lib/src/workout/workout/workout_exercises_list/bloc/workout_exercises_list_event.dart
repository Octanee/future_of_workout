part of 'workout_exercises_list_bloc.dart';

abstract class WorkoutExercisesListEvent extends Equatable {
  const WorkoutExercisesListEvent();

  @override
  List<Object> get props => [];
}

class WorkoutExerciseListLoadingWorkout extends WorkoutExercisesListEvent {
  const WorkoutExerciseListLoadingWorkout({required this.workoutId});

  final String workoutId;

  @override
  List<Object> get props => [workoutId];
}

class WorkoutExercisesListSubscriptionRequested
    extends WorkoutExercisesListEvent {
  const WorkoutExercisesListSubscriptionRequested();
}

class WorkoutExercisesListExerciseSelectionToggle
    extends WorkoutExercisesListEvent {
  const WorkoutExercisesListExerciseSelectionToggle({
    required this.exercise,
  });

  final Exercise exercise;

  @override
  List<Object> get props => [exercise];
}

class WorkoutExercisesListAddingToWorkout extends WorkoutExercisesListEvent {
  const WorkoutExercisesListAddingToWorkout();
}
