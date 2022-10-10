import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_repository/workout_repository.dart';

part 'workout_exercise_details_event.dart';
part 'workout_exercise_details_state.dart';

class WorkoutExerciseDetailsBloc
    extends Bloc<WorkoutExerciseDetailsEvent, WorkoutExerciseDetailsState> {
  WorkoutExerciseDetailsBloc({required WorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(const WorkoutExerciseDetailsState()) {
    on<WorkoutExerciseDetailsLoading>(_onLoading);
    on<WorkoutExerciseDetailsExerciseSeriesChanged>(_onExerciseSeriesChanged);
    on<WorkoutExerciseDetailsAddingSeries>(_onAddingSeries);
    on<WorkoutExerciseDetailsRemovedSeries>(_onRemovedSeries);
    on<WorkoutExerciseDetailsDeleteWorkoutExercise>(_onDeleteWorkoutExercise);
    on<WorkoutExerciseDetailsChangeDisplayMode>(_onChangeDisplayMode);
    on<WorkoutExerciseDetailsAllSeriesChanged>(_onAllSeriesChanged);
    on<WorkoutExerciseDetailsPop>(_onPop);
  }

  final WorkoutRepository _workoutRepository;

  Future<void> _onLoading(
    WorkoutExerciseDetailsLoading event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutExerciseDetailsStatus.loading));

    try {
      final workout = _workoutRepository.get(id: event.workoutId);
      final workoutExercise = workout.workoutExercises
          .firstWhere((element) => element.id == event.workoutExerciseId);

      var isAdvanced = false;
      if (workoutExercise.exerciseSeries.isNotEmpty) {
        final first = workoutExercise.exerciseSeries.first;
        isAdvanced = workoutExercise.exerciseSeries.any(
          (element) =>
              element.reps != first.reps ||
              element.weight != first.weight ||
              element.rest != first.rest,
        );
      }

      emit(
        state.copyWith(
          status: WorkoutExerciseDetailsStatus.loaded,
          workout: workout,
          workoutExercise: workoutExercise,
          isAdvanced: isAdvanced,
        ),
      );
    } on WorkoutNotFoundException catch (_) {
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.failure));
    }
  }

  void _onExerciseSeriesChanged(
    WorkoutExerciseDetailsExerciseSeriesChanged event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) {
    final exerciseSeries = List.of(state.workoutExercise!.exerciseSeries);
    exerciseSeries[event.index - 1] = event.series;
    final newWorkoutExercise =
        state.workoutExercise!.copyWith(exerciseSeries: exerciseSeries);

    emit(state.copyWith(workoutExercise: newWorkoutExercise));
  }

  void _onAddingSeries(
    WorkoutExerciseDetailsAddingSeries event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) {
    final exerciseSeries = List.of(state.workoutExercise!.exerciseSeries);
    if (exerciseSeries.isEmpty) {
      exerciseSeries.add(ExerciseSeries(index: 1));
    } else {
      final lastSeries = exerciseSeries.last;
      exerciseSeries.add(lastSeries.copyWith(index: lastSeries.index + 1));
    }

    final newWorkoutExercise =
        state.workoutExercise!.copyWith(exerciseSeries: exerciseSeries);

    emit(state.copyWith(workoutExercise: newWorkoutExercise));
  }

  Future<void> _onDeleteWorkoutExercise(
    WorkoutExerciseDetailsDeleteWorkoutExercise event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) async {
    try {
      final workoutExercises = List.of(state.workout!.workoutExercises);
      final index = workoutExercises
          .indexWhere((element) => element.id == state.workoutExercise!.id);

      workoutExercises.removeAt(index);

      final workout =
          state.workout!.copyWith(workoutExercises: workoutExercises);

      await _workoutRepository.saveWorkout(workout);
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.delete));
    } catch (e) {
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.failure));
    }
  }

  void _onChangeDisplayMode(
    WorkoutExerciseDetailsChangeDisplayMode event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) {
    final isAdvanced = state.isAdvanced;
    WorkoutExercise? newWorkoutExercise;

    if (!isAdvanced) {
      final list = <ExerciseSeries>[];

      final first = state.workoutExercise!.exerciseSeries.first;

      for (final series in state.workoutExercise!.exerciseSeries) {
        list.add(
          series.copyWith(
            reps: first.reps,
            weight: first.weight,
            rest: first.rest,
          ),
        );
      }

      newWorkoutExercise =
          state.workoutExercise!.copyWith(exerciseSeries: list);
    }
    emit(
      state.copyWith(
        workoutExercise: newWorkoutExercise,
        isAdvanced: !isAdvanced,
      ),
    );
  }

  void _onAllSeriesChanged(
    WorkoutExerciseDetailsAllSeriesChanged event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) {
    final list = <ExerciseSeries>[];

    for (final series in state.workoutExercise!.exerciseSeries) {
      list.add(
        series.copyWith(
          reps: event.series.reps,
          weight: event.series.weight,
          rest: event.series.rest,
        ),
      );
    }

    final newWorkoutExercise =
        state.workoutExercise!.copyWith(exerciseSeries: list);

    emit(state.copyWith(workoutExercise: newWorkoutExercise));
  }

  void _onRemovedSeries(
    WorkoutExerciseDetailsRemovedSeries event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) {
    final exerciseSeries = List.of(state.workoutExercise!.exerciseSeries);
    if (exerciseSeries.isEmpty) return;

    exerciseSeries.removeLast();

    final newWorkoutExercise =
        state.workoutExercise!.copyWith(exerciseSeries: exerciseSeries);

    emit(state.copyWith(workoutExercise: newWorkoutExercise));
  }

  Future<void> _onPop(
    WorkoutExerciseDetailsPop event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutExerciseDetailsStatus.updating));
    try {
      final workoutExercises = List.of(state.workout!.workoutExercises);

      final index = workoutExercises
          .indexWhere((element) => element.id == state.workoutExercise!.id);

      workoutExercises[index] = state.workoutExercise!;

      final workout =
          state.workout!.copyWith(workoutExercises: workoutExercises);

      await _workoutRepository.saveWorkout(workout);
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.updated));
    } catch (e) {
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.failure));
    }
  }
}
