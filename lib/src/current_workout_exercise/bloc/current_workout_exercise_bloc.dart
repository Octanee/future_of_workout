import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_repository/workout_repository.dart';

part 'current_workout_exercise_event.dart';
part 'current_workout_exercise_state.dart';

class CurrentWorkoutExerciseBloc
    extends Bloc<CurrentWorkoutExerciseEvent, CurrentWorkoutExerciseState> {
  CurrentWorkoutExerciseBloc({required WorkoutRepository workoutRepository})
      : _workoutRepository = workoutRepository,
        super(const CurrentWorkoutExerciseState()) {
    on<CurrentWorkoutExerciseLoading>(_onLoading);
    on<CurrentWorkoutExerciseCompleteSeries>(_onExerciseCompleteSeries);
  }

  final WorkoutRepository _workoutRepository;

  Future<void> _onLoading(
    CurrentWorkoutExerciseLoading event,
    Emitter<CurrentWorkoutExerciseState> emit,
  ) async {
    emit(state.copyWith(status: CurrentWorkoutExerciseStatus.loading));

    try {
      final workout = _workoutRepository.get(id: event.workoutId);
      final workoutExercise = workout.workoutExercises
          .firstWhere((element) => element.id == event.workoutExerciseId);

      emit(
        state.copyWith(
          status: CurrentWorkoutExerciseStatus.loaded,
          workout: workout,
          workoutExercise: workoutExercise,
          exerciseSeries: workoutExercise.exerciseSeries,
        ),
      );
    } on WorkoutNotFoundException catch (_) {
      emit(state.copyWith(status: CurrentWorkoutExerciseStatus.failure));
    }
  }

  void _onExerciseCompleteSeries(
    CurrentWorkoutExerciseCompleteSeries event,
    Emitter<CurrentWorkoutExerciseState> emit,
  ) {
    emit(state.copyWith(status: CurrentWorkoutExerciseStatus.updating));

    final completed = List<ExerciseSeries>.of(state.completedExerciseSeries)
      ..add(event.series.copyWith(reps: event.reps, weight: event.weight));

    // TODO(Octane): Save in WorkoutLogAPI

    emit(
      state.copyWith(
        status: CurrentWorkoutExerciseStatus.updated,
        completedExerciseSeries: completed,
      ),
    );
  }
}
