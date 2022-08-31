part of 'created_list_cubit.dart';

enum CreatedListStatus { loading, success, failure }

class CreatedListState extends Equatable {
  const CreatedListState._({
    this.status = CreatedListStatus.loading,
    this.workouts = const <Workout>[],
  });

  const CreatedListState.loading() : this._();

  const CreatedListState.success({required List<Workout> workouts})
      : this._(status: CreatedListStatus.success, workouts: workouts);

  const CreatedListState.failure() : this._(status: CreatedListStatus.failure);

  final CreatedListStatus status;
  final List<Workout> workouts;

  @override
  List<Object?> get props => [status, workouts];

  @override
  String toString() =>
      'CreatedListState ( status: $status, workouts: ${workouts.length} )';
}
