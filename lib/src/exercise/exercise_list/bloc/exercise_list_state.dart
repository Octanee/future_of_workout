part of 'exercise_list_bloc.dart';

enum ExerciseListStatus {
  initial,
  loading,
  success,
  confirm,
  failure,
}

class ExerciseListState extends Equatable {
  const ExerciseListState({
    this.status = ExerciseListStatus.initial,
    this.exercises = const [],
    this.selected = const {},
    required this.extra,
  });

  final ExerciseListStatus status;
  final List<Exercise> exercises;
  final Map<Exercise, bool> selected;

  final ExerciseListExtra extra;

  @override
  List<Object> get props => [status, exercises, selected, extra];

  ExerciseListState copyWith({
    ExerciseListStatus? status,
    List<Exercise>? exercises,
    Map<Exercise, bool>? selected,
    ExerciseListExtra? extra,
  }) {
    return ExerciseListState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      selected: selected ?? this.selected,
      extra: extra ?? this.extra,
    );
  }
}
