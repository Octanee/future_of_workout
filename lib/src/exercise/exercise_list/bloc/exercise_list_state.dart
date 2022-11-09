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
    required this.extra,
    this.status = ExerciseListStatus.initial,
    this.exercises = const [],
    this.selected = const {},
    this.filter = '',
    this.isSearching = false,
    this.muscle,
    this.category,
  });

  final ExerciseListStatus status;
  final List<Exercise> exercises;
  final Map<Exercise, bool> selected;
  final String filter;
  final Muscle? muscle;
  final ExerciseCategory? category;
  final bool isSearching;

  final ExerciseListExtra extra;

  List<Exercise> get data {
    var list = exercises;

    if (muscle != null) {
      list = _applyMuscle(list);
    }
    if (category != null) {
      list = _applyCategory(list);
    }

    if (filter.isNotEmpty) {
      list = _applyName(list);
    }
    list.sort(
      (a, b) => a.name.compareTo(b.name),
    );
    return list;
  }

  List<Exercise> _applyName(List<Exercise> list) {
    return list
        .where(
          (exercise) =>
              exercise.name.toLowerCase().contains(filter.toLowerCase()),
        )
        .toList();
  }

  List<Exercise> _applyCategory(List<Exercise> list) {
    return list.where((exercise) {
      switch (category!) {
        case ExerciseCategory.bodyweight:
          return exercise.equipment.isEmpty;
        case ExerciseCategory.weight:
          return exercise.equipment.contains(Equipment.barbell) ||
              exercise.equipment.contains(Equipment.dumbell);
        case ExerciseCategory.machine:
          return exercise.equipment.contains(Equipment.machine);
        case ExerciseCategory.cable:
          return exercise.equipment.contains(Equipment.cable);
      }
    }).toList();
  }

  List<Exercise> _applyMuscle(List<Exercise> list) {
    return list
        .where((exercise) => exercise.muscles.containsKey(muscle))
        .toList();
  }

  @override
  List<Object?> get props => [
        status,
        exercises,
        selected,
        extra,
        filter,
        isSearching,
        muscle,
        category,
      ];

  ExerciseListState copyWith({
    ExerciseListStatus? status,
    List<Exercise>? exercises,
    Map<Exercise, bool>? selected,
    ExerciseListExtra? extra,
    String? filter,
    bool? isSearching,
    Muscle? Function()? muscle,
    ExerciseCategory? Function()? category,
  }) {
    return ExerciseListState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      selected: selected ?? this.selected,
      extra: extra ?? this.extra,
      filter: filter ?? this.filter,
      isSearching: isSearching ?? this.isSearching,
      muscle: muscle != null ? muscle() : this.muscle,
      category: category != null ? category() : this.category,
    );
  }
}
