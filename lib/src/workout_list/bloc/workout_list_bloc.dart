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
      onData: (workouts) {
        final favoriteWorkouts = workouts
            .where((element) => element.isFavorite)
            .toList()
          ..sort((a, b) => a.name.compareTo(b.name));
        final otherWorkouts = workouts
            .where((element) => !element.isFavorite)
            .toList()
          ..sort((a, b) => a.name.compareTo(b.name));

        final sortedList = favoriteWorkouts + otherWorkouts;

        return state.copyWith(
          status: WorkoutListStatus.loaded,
          workouts: sortedList,
        );
      },
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

  Future<void> _onNewWorkoutAdding(
    WorkoutListNewWorkoutAdding event,
    Emitter<WorkoutListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutListStatus.adding));

    final workout = Workout(name: 'Workout ${state.workouts.length}');

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
