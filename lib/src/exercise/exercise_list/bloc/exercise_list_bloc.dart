import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:body_api/body_api.dart';
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
    on<ExerciseListFilter>(_onFilter);
    on<ExerciseListFilterCancel>(_onFilterCancel);
    on<ExerciseListMuscle>(_onMuscle);
    on<ExerciseListCategory>(_onCategory);
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

    if (state.extra.selectionType == SelectionType.multiple) {
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

  Future<void> _onConfirm(
    ExerciseListConfirm event,
    Emitter<ExerciseListState> emit,
  ) async {
    final selected = Map.of(state.selected)
      ..removeWhere((key, value) => value == false);

    final list = selected.keys.toList();

    if (state.extra.onConfirm != null) {
      await state.extra.onConfirm!(list);
    }

    emit(state.copyWith(status: ExerciseListStatus.confirm));
  }

  void _onFilter(
    ExerciseListFilter event,
    Emitter<ExerciseListState> emit,
  ) {
    emit(state.copyWith(filter: event.filter, isSearching: true));
  }

  void _onFilterCancel(
    ExerciseListFilterCancel event,
    Emitter<ExerciseListState> emit,
  ) {
    emit(state.copyWith(isSearching: false));
  }

  void _onMuscle(
    ExerciseListMuscle event,
    Emitter<ExerciseListState> emit,
  ) {
    emit(state.copyWith(muscle: () => event.muscle));
  }

  void _onCategory(
    ExerciseListCategory event,
    Emitter<ExerciseListState> emit,
  ) {
    emit(state.copyWith(category: () => event.category));
  }
}
