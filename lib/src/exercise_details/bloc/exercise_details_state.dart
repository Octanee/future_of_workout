part of 'exercise_details_bloc.dart';

enum ExerciseDetailsStatus {
  initial,
  loading,
  success,
  failure,
}

class ExerciseDetailsState extends Equatable {
  const ExerciseDetailsState({
    this.status = ExerciseDetailsStatus.initial,
    this.exercise,
  });

  final ExerciseDetailsStatus status;
  final Exercise? exercise;

  @override
  List<Object?> get props => [status, exercise];

  ExerciseDetailsState copyWith({
    ExerciseDetailsStatus? status,
    Exercise? exercise,
  }) {
    return ExerciseDetailsState(
      status: status ?? this.status,
      exercise: exercise ?? this.exercise,
    );
  }
}
