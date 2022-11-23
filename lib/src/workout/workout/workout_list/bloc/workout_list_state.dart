part of 'workout_list_bloc.dart';

enum WorkoutListStatus {
  initial,
  loadingUser,
  loadedUser,
  loadingPlan,
  loadedPlan,
  noSelectedPlan,
  empty,
  added,
  failure,
}

class WorkoutListState extends Equatable {
  const WorkoutListState({
    this.status = WorkoutListStatus.initial,
    this.currentPlanId,
    this.plan,
    this.newWorkoutId = '',
  });

  final WorkoutListStatus status;
  final String? currentPlanId;
  final Plan? plan;
  final String newWorkoutId;

  @override
  List<Object?> get props => [status, plan, newWorkoutId, currentPlanId];

  WorkoutListState copyWith({
    WorkoutListStatus? status,
    String? Function()? currentPlanId,
    Plan? Function()? plan,
    String? newWorkoutId,
  }) {
    return WorkoutListState(
      status: status ?? this.status,
      plan: plan != null ? plan() : this.plan,
      newWorkoutId: newWorkoutId ?? this.newWorkoutId,
      currentPlanId:
          currentPlanId != null ? currentPlanId() : this.currentPlanId,
    );
  }

  @override
  String toString() {
    final map = {
      'status': status,
      'currentPlanId': currentPlanId,
      'plan': plan?.id,
    };
    return map.toString();
  }
}
