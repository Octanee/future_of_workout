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

class ExerciseStatsGoalChange extends ExerciseStatsEvent {
  const ExerciseStatsGoalChange({required this.value});

  final double value;

  @override
  List<Object> get props => [value];
}

class ExerciseStatsGoalDelete extends ExerciseStatsEvent {
  const ExerciseStatsGoalDelete();
}

class ExerciseStatsPeriodChange extends ExerciseStatsEvent {
  const ExerciseStatsPeriodChange({required this.period});

  final Period period;

  @override
  List<Object> get props => [period];
}

class ExerciseStatsChartTypeChange extends ExerciseStatsEvent {
  const ExerciseStatsChartTypeChange({required this.chartType});

  final ChartType chartType;

  @override
  List<Object> get props => [chartType];
}
