import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/models.dart';
import '../../../repositories/repositories.dart';

part 'workout_exercises_list_state.dart';

class WorkoutExercisesListCubit extends Cubit<WorkoutExercisesListState> {
  WorkoutExercisesListCubit({
    required Workout workout,
    required this.exerciseRepository,
    required this.workoutRepository,
  }) : super(WorkoutExercisesListInitial());

  final BaseExerciseRepository exerciseRepository;
  final FakeWorkoutRepository workoutRepository;
}
