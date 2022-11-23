part of 'plan_selection_bloc.dart';

enum PlanSelectionStatus {
  initial,
  loading,
  success,
  empty,
  failure,
}

class PlanSelectionState extends Equatable {
  const PlanSelectionState({
    this.status = PlanSelectionStatus.initial,
    this.plans = const [],
    this.currentPlan,
  });

  final PlanSelectionStatus status;
  final List<Plan> plans;
  final Plan? currentPlan;

  PlanSelectionState copyWith({
    PlanSelectionStatus? status,
    List<Plan>? plans,
    Plan? Function()? currentPlan,
  }) {
    return PlanSelectionState(
      status: status ?? this.status,
      plans: plans ?? this.plans,
      currentPlan: currentPlan != null ? currentPlan() : this.currentPlan,
    );
  }

  @override
  List<Object?> get props => [
        status,
        plans,
        currentPlan,
      ];

  @override
  String toString() {
    final map = {
      'status': status,
      'plansCount': plans.length,
      'currentPlan': currentPlan?.id
    };
    return map.toString();
  }
}
