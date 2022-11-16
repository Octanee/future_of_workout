part of 'workout_exercise_details_bloc.dart';

abstract class WorkoutExerciseDetailsEvent extends Equatable {
  const WorkoutExerciseDetailsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutExerciseDetailsLoading extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsLoading({
    required this.planId,
    required this.workoutId,
    required this.workoutExerciseId,
  });

  final String planId;
  final String workoutId;
  final String workoutExerciseId;

  @override
  List<Object> get props => [planId, workoutId, workoutExerciseId];
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

class WorkoutExerciseDetailsAllSeriesChanged
    extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsAllSeriesChanged({
    required this.series,
  });

  final ExerciseSeries series;

  @override
  List<Object> get props => [series];
}

class WorkoutExerciseDetailsAddingSeries extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsAddingSeries();
}

class WorkoutExerciseDetailsRemovedSeries extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsRemovedSeries();
}

class WorkoutExerciseDetailsPop extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsPop();
}

class WorkoutExerciseDetailsDeleteWorkoutExercise
    extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsDeleteWorkoutExercise();
}

class WorkoutExerciseDetailsChangeDisplayMode
    extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsChangeDisplayMode();
}

class WorkoutExerciseDetailsReplace extends WorkoutExerciseDetailsEvent {
  const WorkoutExerciseDetailsReplace({required this.exercise});

  final Exercise exercise;

  @override
  List<Object> get props => [exercise];
}
