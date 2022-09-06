part of 'workout_exercise_details_cubit.dart';

enum WorkoutExerciseDetailsStatus {
  loading,
  loaded,
  adding,
  added,
  saving,
  saved,
  failure
}

class WorkoutExerciseDetailsState extends Equatable {
  const WorkoutExerciseDetailsState({
    this.status = WorkoutExerciseDetailsStatus.loading,
    this.workoutExercise,
  });

  final WorkoutExerciseDetailsStatus status;

  final WorkoutExercise? workoutExercise;

  @override
  List<Object?> get props => [status, workoutExercise];

  WorkoutExerciseDetailsState copyWith({
    WorkoutExerciseDetailsStatus? status,
    WorkoutExercise? workoutExercise,
  }) {
    return WorkoutExerciseDetailsState(
      status: status ?? this.status,
      workoutExercise: workoutExercise ?? this.workoutExercise,
    );
  }
}
