// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';

// import 'package:future_of_workout/src/data/models/exercise.dart';
// import 'package:future_of_workout/src/data/repositories/repositories.dart';

// part 'workout_exercises_list_state.dart';

// class WorkoutExercisesListCubit extends Cubit<WorkoutExercisesListState> {
//   WorkoutExercisesListCubit({
//     required this.workoutId,
//     required this.exerciseRepository,
//     required this.workoutRepository,
//   }) : super(const WorkoutExercisesListState.loading()) {
//     _subscribe();
//   }

//   final String workoutId;

//   final BaseExerciseRepository exerciseRepository;
//   final BaseWorkoutRepository workoutRepository;

//   late final StreamSubscription<List<Exercise>> _subscription;

//   Future<void> fetchList() async {
//     try {
//       emit(const WorkoutExercisesListState.loading());
//       await exerciseRepository.fetchAll();
//     } catch (e) {
//       emit(const WorkoutExercisesListState.failure());
//     }
//   }

//   void _subscribe() {
//     exerciseRepository.flush();
//     _subscription = exerciseRepository.exercises.listen(
//       (exercises) {
//         emit(WorkoutExercisesListState.loaded(exercises: exercises));
//       },
//       onError: (error) => emit(
//         const WorkoutExercisesListState.failure(),
//       ),
//     );
//   }

//   @override
//   Future<void> close() {
//     _subscription.cancel();
//     return super.close();
//   }
// }
