part of 'workout_details_bloc.dart';

enum WorkoutDetailsStatus {
  initial,
  loading,
  loaded,
  updating,
  updated,
  delete,
  failure,
}

class WorkoutDetailsState extends Equatable {
  const WorkoutDetailsState({
    this.workout,
    this.status = WorkoutDetailsStatus.initial,
    this.workoutName = '',
  });

  final WorkoutDetailsStatus status;
  final Workout? workout;
  final String workoutName;

  WorkoutDetailsState copyWith({
    WorkoutDetailsStatus? status,
    Workout? workout,
  }) {
    return WorkoutDetailsState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
    );
  }

  @override
  List<Object?> get props => [
        status,
        workout,
      ];
}
