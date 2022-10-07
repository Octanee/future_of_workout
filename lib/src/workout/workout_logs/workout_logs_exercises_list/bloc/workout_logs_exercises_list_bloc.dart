import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_repository/exercise_repository.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_log_api/workout_log_api.dart';
import 'package:workout_log_repository/workout_log_repository.dart';

part 'workout_logs_exercises_list_event.dart';
part 'workout_logs_exercises_list_state.dart';

class WorkoutLogsExercisesListBloc
    extends Bloc<WorkoutLogsExercisesListEvent, WorkoutLogsExercisesListState> {
  WorkoutLogsExercisesListBloc({
    required WorkoutLogRepository workoutLogRepository,
    required ExerciseRepository exerciseRepository,
  })  : _exerciseRepository = exerciseRepository,
        _workoutLogRepository = workoutLogRepository,
        super(const WorkoutLogsExercisesListState()) {
    on<WorkoutLogsExercisesListLoadingWorkout>(_onLoadingWorkout);
    on<WorkoutLogsExercisesListSubscriptionRequested>(_onSubscriptionRequested);
    on<WorkoutLogsExercisesListExerciseSelectionToggle>(
      _onExerciseSelectionToggle,
    );
    on<WorkoutLogsExercisesListAddingToWorkout>(_onAddingToWorkout);
  }

  final WorkoutLogRepository _workoutLogRepository;
  final ExerciseRepository _exerciseRepository;

  void _onLoadingWorkout(
    WorkoutLogsExercisesListLoadingWorkout event,
    Emitter<WorkoutLogsExercisesListState> emit,
  ) {
    emit(state.copyWith(status: WorkoutLogsExercisesListStatus.loadingWorkout));
    try {
      final workout = _workoutLogRepository.get(id: event.workoutLogId);
      emit(
        state.copyWith(
          status: WorkoutLogsExercisesListStatus.loadedWorkout,
          workoutLog: workout,
        ),
      );
    } on WorkoutNotFoundException catch (_) {
      emit(state.copyWith(status: WorkoutLogsExercisesListStatus.failure));
    }
  }

  Future<void> _onSubscriptionRequested(
    WorkoutLogsExercisesListSubscriptionRequested event,
    Emitter<WorkoutLogsExercisesListState> emit,
  ) async {
    emit(
      state.copyWith(status: WorkoutLogsExercisesListStatus.loadedExercises),
    );

    await emit.forEach<List<Exercise>>(
      _exerciseRepository.getExercises(),
      onData: (exercises) => state.copyWith(
        status: WorkoutLogsExercisesListStatus.loadedExercises,
        exercises: exercises,
      ),
      onError: (_, __) => state.copyWith(
        status: WorkoutLogsExercisesListStatus.failure,
      ),
    );
  }

  void _onExerciseSelectionToggle(
    WorkoutLogsExercisesListExerciseSelectionToggle event,
    Emitter<WorkoutLogsExercisesListState> emit,
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
    WorkoutLogsExercisesListAddingToWorkout event,
    Emitter<WorkoutLogsExercisesListState> emit,
  ) async {
    emit(state.copyWith(status: WorkoutLogsExercisesListStatus.updating));
    try {
      final workoutExerciseLogs =
          List.of(state.workoutLog!.workoutExerciseLogs);

      state.selected.forEach((key, value) {
        if (value) {
          final workoutExercise = WorkoutExerciseLog(
            index: workoutExerciseLogs.length,
            exercise: key,
            exerciseSeriesLogs: List.generate(
              3,
              (index) => ExerciseSeriesLog(
                index: index + 1,
                weight: 20,
                reps: 12,
                rest: 120,
                intensity: SeriesLogIntensity.moderate,
              ),
            ),
          );
          workoutExerciseLogs.add(workoutExercise);
        }
      });

      final workoutLog = state.workoutLog!.copyWith(
        workoutExerciseLogs: workoutExerciseLogs,
      );

      await _workoutLogRepository.saveWorkoutLog(workoutLog: workoutLog);
      emit(state.copyWith(status: WorkoutLogsExercisesListStatus.updated));
    } catch (e) {
      emit(state.copyWith(status: WorkoutLogsExercisesListStatus.failure));
    }
  }
}
