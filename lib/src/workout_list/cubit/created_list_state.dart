// part of 'created_list_cubit.dart';

// enum CreatedListStatus {
//   loading,
//   loaded,
//   toggleFavorite,
//   adding,
//   added,
//   failure,
// }

// class CreatedListState extends Equatable {
//   const CreatedListState._({
//     this.status = CreatedListStatus.loading,
//     this.workouts = const [],
//     this.workout,
//   });

//   const CreatedListState.loading() : this._();

//   const CreatedListState.loaded({required List<Workout> workouts})
//       : this._(status: CreatedListStatus.loaded, workouts: workouts);

//   const CreatedListState.failure() : this._(status: CreatedListStatus.failure);

//   const CreatedListState.adding() : this._(status: CreatedListStatus.adding);

//   const CreatedListState.added({required Workout newWorkout})
//       : this._(status: CreatedListStatus.added, workout: newWorkout);

//   const CreatedListState.toggleFavorite({required Workout workout})
//       : this._(status: CreatedListStatus.toggleFavorite, workout: workout);

//   final CreatedListStatus status;
//   final List<Workout> workouts;
//   final Workout? workout;

//   @override
//   List<Object?> get props => [status, workouts, workout];

//   @override
//   String toString() =>
//       'CreatedListState ( status: $status, workouts: ${workouts.length} )';
// }
