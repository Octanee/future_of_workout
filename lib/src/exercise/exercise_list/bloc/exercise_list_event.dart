part of 'exercise_list_bloc.dart';

abstract class ExerciseListEvent extends Equatable {
  const ExerciseListEvent();

  @override
  List<Object> get props => [];
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
