import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_repository/exercise_repository.dart';
import 'package:future_of_workout/src/logger.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_repository/workout_repository.dart';

part 'workout_exercises_list_event.dart';
part 'workout_exercises_list_state.dart';

class WorkoutExercisesListBloc
    extends Bloc<WorkoutExercisesListEvent, WorkoutExercisesListState> {
  WorkoutExercisesListBloc({
    required WorkoutRepository workoutRepository,
    required ExerciseRepository exerciseRepository,
  })  : _exerciseRepository = exerciseRepository,
        _workoutRepository = workoutRepository,
        super(const WorkoutExercisesListState()) {
    on<WorkoutExerciseListLoadingWorkout>(_onLoadingWorkout);
    on<WorkoutExercisesListSubscriptionRequested>(_onSubscriptionRequested);
    on<WorkoutExercisesListExerciseSelectionToggle>(_onExerciseSelectionToggle);
    on<WorkoutExercisesListAddingToWorkout>(_onAddingToWorkout);
  }

  final WorkoutRepository _workoutRepository;
  final ExerciseRepository _exerciseRepository;

  void _onLoadingWorkout(
    WorkoutExerciseListLoadingWorkout event,
    Emitter<WorkoutExercisesListState> emit,
  ) {
    emit(state.copyWith(status: WorkoutExercisesListStatus.loadingWorkout));
    try {
      final workout = _workoutRepository.get(id: event.workoutId);
      emit(
        state.copyWith(
          status: WorkoutExercisesListStatus.loadedWorkout,
          workout: workout,
        ),
      );
    } on WorkoutNotFoundException catch (_) {
      emit(state.copyWith(status: WorkoutExercisesListStatus.failure));
    }
  }

  Future<void> _onSubscriptionRequested(
    WorkoutExercisesListSubscriptionRequested event,
    Emitter<WorkoutExercisesListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutExercisesListStatus.loadedExercises));

    await emit.forEach<List<Exercise>>(
      _exerciseRepository.getExercises(),
      onData: (exercises) => state.copyWith(
        status: WorkoutExercisesListStatus.loadedExercises,
        exercises: exercises,
      ),
      onError: (_, __) => state.copyWith(
        status: WorkoutExercisesListStatus.failure,
      ),
    );
  }

  void _onExerciseSelectionToggle(
    WorkoutExercisesListExerciseSelectionToggle event,
    Emitter<WorkoutExercisesListState> emit,
  ) {
    final selected = Map.of(state.selected);

    final isSelected = state.selected[event.exercise];

    if (isSelected == null) {
      selected[event.exercise] = true;
    } else {
      selected.update(event.exercise, (value) => !isSelected);
    }

    emit(state.copyWith(selected: selected));
  }

  Future<void> _onAddingToWorkout(
    WorkoutExercisesListAddingToWorkout event,
    Emitter<WorkoutExercisesListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutExercisesListStatus.updating));
    try {
      final workoutExercises = List.of(state.workout!.workoutExercises);

      state.selected.forEach((key, value) {
        if (value) {
          final workoutExercise = WorkoutExercise(
            index: workoutExercises.length,
            exercise: key,
          );
          workoutExercises.add(workoutExercise);
        }
      });

      final workout = state.workout!.copyWith(
        workoutExercises: workoutExercises,
      );

      logger.i(workout.toString());

      await _workoutRepository.saveWorkout(workout);
      emit(state.copyWith(status: WorkoutExercisesListStatus.updated));
    } catch (e) {
      emit(state.copyWith(status: WorkoutExercisesListStatus.failure));
    }
  }
}
