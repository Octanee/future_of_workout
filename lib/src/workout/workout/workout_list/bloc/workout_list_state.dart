part of 'workout_list_bloc.dart';

enum WorkoutListStatus {
  initial,
  loading,
  loaded,
  noSelectedPlan,
  empty,
  added,
  failure,
}

class WorkoutListState extends Equatable {
  const WorkoutListState({
    this.status = WorkoutListStatus.initial,
    this.plan,
    this.newWorkoutId = '',
  });

  final WorkoutListStatus status;
  final Plan? plan;
  final String newWorkoutId;

  @override
  List<Object?> get props => [status, plan, newWorkoutId];

  WorkoutListState copyWith({
    WorkoutListStatus? status,
    Plan? plan,
    String? newWorkoutId,
  }) {
    return WorkoutListState(
      status: status ?? this.status,
      plan: plan ?? this.plan,
      newWorkoutId: newWorkoutId ?? this.newWorkoutId,
    );
  }
}
