import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/logger.dart';
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

      logger.v(
          'CurrentWorkoutExerciseBloc - _onLoading { workoutExercise.exerciseSeries: ${workoutExercise.exerciseSeries} }');

      final exerciseSeriesMap = Map<ExerciseSeries, bool>.fromIterable(
        workoutExercise.exerciseSeries,
        
        value: (e) => false,
      );

      logger.v(
          'CurrentWorkoutExerciseBloc - _onLoading { exerciseSeriesMap: $exerciseSeriesMap }');

      emit(
        state.copyWith(
          status: CurrentWorkoutExerciseStatus.loaded,
          workout: workout,
          workoutExercise: workoutExercise,
          exerciseSeries: exerciseSeriesMap,
        ),
      );
    } on WorkoutNotFoundException catch (_) {
      emit(state.copyWith(status: CurrentWorkoutExerciseStatus.failure));
    }
  }
}
