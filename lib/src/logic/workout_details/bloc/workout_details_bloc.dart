import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

part 'workout_details_event.dart';
part 'workout_details_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  WorkoutDetailsBloc({
    required this.repository,
    required Workout workout,
  }) : super(WorkoutDetailsState(workout: workout)) {
    on<WorkoutDetailsNameChanged>(_onNameChanged);
    on<WorkoutDetailsIsFavoritToggled>(_onIsFavoritToggled);
    on<WorkoutDetailsDelete>(_onDelete);
  }

  final WorkoutRepository repository;

  Future<void> _onNameChanged(
    WorkoutDetailsNameChanged event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    _updateWorkout(
      workout: state.workout.copyWith(name: event.name),
      emit: emit,
    );
  }

  Future<void> _onIsFavoritToggled(
    WorkoutDetailsIsFavoritToggled event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    _updateWorkout(
      workout: state.workout.copyWith(isFavorite: !state.workout.isFavorite),
      emit: emit,
    );
  }

  Future<void> _onDelete(
    WorkoutDetailsDelete event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    try {
      await repository.removeWorkout(id: state.workout.id);
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
      await repository.updateWorkout(workout: workout);
      emit(state.copyWith(
        status: WorkoutDetailsStatus.success,
        workout: workout,
      ));
    } catch (e) {
      emit(state.copyWith(status: WorkoutDetailsStatus.failure));
    }
  }
}
