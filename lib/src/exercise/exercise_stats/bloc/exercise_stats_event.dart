part of 'exercise_stats_bloc.dart';

abstract class ExerciseStatsEvent extends Equatable {
  const ExerciseStatsEvent();

  @override
  List<Object> get props => [];
}

class ExerciseStatsLoadExercise extends ExerciseStatsEvent {
  const ExerciseStatsLoadExercise({required this.exerciseId});

  final String exerciseId;

  @override
  List<Object> get props => [exerciseId];
}

class ExerciseStatsLoadGoal extends ExerciseStatsEvent {
  const ExerciseStatsLoadGoal({required this.exerciseId});

  final String exerciseId;

  @override
  List<Object> get props => [exerciseId];
}

class ExerciseStatsLoadWorkoutLogs extends ExerciseStatsEvent {
  const ExerciseStatsLoadWorkoutLogs({required this.exerciseId});

  final String exerciseId;

  @override
  List<Object> get props => [exerciseId];
}

class ExerciseStatsPop extends ExerciseStatsEvent {
  const ExerciseStatsPop();
}
