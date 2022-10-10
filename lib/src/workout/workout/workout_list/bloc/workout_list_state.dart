part of 'workout_list_bloc.dart';

enum WorkoutListStatus {
  initial,
  loading,
  loaded,
  empty,
  added,
  failure,
}

class WorkoutListState extends Equatable {
  const WorkoutListState({
    this.status = WorkoutListStatus.initial,
    this.workouts = const [],
    this.newWorkoutId = '',
  });

  final WorkoutListStatus status;
  final List<Workout> workouts;
  final String newWorkoutId;

  @override
  List<Object> get props => [status, workouts, newWorkoutId];

  WorkoutListState copyWith({
    WorkoutListStatus? status,
    List<Workout>? workouts,
    String? newWorkoutId,
  }) {
    return WorkoutListState(
      status: status ?? this.status,
      workouts: workouts ?? this.workouts,
      newWorkoutId: newWorkoutId ?? this.newWorkoutId,
    );
  }
}
