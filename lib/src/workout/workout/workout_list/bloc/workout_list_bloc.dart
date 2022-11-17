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
    on<WorkoutListCurrentPlan>(_onCurrentPlan);
    on<WorkoutListLoading>(_onLoading);
    on<WorkoutListNewWorkoutAdding>(_onNewWorkoutAdding);
  }

  final WorkoutRepository _workoutRepository;
  final UserRepository _userRepository;

  Future<void> _onCurrentPlan(
    WorkoutListCurrentPlan event,
    Emitter<WorkoutListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutListStatus.loading));

    await emit.forEach<User?>(
      _userRepository.getUser(),
      onData: (user) {
        final id = user!.currentPlanId;

        if (id != null) {
          return state.copyWith(
            status: WorkoutListStatus.hasPlan,
            currentPlanId: () => id,
          );
        }
        return state.copyWith(
          status: WorkoutListStatus.noSelectedPlan,
          currentPlanId: () => null,
        );
      },
      onError: (_, __) => state.copyWith(status: WorkoutListStatus.failure),
    );
  }

  Future<void> _onLoading(
    WorkoutListLoading event,
    Emitter<WorkoutListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutListStatus.loading));

    await emit.forEach<Plan?>(
      _workoutRepository.getPlanStream(id: state.currentPlanId!),
      onData: (plan) {
        if (plan!.workouts.isEmpty) {
          return state.copyWith(plan: plan, status: WorkoutListStatus.empty);
        }

        return state.copyWith(
          status: WorkoutListStatus.loaded,
          plan: plan,
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
          plan: plan,
          newWorkoutId: workout.id,
        ),
      );
    } catch (_) {
      state.copyWith(status: WorkoutListStatus.failure);
    }
  }
}
