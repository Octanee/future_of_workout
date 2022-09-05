import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/workout.dart';
import '../../../data/repositories/exercise/exercise_repository.dart';
import '../../../data/repositories/workout/fake_workout_repository.dart';

part 'workout_exercises_list_state.dart';

class WorkoutExercisesListCubit extends Cubit<WorkoutExercisesListState> {
  WorkoutExercisesListCubit({
    required Workout workout,
    required this.exerciseRepository,
    required this.workoutRepository,
  }) : super(WorkoutExercisesListInitial());

  final ExerciseRepository exerciseRepository;
  final FakeWorkoutRepository workoutRepository;
}
