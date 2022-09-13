import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/logger.dart';
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
    on<WorkoutExerciseDetailsAllExerciseSeriesChanged>(
      _onAllExerciseSeriesChanged,
    );
    on<WorkoutExerciseDetailsAddingSeries>(_onAddingSeries);
    on<WorkoutExerciseDetailsDeleteWorkoutExercise>(_onDeleteWorkoutExercise);
    on<WorkoutExerciseDetailsChangeDisplayMode>(_onChangeDisplayMode);
    on<WorkoutExerciseDetailsUpdatetingWorkoutRequested>(
      _onUpdatetingWorkoutRequested,
    );
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
        isAdvanced = workoutExercise.exerciseSeries
            .any((element) => element != workoutExercise.exerciseSeries.first);
      }

      logger.d('IsAdvanced : $isAdvanced');

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
    exerciseSeries[event.index] = event.series;
    final newWorkoutExercise =
        state.workoutExercise!.copyWith(exerciseSeries: exerciseSeries);

    emit(state.copyWith(workoutExercise: newWorkoutExercise, isEditing: true));
  }

  void _onAddingSeries(
    WorkoutExerciseDetailsAddingSeries event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) {
    final exerciseSeries = List.of(state.workoutExercise!.exerciseSeries);
    if (exerciseSeries.isEmpty) {
      exerciseSeries.add(const ExerciseSeries());
    } else {
      final lastSeries = exerciseSeries.last;
      exerciseSeries.add(lastSeries);
    }

    final newWorkoutExercise =
        state.workoutExercise!.copyWith(exerciseSeries: exerciseSeries);

    emit(state.copyWith(workoutExercise: newWorkoutExercise, isEditing: true));
  }

  Future<void> _onUpdatetingWorkoutRequested(
    WorkoutExerciseDetailsUpdatetingWorkoutRequested event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutExerciseDetailsStatus.updating));
    try {
      final workoutExercises = List.of(state.workout!.workoutExercises);

      final index = workoutExercises
          .indexWhere((element) => element.id == state.workoutExercise!.id);
      logger
        ..d(workoutExercises)
        ..d(state.workoutExercise)
        ..d(index);
      workoutExercises[index] = state.workoutExercise!;

      final workout =
          state.workout!.copyWith(workoutExercises: workoutExercises);

      await _workoutRepository.saveWorkout(workout);
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.updated));
    } catch (e) {
      logger.e(e);
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.failure));
    }
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

    if (isAdvanced) {
      add(
        WorkoutExerciseDetailsAllExerciseSeriesChanged(
          series: state.workoutExercise!.exerciseSeries.first,
        ),
      );
    }

    emit(state.copyWith(isAdvanced: !isAdvanced));
  }

  void _onAllExerciseSeriesChanged(
    WorkoutExerciseDetailsAllExerciseSeriesChanged event,
    Emitter<WorkoutExerciseDetailsState> emit,
  ) {
    final numberOfSeries = state.workoutExercise!.exerciseSeries.length;

    final exerciseSeries =
        List.generate(numberOfSeries, (index) => event.series);

    final newWorkoutExercise =
        state.workoutExercise!.copyWith(exerciseSeries: exerciseSeries);

    emit(state.copyWith(workoutExercise: newWorkoutExercise, isEditing: true));
  }
}
