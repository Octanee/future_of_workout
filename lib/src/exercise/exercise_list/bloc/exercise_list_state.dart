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
    this.filter = '',
    this.isSearching = false,
  });

  final ExerciseListStatus status;
  final List<Exercise> exercises;
  final Map<Exercise, bool> selected;
  final String filter;
  final bool isSearching;

  final ExerciseListExtra extra;

  List<Exercise> get data {
    if (filter.isEmpty) return exercises;

    final list = exercises
        .where(
          (exercise) =>
              exercise.name.toLowerCase().contains(filter.toLowerCase()),
        )
        .toList();
    return list;
  }

  @override
  List<Object> get props => [
        status,
        exercises,
        selected,
        extra,
        filter,
        isSearching,
      ];

  ExerciseListState copyWith({
    ExerciseListStatus? status,
    List<Exercise>? exercises,
    Map<Exercise, bool>? selected,
    ExerciseListExtra? extra,
    String? filter,
    bool? isSearching,
  }) {
    return ExerciseListState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      selected: selected ?? this.selected,
      extra: extra ?? this.extra,
      filter: filter ?? this.filter,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}
