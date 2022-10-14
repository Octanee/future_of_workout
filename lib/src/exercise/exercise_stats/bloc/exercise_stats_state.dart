part of 'exercise_stats_bloc.dart';

enum ExerciseStatsStatus {
  initial,
  loading,
  loaded,
  failure,
}

class ExerciseStatsState extends Equatable {
  const ExerciseStatsState({
    this.status = ExerciseStatsStatus.initial,
    this.workoutExerciseLogs = const [],
    this.exercise,
    this.period = Period.oneMounth,
    this.chartType = ChartType.weight,
    this.goal,
  });

  final ExerciseStatsStatus status;
  final Exercise? exercise;
  final List<MapEntry<WorkoutExerciseLog, DateTime>> workoutExerciseLogs;
  final Goal? goal;
  final Period period;
  final ChartType chartType;

  List<MapEntry<WorkoutExerciseLog, DateTime>> get data {
    return workoutExerciseLogs.where((element) {
      final difference = DateTime.now().difference(element.value).inDays;

      return difference <= period.days;
    }).toList();
  }

  @override
  List<Object?> get props => [
        status,
        exercise,
        workoutExerciseLogs,
        goal,
        period,
        chartType,
      ];

  ExerciseStatsState copyWith({
    ExerciseStatsStatus? status,
    Exercise? exercise,
    List<MapEntry<WorkoutExerciseLog, DateTime>>? workoutExerciseLogs,
    Goal? goal,
    Period? period,
    ChartType? chartType,
  }) {
    return ExerciseStatsState(
      status: status ?? this.status,
      exercise: exercise ?? this.exercise,
      workoutExerciseLogs: workoutExerciseLogs ?? this.workoutExerciseLogs,
      goal: goal ?? this.goal,
      period: period ?? this.period,
      chartType: chartType ?? this.chartType,
    );
  }
}
