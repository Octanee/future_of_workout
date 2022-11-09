part of 'exercise_list_bloc.dart';

abstract class ExerciseListEvent extends Equatable {
  const ExerciseListEvent();

  @override
  List<Object?> get props => [];
}

class ExerciseListSubscriptionRequested extends ExerciseListEvent {
  const ExerciseListSubscriptionRequested();
}

class ExerciseListSelect extends ExerciseListEvent {
  const ExerciseListSelect({required this.exercise});

  final Exercise exercise;

  @override
  List<Object> get props => [exercise];
}

class ExerciseListConfirm extends ExerciseListEvent {
  const ExerciseListConfirm();
}

class ExerciseListFilter extends ExerciseListEvent {
  const ExerciseListFilter({required this.filter});

  final String filter;

  @override
  List<Object> get props => [filter];
}

class ExerciseListFilterCancel extends ExerciseListEvent {
  const ExerciseListFilterCancel();
}

class ExerciseListMuscle extends ExerciseListEvent {
  const ExerciseListMuscle({this.muscle});

  final Muscle? muscle;

  @override
  List<Object?> get props => [muscle];
}

class ExerciseListCategory extends ExerciseListEvent {
  const ExerciseListCategory({this.category});

  final ExerciseCategory? category;

  @override
  List<Object?> get props => [category];
}
