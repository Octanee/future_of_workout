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
    this.goal,
  });

  final ExerciseStatsStatus status;
  final Exercise? exercise;
  final List<MapEntry<WorkoutExerciseLog, DateTime>> workoutExerciseLogs;
  final Goal? goal;

  @override
  List<Object?> get props => [status, exercise, workoutExerciseLogs, goal];

  ExerciseStatsState copyWith({
    ExerciseStatsStatus? status,
    Exercise? exercise,
    List<MapEntry<WorkoutExerciseLog, DateTime>>? workoutExerciseLogs,
    Goal? goal,
  }) {
    return ExerciseStatsState(
      status: status ?? this.status,
      exercise: exercise ?? this.exercise,
      workoutExerciseLogs: workoutExerciseLogs ?? this.workoutExerciseLogs,
      goal: goal ?? this.goal,
    );
  }
}
