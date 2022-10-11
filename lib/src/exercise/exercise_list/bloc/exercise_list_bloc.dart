import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_repository/exercise_repository.dart';
import 'package:future_of_workout/src/exercise/exercise.dart';

part 'exercise_list_event.dart';
part 'exercise_list_state.dart';

class ExerciseListBloc extends Bloc<ExerciseListEvent, ExerciseListState> {
  ExerciseListBloc({
    required ExerciseRepository exerciseRepository,
    required ExerciseListExtra extra,
  })  : _repository = exerciseRepository,
        super(ExerciseListState(extra: extra)) {
    on<ExerciseListSubscriptionRequested>(_onSubscriptionRequested);
    on<ExerciseListSelect>(_onSelect);
    on<ExerciseListConfirm>(_onConfirm);
  }

  final ExerciseRepository _repository;

  Future<void> _onSubscriptionRequested(
    ExerciseListSubscriptionRequested event,
    Emitter<ExerciseListState> emit,
  ) async {
    emit(state.copyWith(status: ExerciseListStatus.loading));

    await emit.forEach<List<Exercise>>(
      _repository.getExercises(),
      onData: (data) => state.copyWith(
        status: ExerciseListStatus.success,
        exercises: data,
      ),
      onError: (_, __) => state.copyWith(status: ExerciseListStatus.failure),
    );
  }

  void _onSelect(
    ExerciseListSelect event,
    Emitter<ExerciseListState> emit,
  ) {
    final exercise = event.exercise;
    final selected = Map.of(state.selected);

    if (state.extra.multiSelected) {
      final isSelected = state.selected[exercise];

      if (isSelected == null) {
        selected[exercise] = true;
      } else {
        selected.update(exercise, (value) => !isSelected);
      }
    } else {
      selected.updateAll((key, value) => false);
      selected[exercise] = true;
    }

    emit(state.copyWith(selected: selected));
  }

  void _onConfirm(ExerciseListConfirm event, Emitter<ExerciseListState> emit) {
    final selected = Map.of(state.selected)
      ..removeWhere((key, value) => value == false);

    final list = selected.keys.toList();

    state.extra.onConfirm(list);

    emit(state.copyWith(status: ExerciseListStatus.confirm));
  }
}
