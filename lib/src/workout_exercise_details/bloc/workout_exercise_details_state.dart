part of 'workout_exercise_details_bloc.dart';

enum WorkoutExerciseDetailsStatus {
  loading,
  loaded,
  updating,
  updated,
  delete,
  failure,
}

class WorkoutExerciseDetailsState extends Equatable {
  const WorkoutExerciseDetailsState({
    this.status = WorkoutExerciseDetailsStatus.loading,
    this.isEditing = false,
    this.isAdvanced = false,
    this.workoutExercise,
    this.workout,
  });

  final WorkoutExerciseDetailsStatus status;
  final WorkoutExercise? workoutExercise;
  final bool isEditing;
  final bool isAdvanced;

  final Workout? workout;

  @override
  List<Object?> get props {
    return [
      status,
      workoutExercise,
      isEditing,
      isAdvanced,
      workout,
    ];
  }

  WorkoutExerciseDetailsState copyWith({
    WorkoutExerciseDetailsStatus? status,
    WorkoutExercise? workoutExercise,
    bool? isEditing,
    bool? isAdvanced,
    Workout? workout,
  }) {
    return WorkoutExerciseDetailsState(
      status: status ?? this.status,
      workoutExercise: workoutExercise ?? this.workoutExercise,
      isEditing: isEditing ?? this.isEditing,
      isAdvanced: isAdvanced ?? this.isAdvanced,
      workout: workout ?? this.workout,
    );
  }
}
