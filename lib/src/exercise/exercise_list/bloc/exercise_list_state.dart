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
  });

  final ExerciseListStatus status;
  final List<Exercise> exercises;
  final Map<Exercise, bool> selected;
  final String filter;
  final Muscle? muscle;
  final bool isSearching;

  final ExerciseListExtra extra;

  List<Exercise> get data {
    var list = exercises;

    if (muscle != null) {
      list = list
          .where((exercise) => exercise.muscles.containsKey(muscle))
          .toList();
    }
    if (filter.isNotEmpty) {
      list = list
          .where(
            (exercise) =>
                exercise.name.toLowerCase().contains(filter.toLowerCase()),
          )
          .toList();
    }
    list.sort((a, b) => a.name.compareTo(b.name),);
    return list;
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
      ];

  ExerciseListState copyWith({
    ExerciseListStatus? status,
    List<Exercise>? exercises,
    Map<Exercise, bool>? selected,
    ExerciseListExtra? extra,
    String? filter,
    bool? isSearching,
    Muscle? Function()? muscle,
  }) {
    return ExerciseListState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      selected: selected ?? this.selected,
      extra: extra ?? this.extra,
      filter: filter ?? this.filter,
      isSearching: isSearching ?? this.isSearching,
      muscle: muscle != null ? muscle() : this.muscle,
    );
  }
}
