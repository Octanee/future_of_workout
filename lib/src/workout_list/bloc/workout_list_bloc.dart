import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_repository/workout_repository.dart';

part 'workout_list_state.dart';
part 'workout_list_event.dart';

class WorkoutListBloc extends Bloc<WorkoutListEvent, WorkoutListState> {
  WorkoutListBloc({required WorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(const WorkoutListState()) {
    on<WorkoutListSubcriptionRequested>(_onSubscriptionRequested);
    on<WorkoutListWorkoutFavoriteToggled>(_onWorkoutFavoriteToggled);
    on<WorkoutListNewWorkoutNameChanged>(_onNewWorkoutNameChanged);
    on<WorkoutListNewWorkoutAdding>(_onNewWorkoutAdding);
  }

  final WorkoutRepository _workoutRepository;

  Future<void> _onSubscriptionRequested(
    WorkoutListSubcriptionRequested event,
    Emitter<WorkoutListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutListStatus.loading));

    await emit.forEach<List<Workout>>(
      _workoutRepository.getWorkouts(),
      onData: (workouts) => state.copyWith(
        status: WorkoutListStatus.loaded,
        workouts: workouts,
      ),
      onError: (_, __) => state.copyWith(
        status: WorkoutListStatus.failure,
      ),
    );
  }

  Future<void> _onWorkoutFavoriteToggled(
    WorkoutListWorkoutFavoriteToggled event,
    Emitter<WorkoutListState> emit,
  ) async {
    final newWorkout = event.workout.copyWith(isFavorite: event.isFavorite);
    await _workoutRepository.saveWorkout(newWorkout);
  }

  void _onNewWorkoutNameChanged(
    WorkoutListNewWorkoutNameChanged event,
    Emitter<WorkoutListState> emit,
  ) {
    emit(state.copyWith(newWorkoutName: event.newWorkoutName));
  }

  Future<void> _onNewWorkoutAdding(
    WorkoutListNewWorkoutAdding event,
    Emitter<WorkoutListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutListStatus.adding));
    final workout = Workout(name: state.newWorkoutName);

    try {
      await _workoutRepository.saveWorkout(workout);
      emit(
        state.copyWith(
          status: WorkoutListStatus.added,
          newWorkoutId: workout.id,
        ),
      );
    } catch (e) {
      state.copyWith(status: WorkoutListStatus.failure);
    }
  }
}
