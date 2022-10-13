part of 'workout_goals_bloc.dart';

enum WorkoutGoalsStatus {
  initial,
  loading,
  loaded,
  empty,
  add,
  failure,
}

class WorkoutGoalsState extends Equatable {
  const WorkoutGoalsState({
    this.status = WorkoutGoalsStatus.initial,
    this.goals = const [],
    this.exercise,
  });

  final WorkoutGoalsStatus status;
  final List<Goal> goals;
  final Exercise? exercise;

  @override
  List<Object?> get props => [status, goals, exercise];

  WorkoutGoalsState copyWith({
    WorkoutGoalsStatus? status,
    List<Goal>? goals,
    Exercise? exercise,
  }) {
    return WorkoutGoalsState(
      status: status ?? this.status,
      goals: goals ?? this.goals,
      exercise: exercise ?? this.exercise,
    );
  }
}
