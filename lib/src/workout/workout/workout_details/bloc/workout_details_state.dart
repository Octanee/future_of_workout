part of 'workout_details_bloc.dart';

enum WorkoutDetailsStatus {
  init,
  loading,
  loaded,
  updating,
  updated,
  empty,
  delete,
  failure,
}

class WorkoutDetailsState extends Equatable {
  const WorkoutDetailsState({
    this.workout,
    this.plan,
    this.status = WorkoutDetailsStatus.init,
  });

  final WorkoutDetailsStatus status;
  final Workout? workout;
  final Plan? plan;

  WorkoutDetailsState copyWith({
    WorkoutDetailsStatus? status,
    Workout? workout,
    Plan? plan,
  }) {
    return WorkoutDetailsState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
      plan: plan ?? this.plan,
    );
  }

  @override
  List<Object?> get props => [
        status,
        workout,
        plan,
      ];
}
