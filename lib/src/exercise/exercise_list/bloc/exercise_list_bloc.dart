import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercise_repository/exercise_repository.dart';

part 'exercise_list_event.dart';
part 'exercise_list_state.dart';

class ExerciseListBloc extends Bloc<ExerciseListEvent, ExerciseListState> {
  ExerciseListBloc({
    required ExerciseRepository exerciseRepository,
    bool multiSelected = true,
  })  : _repository = exerciseRepository,
        super(ExerciseListState(multiSelected: multiSelected)) {
    on<ExerciseListSubscriptionRequested>(_onSubscriptionRequested);
    on<ExerciseListSelect>(_onSelect);
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

    if (state.multiSelected) {
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
}
