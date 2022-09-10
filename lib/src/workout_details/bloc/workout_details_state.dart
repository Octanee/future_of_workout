// part of 'workout_details_bloc.dart';

// enum WorkoutDetailsStatus {
//   initial,
//   loading,
//   updating,
//   delete,
//   success,
//   failure,
// }

// class WorkoutDetailsState extends Equatable {
//   const WorkoutDetailsState({
//     this.workout,
//     this.status = WorkoutDetailsStatus.loading,
//   });

//   final WorkoutDetailsStatus status;
//   final Workout? workout;

//   WorkoutDetailsState copyWith({
//     WorkoutDetailsStatus? status,
//     Workout? workout,
//   }) {
//     return WorkoutDetailsState(
//       status: status ?? this.status,
//       workout: workout ?? this.workout,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         status,
//         workout,
//       ];
// }
