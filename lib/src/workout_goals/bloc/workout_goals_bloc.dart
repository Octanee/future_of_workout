import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_repository/exercise_repository.dart';
import 'package:goal_repository/goal_repository.dart';

part 'workout_goals_event.dart';
part 'workout_goals_state.dart';

class WorkoutGoalsBloc extends Bloc<WorkoutGoalsEvent, WorkoutGoalsState> {
  WorkoutGoalsBloc({required GoalRepository goalRepository})
      : _goalRepository = goalRepository,
        super(const WorkoutGoalsState()) {
    on<WorkoutGoalsSubscriptionRequested>(_onSubscriptionRequested);
    on<WorkoutGoalsAdd>(_onAdd);
  }

  final GoalRepository _goalRepository;

  Future<void> _onSubscriptionRequested(
    WorkoutGoalsSubscriptionRequested event,
    Emitter<WorkoutGoalsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutGoalsStatus.loading));

    await emit.forEach<List<Goal>>(
      _goalRepository.getGoals(),
      onData: (data) {
        if (data.isEmpty) {
          return state.copyWith(status: WorkoutGoalsStatus.empty);
        }
        return state.copyWith(status: WorkoutGoalsStatus.loaded, goals: data);
      },
      onError: (_, __) => state.copyWith(status: WorkoutGoalsStatus.failure),
    );
  }

  Future<void> _onAdd(
    WorkoutGoalsAdd event,
    Emitter<WorkoutGoalsState> emit,
  ) async {
    final list = state.goals;

    final goal = list
        .firstWhere(
          (goal) => goal.exercise == event.exercise,
          orElse: () => Goal(exercise: event.exercise, goal: event.goal),
        )
        .copyWith(goal: event.goal);

    await _goalRepository.saveGoal(goal);

    emit(state.copyWith(status: WorkoutGoalsStatus.add));
  }
}
