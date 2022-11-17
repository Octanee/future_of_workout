import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:user_repository/user_repository.dart';
import 'package:workout_repository/workout_repository.dart';

part 'plan_selection_event.dart';
part 'plan_selection_state.dart';

class PlanSelectionBloc extends Bloc<PlanSelectionEvent, PlanSelectionState> {
  PlanSelectionBloc({
    required WorkoutRepository workoutRepository,
    required UserRepository userRepository,
  })  : _workoutRepository = workoutRepository,
        _userRepository = userRepository,
        super(const PlanSelectionState()) {
    on<PlanSelectionLoading>(_onLoading);
    on<PlanSelectionLoadingUser>(_onLoadingUser);
    on<PlanSelectionAddPlan>(_onAddPlan);
    on<PlanSelectionRenamePlan>(_onRenamePlan);
    on<PlanSelectionDeletePlan>(_onDeletePlan);
    on<PlanSelectionSetCurrentPlan>(_onSetCurrentPlan);
  }

  final WorkoutRepository _workoutRepository;
  final UserRepository _userRepository;

  Future<void> _onLoading(
    PlanSelectionLoading event,
    Emitter<PlanSelectionState> emit,
  ) async {
    emit(state.copyWith(status: PlanSelectionStatus.loading));

    await emit.forEach<List<Plan>>(
      _workoutRepository.getPlans(),
      onData: (plans) {
        if (plans.isEmpty) {
          return state.copyWith(
            plans: plans,
            status: PlanSelectionStatus.empty,
          );
        }

        return state.copyWith(
          plans: plans,
          status: PlanSelectionStatus.success,
        );
      },
      onError: (_, __) => state.copyWith(status: PlanSelectionStatus.failure),
    );
  }

  Future<void> _onLoadingUser(
    PlanSelectionLoadingUser event,
    Emitter<PlanSelectionState> emit,
  ) async {
    await emit.forEach<User?>(
      _userRepository.getUser(),
      onData: (user) {
        final id = user?.currentPlanId;

        if (id == null) {
          return state.copyWith(currentPlan: () => null);
        }

        final plan = _workoutRepository.getPlan(id: id);
        return state.copyWith(currentPlan: () => plan);
      },
      onError: (_, __) => state.copyWith(status: PlanSelectionStatus.failure),
    );
  }

  Future<void> _onAddPlan(
    PlanSelectionAddPlan event,
    Emitter<PlanSelectionState> emit,
  ) async {
    final name = event.name.withDefault('New plan');
    final plan = Plan(name: name);

    await _workoutRepository.savePlan(plan);
  }

  Future<void> _onDeletePlan(
    PlanSelectionDeletePlan event,
    Emitter<PlanSelectionState> emit,
  ) async {
    if (event.id == state.currentPlan?.id) {
      final user = _userRepository.get();
      await _userRepository.saveUser(
        user.copyWith(currentPlanId: () => null),
      );
    }
    await _workoutRepository.deletePlan(event.id);
  }

  Future<void> _onSetCurrentPlan(
    PlanSelectionSetCurrentPlan event,
    Emitter<PlanSelectionState> emit,
  ) async {
    final user = _userRepository.get();
    await _userRepository.saveUser(
      user.copyWith(currentPlanId: () => event.id),
    );
  }

  Future<void> _onRenamePlan(
    PlanSelectionRenamePlan event,
    Emitter<PlanSelectionState> emit,
  ) async {
    final plan = event.plan.copyWith(name: event.newName.withDefault('Plan'));
    await _workoutRepository.savePlan(plan);
  }
}
