import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:future_of_workout/src/current_workout/current_workout.dart';
import 'package:future_of_workout/src/logger.dart';
import 'package:future_of_workout/src/ticker.dart';
import 'package:workout_api/workout_api.dart';
import 'package:workout_repository/workout_repository.dart';

part 'current_workout_event.dart';
part 'current_workout_state.dart';

class CurrentWorkoutBloc
    extends Bloc<CurrentWorkoutEvent, CurrentWorkoutState> {
  CurrentWorkoutBloc({
    required WorkoutRepository workoutRepository,
    required Ticker ticker,
  })  : _workoutRepository = workoutRepository,
        _ticker = ticker,
        super(const CurrentWorkoutState()) {
    on<CurrentWorkoutLoadingWorkout>(_onLoadingWorkout);
    on<CurrentWorkoutSeriesFinished>(_onSeriesFinished);
    on<CurrentWorkoutChangeExercise>(_onChangeExercise);
    on<CurrentWorkoutTicked>(_onTicked);
  }

  final WorkoutRepository _workoutRepository;
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscirption;

  @override
  Future<void> close() {
    _tickerSubscirption?.cancel();
    return super.close();
  }

  void _onLoadingWorkout(
    CurrentWorkoutLoadingWorkout event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    try {
      final workout = _workoutRepository.get(id: event.id);

      final exercises = workout.workoutExercises.map<CurrentWorkoutExercise>(
        (workoutExercise) {
          final exercise = CurrentWorkoutExercise(
            id: workoutExercise.id,
            index: workoutExercise.index,
            exercise: workoutExercise.exercise,
            series: workoutExercise.exerciseSeries
                .map<CurrentWorkoutSeries>(
                  (exerciseSeries) => CurrentWorkoutSeries(
                    index: exerciseSeries.index,
                    weight: exerciseSeries.weight,
                    reps: exerciseSeries.reps,
                    rest: exerciseSeries.rest,
                  ),
                )
                .toList(),
          );
          return exercise;
        },
      ).toList();

      emit(
        state.copyWith(
          status: CurrentWorkoutStatus.loaded,
          workout: workout,
          exercises: exercises,
        ),
      );

      _tickerSubscirption = _ticker
          .tick()
          .listen((time) => add(CurrentWorkoutTicked(time: time)));
    } on WorkoutNotFoundException catch (_) {
      emit(state.copyWith(status: CurrentWorkoutStatus.failure));
    }
  }

  void _onSeriesFinished(
    CurrentWorkoutSeriesFinished event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    try {
      final exercises = List.of(state.exercises);

      final exerciseIndex = exercises.indexWhere(
        (current) =>
            current.id == state.currentWorkoutExercise!.id &&
            current.index == state.currentWorkoutExercise!.index,
      );

      final series = List.of(state.currentWorkoutExercise!.series);
      final seriesIndex =
          series.indexWhere((current) => current.index == event.series.index);

      series[seriesIndex] = event.series.copyWith(isFinished: true);

      final isFinished = seriesIndex == series.length - 1;

      logger.i('_onSeriesFinished { isFinished: $isFinished }');

      final newExercise = state.currentWorkoutExercise!
          .copyWith(series: series, isFinished: isFinished);

      exercises[exerciseIndex] = newExercise;

      emit(
        state.copyWith(
          currentWorkoutExercise: newExercise,
          exercises: exercises,
        ),
      );
    } catch (e) {
      logger.e(e);
    }
  }

  void _onChangeExercise(
    CurrentWorkoutChangeExercise event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    emit(
      state.copyWith(currentWorkoutExercise: event.exercise),
    );
  }

  void _onTicked(
    CurrentWorkoutTicked event,
    Emitter<CurrentWorkoutState> emit,
  ) {
    emit(state.copyWith(time: event.time));
  }
}
