import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_api/exercise_api.dart';
import 'package:future_of_workout/src/shared/extensions.dart';
import 'package:workout_repository/workout_repository.dart';

part 'workout_details_event.dart';
part 'workout_details_state.dart';

class WorkoutDetailsBloc
    extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  WorkoutDetailsBloc({
    required WorkoutRepository workoutRepository,
  })  : _workoutRepository = workoutRepository,
        super(const WorkoutDetailsState()) {
    on<WorkoutDetailsWorkoutSubscriptionRequested>(
      _onWorkoutSubscriptionRequested,
    );
    on<WorkoutDetailsRenameWorkout>(_onRenameWorkout);
    on<WorkoutDetailsFavoritToggled>(_onFavoritToggled);
    on<WorkoutDetailsDelete>(_onDelete);
    on<WorkoutDetailsAddExercises>(_onAddExercises);
  }

  final WorkoutRepository _workoutRepository;

  Future<void> _onWorkoutSubscriptionRequested(
    WorkoutDetailsWorkoutSubscriptionRequested event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutDetailsStatus.loading));

    await emit.forEach<Workout?>(
      _workoutRepository.getWorkout(id: event.id),
      onData: (workout) {
        return state.copyWith(
          status: WorkoutDetailsStatus.loaded,
          workout: workout,
        );
      },
      onError: (_, __) => state.copyWith(status: WorkoutDetailsStatus.failure),
    );
  }

  Future<void> _onRenameWorkout(
    WorkoutDetailsRenameWorkout event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    final name = event.name.withDefault('Workout');
    await _updateWorkout(
      workout: state.workout!.copyWith(name: name),
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

  Future<void> _onAddExercises(
    WorkoutDetailsAddExercises event,
    Emitter<WorkoutDetailsState> emit,
  ) async {
    final workoutExercises = List.of(state.workout!.workoutExercises);

    for (final exercise in event.exercises) {
      final item = WorkoutExercise(
        index: workoutExercises.length,
        exercise: exercise,
      );
      workoutExercises.add(item);
    }

    final workout = state.workout!.copyWith(workoutExercises: workoutExercises);

    await _updateWorkout(workout: workout, emit: emit);
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
