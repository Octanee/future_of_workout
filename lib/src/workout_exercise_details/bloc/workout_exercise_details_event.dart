part of 'workout_exercise_details_bloc.dart';

abstract class WorkoutExerciseDetailsEvent extends Equatable {
  const WorkoutExerciseDetailsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutExerciseDetailsLoading extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsLoading({
    required this.workoutId,
    required this.workoutExerciseId,
  });

  final String workoutId;
  final String workoutExerciseId;

  @override
  List<Object> get props => [workoutId, workoutExerciseId];
}

class WorkoutExerciseDetailsAllExerciseSeriesChanged
    extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsAllExerciseSeriesChanged({
    required this.series,
  });

  final ExerciseSeries series;

  @override
  List<Object> get props => [series];
}

class WorkoutExerciseDetailsExerciseSeriesChanged
    extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsExerciseSeriesChanged({
    required this.index,
    required this.series,
  });

  final int index;
  final ExerciseSeries series;

  @override
  List<Object> get props => [index, series];
}

class WorkoutExerciseDetailsAddingSeries extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsAddingSeries();
}

class WorkoutExerciseDetailsRemovedSeries extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsRemovedSeries();
}

class WorkoutExerciseDetailsUpdatetingWorkoutRequested
    extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsUpdatetingWorkoutRequested();
}

class WorkoutExerciseDetailsDeleteWorkoutExercise
    extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsDeleteWorkoutExercise();
}

class WorkoutExerciseDetailsChangeDisplayMode
    extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsChangeDisplayMode();
}
