part of 'workout_exercise_details_bloc.dart';

enum WorkoutExerciseDetailsStatus {
  initial,
  loading,
  loaded,
  updating,
  updated,
  delete,
  failure,
}

class WorkoutExerciseDetailsState extends Equatable {
  const WorkoutExerciseDetailsState({
    this.status = WorkoutExerciseDetailsStatus.initial,
    this.isAdvanced = false,
    this.workoutExercise,
    this.workout,
    this.plan,
  });

  final WorkoutExerciseDetailsStatus status;
  final WorkoutExercise? workoutExercise;
  final bool isAdvanced;

  final Workout? workout;
  final Plan? plan;

  @override
  List<Object?> get props => [
        status,
        workoutExercise,
        isAdvanced,
        workout,
        plan,
      ];

  WorkoutExerciseDetailsState copyWith({
    WorkoutExerciseDetailsStatus? status,
    WorkoutExercise? workoutExercise,
    bool? isAdvanced,
    Workout? workout,
    Plan? plan,
  }) {
    return WorkoutExerciseDetailsState(
      status: status ?? this.status,
      workoutExercise: workoutExercise ?? this.workoutExercise,
      isAdvanced: isAdvanced ?? this.isAdvanced,
      workout: workout ?? this.workout,
      plan: plan ?? this.plan,
    );
  }
}
