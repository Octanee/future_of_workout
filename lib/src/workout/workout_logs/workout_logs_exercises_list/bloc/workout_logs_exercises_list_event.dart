part of 'workout_logs_exercises_list_bloc.dart';

abstract class WorkoutLogsExercisesListEvent extends Equatable {
  const WorkoutLogsExercisesListEvent();

  @override
  List<Object> get props => [];
}

class WorkoutLogsExercisesListLoadingWorkout
    extends WorkoutLogsExercisesListEvent {
  const WorkoutLogsExercisesListLoadingWorkout({required this.workoutLogId});

  final String workoutLogId;

  @override
  List<Object> get props => [workoutLogId];
}

class WorkoutLogsExercisesListSubscriptionRequested
    extends WorkoutLogsExercisesListEvent {
  const WorkoutLogsExercisesListSubscriptionRequested();
}

class WorkoutLogsExercisesListExerciseSelectionToggle
    extends WorkoutLogsExercisesListEvent {
  const WorkoutLogsExercisesListExerciseSelectionToggle({
    required this.exercise,
  });

  final Exercise exercise;

  @override
  List<Object> get props => [exercise];
}

class WorkoutLogsExercisesListAddingToWorkout
    extends WorkoutLogsExercisesListEvent {
  const WorkoutLogsExercisesListAddingToWorkout();
}
