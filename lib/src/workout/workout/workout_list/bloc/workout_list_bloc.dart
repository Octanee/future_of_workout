import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/common.dart';
import 'package:user_repository/user_repository.dart';
import 'package:workout_repository/workout_repository.dart';

part 'workout_list_state.dart';
part 'workout_list_event.dart';

class WorkoutListBloc extends Bloc<WorkoutListEvent, WorkoutListState> {
  WorkoutListBloc({
    required WorkoutRepository workoutRepository,
    required UserRepository userRepository,
  })  : _workoutRepository = workoutRepository,
        _userRepository = userRepository,
        super(const WorkoutListState()) {
    on<WorkoutListLoadingUser>(_onLoadingUser);
    on<WorkoutListLoading>(_onLoading);
    on<WorkoutListNewWorkoutAdding>(_onNewWorkoutAdding);
  }

  final WorkoutRepository _workoutRepository;
  final UserRepository _userRepository;

  Future<void> _onLoadingUser(
    WorkoutListLoadingUser event,
    Emitter<WorkoutListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutListStatus.loadingUser));

    await emit.forEach<User?>(
      _userRepository.getUser(),
      onData: (user) {
        if (user?.currentPlanId == null) {
          return state.copyWith(
            status: WorkoutListStatus.noSelectedPlan,
            plan: () => null,
          );
        }

        return state.copyWith(
          status: WorkoutListStatus.loadedUser,
          currentPlanId: () => user?.currentPlanId,
        );
      },
      onError: (_, __) => state.copyWith(status: WorkoutListStatus.failure),
    );
  }

  Future<void> _onLoading(
    WorkoutListLoading event,
    Emitter<WorkoutListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutListStatus.loadingPlan));

    final planId = state.currentPlanId;
    if (planId == null) {
      emit(state.copyWith(status: WorkoutListStatus.failure));
      return;
    }

    await emit.forEach<Plan?>(
      _workoutRepository.getPlanStream(id: state.currentPlanId!),
      onData: (plan) {
        if (plan == null) {
          return state.copyWith(
            status: WorkoutListStatus.noSelectedPlan,
            plan: () => null,
          );
        }

        if (plan.workouts.isEmpty) {
          return state.copyWith(
            status: WorkoutListStatus.empty,
            plan: () => plan,
          );
        }

        return state.copyWith(
          status: WorkoutListStatus.loadedPlan,
          plan: () => plan,
        );
      },
      onError: (_, __) => state.copyWith(status: WorkoutListStatus.failure),
    );
  }

  Future<void> _onNewWorkoutAdding(
    WorkoutListNewWorkoutAdding event,
    Emitter<WorkoutListState> emit,
  ) async {
    try {
      final name = event.name.withDefault('Workout');
      final workout = Workout(name: name);

      final workouts = List.of(state.plan!.workouts)..add(workout);
      final plan = state.plan!.copyWith(workouts: workouts);

      await _workoutRepository.savePlan(plan);
      emit(
        state.copyWith(
          status: WorkoutListStatus.added,
          plan: () => plan,
          newWorkoutId: workout.id,
        ),
      );
    } catch (_) {
      state.copyWith(status: WorkoutListStatus.failure);
    }
  }
}
