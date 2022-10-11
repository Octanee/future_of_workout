part of 'exercise_list_bloc.dart';

enum ExerciseListStatus {
  initial,
  loading,
  success,
  failure,
}

class ExerciseListState extends Equatable {
  const ExerciseListState({
    this.status = ExerciseListStatus.initial,
    this.exercises = const [],
    this.selected = const {},
    this.multiSelected = true,
  });

  final ExerciseListStatus status;
  final List<Exercise> exercises;
  final Map<Exercise, bool> selected;
  final bool multiSelected;

  @override
  List<Object> get props => [status, exercises, selected, multiSelected];

  ExerciseListState copyWith({
    ExerciseListStatus? status,
    List<Exercise>? exercises,
    Map<Exercise, bool>? selected,
    bool? multiSelected,
  }) {
    return ExerciseListState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      selected: selected ?? this.selected,
      multiSelected: multiSelected ?? this.multiSelected,
    );
  }
}
