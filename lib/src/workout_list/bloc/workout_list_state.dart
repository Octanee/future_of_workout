part of 'workout_list_bloc.dart';

enum WorkoutListStatus { initial, loading, loaded, adding, added, failure }

class WorkoutListState extends Equatable {
  const WorkoutListState({
    this.status = WorkoutListStatus.initial,
    this.workouts = const [],
    this.newWorkoutName = '',
    this.newWorkoutId = '',
  });

  final WorkoutListStatus status;
  final List<Workout> workouts;
  final String newWorkoutName;
  final String newWorkoutId;

  @override
  List<Object> get props => [status, workouts, newWorkoutName, newWorkoutId];

  WorkoutListState copyWith({
    WorkoutListStatus? status,
    List<Workout>? workouts,
    String? newWorkoutName,
    String? newWorkoutId,
  }) {
    return WorkoutListState(
      status: status ?? this.status,
      workouts: workouts ?? this.workouts,
      newWorkoutName: newWorkoutName ?? this.newWorkoutName,
      newWorkoutId: newWorkoutId ?? this.newWorkoutId,
    );
  }
}
