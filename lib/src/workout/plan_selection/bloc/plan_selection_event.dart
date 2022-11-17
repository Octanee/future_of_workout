part of 'plan_selection_bloc.dart';

abstract class PlanSelectionEvent extends Equatable {
  const PlanSelectionEvent();

  @override
  List<Object> get props => [];
}

class PlanSelectionLoading extends PlanSelectionEvent {
  const PlanSelectionLoading();
}

class PlanSelectionLoadingUser extends PlanSelectionEvent {
  const PlanSelectionLoadingUser();
}

class PlanSelectionAddPlan extends PlanSelectionEvent {
  const PlanSelectionAddPlan({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class PlanSelectionRenamePlan extends PlanSelectionEvent {
  const PlanSelectionRenamePlan({required this.plan, required this.newName});

  final Plan plan;
  final String newName;

  @override
  List<Object> get props => [plan, newName];
}

class PlanSelectionDeletePlan extends PlanSelectionEvent {
  const PlanSelectionDeletePlan({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class PlanSelectionSetCurrentPlan extends PlanSelectionEvent {
  const PlanSelectionSetCurrentPlan({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
