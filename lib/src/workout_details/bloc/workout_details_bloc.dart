import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_repository/workout_repository.dart';

part 'workout_details_event.dart';
part 'workout_details_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  WorkoutDetailsBloc({
    required WorkoutRepository workoutRepository,
  })  : _workoutRepository = workoutRepository,
        super(const WorkoutDetailsState()) {
    on<WorkoutDetailsLoadWorkout>(_onLoadWorkout);
    on<WorkoutDetailsNameChanged>(_onNameChanged);
    on<WorkoutDetailsFavoritToggled>(_onFavoritToggled);
    on<WorkoutDetailsDelete>(_onDelete);
  }

  final WorkoutRepository _workoutRepository;

  Future<void> _onLoadWorkout(
    WorkoutDetailsLoadWorkout event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutDetailsStatus.loading));
    try {
      final workout = _workoutRepository.get(id: event.id);

      emit(
        state.copyWith(
          status: WorkoutDetailsStatus.loaded,
          workout: workout,
        ),
      );
    } on WorkoutNotFoundException catch (_) {
      emit(state.copyWith(status: WorkoutDetailsStatus.failure));
    }
  }

  Future<void> _onNameChanged(
    WorkoutDetailsNameChanged event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    await _updateWorkout(
      workout: state.workout!.copyWith(name: event.name),
      emit: emit,
    );
  }

  Future<void> _onFavoritToggled(
    WorkoutDetailsFavoritToggled event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    await _updateWorkout(
      workout: state.workout!.copyWith(isFavorite: !state.workout!.isFavorite),
      emit: emit,
    );
  }

  Future<void> _onDelete(
    WorkoutDetailsDelete event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    try {
      await _workoutRepository.deleteWorkout(state.workout!.id);
      emit(state.copyWith(status: WorkoutDetailsStatus.delete));
    } catch (e) {
      emit(state.copyWith(status: WorkoutDetailsStatus.failure));
    }
  }

  Future<void> _updateWorkout({
    required Workout workout,
    required Emitter<WorkoutDetailsState> emit,
  }) async {
    try {
      emit(state.copyWith(status: WorkoutDetailsStatus.updating));
      await _workoutRepository.saveWorkout(workout);
      emit(
        state.copyWith(
          status: WorkoutDetailsStatus.updated,
          workout: workout,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: WorkoutDetailsStatus.failure));
    }
  }
}
