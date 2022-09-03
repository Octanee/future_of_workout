part of 'created_list_cubit.dart';

enum CreatedListStatus { loading, loaded, adding, added, failure }

class CreatedListState extends Equatable {
  const CreatedListState._({
    this.status = CreatedListStatus.loading,
    this.workouts = const [],
    this.newWorkout,
  });

  const CreatedListState.loading() : this._();

  const CreatedListState.loaded({required List<Workout> workouts})
      : this._(status: CreatedListStatus.loaded, workouts: workouts);

  const CreatedListState.failure() : this._(status: CreatedListStatus.failure);

  const CreatedListState.adding() : this._(status: CreatedListStatus.adding);

  const CreatedListState.added({required Workout newWorkout})
      : this._(status: CreatedListStatus.added, newWorkout: newWorkout);

  final CreatedListStatus status;
  final List<Workout> workouts;
  final Workout? newWorkout;

  @override
  List<Object?> get props => [status, workouts];

  @override
  String toString() =>
      'CreatedListState ( status: $status, workouts: ${workouts.length} )';
}
