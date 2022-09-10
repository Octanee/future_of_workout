// // ignore_for_file: lines_longer_than_80_chars

// part of 'workout_exercises_list_cubit.dart';

// enum WorkoutExercisesListStatus {
//   loading,
//   loaded,
//   failure,
// }

// class WorkoutExercisesListState extends Equatable {
//   const WorkoutExercisesListState._({
//     this.status = WorkoutExercisesListStatus.loading,
//     this.exercises = const [],
//   });

//   const WorkoutExercisesListState.loading() : this._();

//   const WorkoutExercisesListState.loaded({required List<Exercise> exercises})
//       : this._(status: WorkoutExercisesListStatus.loaded, exercises: exercises);

//   const WorkoutExercisesListState.failure()
//       : this._(status: WorkoutExercisesListStatus.failure);

//   final WorkoutExercisesListStatus status;
//   final List<Exercise> exercises;

//   @override
//   List<Object> get props => [status, exercises];

//   @override
//   String toString() =>
//       'WorkoutExercisesListState(status: $status, exercises: ${exercises.length})';
// }
