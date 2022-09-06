import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/models.dart';
import '../../../repositories/repositories.dart';

part 'workout_exercise_details_state.dart';

class WorkoutExerciseDetailsCubit extends Cubit<WorkoutExerciseDetailsState> {
  WorkoutExerciseDetailsCubit({
    required this.exerciseRepository,
    required this.workoutRepository,
    required this.exerciseId,
    required this.workoutId,
    required this.isNew,
  }) : super(const WorkoutExerciseDetailsState());

  final String workoutId;
  final String exerciseId;
  final bool isNew;

  final BaseExerciseRepository exerciseRepository;
  final BaseWorkoutRepository workoutRepository;

  Future<void> fetchWorkoutExercise() async {
    try {
      final exercise = await exerciseRepository.getById(id: exerciseId);

      final workoutExercise = WorkoutExercise(exercise: exercise);

      emit(state.copyWith(
        status: WorkoutExerciseDetailsStatus.loaded,
        workoutExercise: workoutExercise,
      ));
    } catch (e) {
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.failure));
    }
  }

  void addSeries() {
    try {
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.adding));

      final workoutExercise = state.workoutExercise!;

      final WorkoutExercise temp;
      if (workoutExercise.seriesOfExercise.isEmpty) {
        temp = workoutExercise.copyWith(seriesOfExercise: [
          const ExerciseSeries(index: 1),
        ]);
      } else {
        final series = List.of(workoutExercise.seriesOfExercise);

        final lastSeries = series.last;
        final newSeries = lastSeries.copyWith(index: lastSeries.index + 1);
        
        final list = series..add(newSeries);

        temp = workoutExercise.copyWith(seriesOfExercise: list);
      }

      emit(state.copyWith(
        status: WorkoutExerciseDetailsStatus.added,
        workoutExercise: temp,
      ));
    } catch (e) {
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.failure));
    }
  }

  Future<void> saveWorkoutExercise() async {
    try {
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.saving));

      final workout = await workoutRepository.getOne(id: workoutId);

      final list = List<WorkoutExercise>.from(workout.workoutExercises);
      final workoutExerciseIndex = list.indexWhere(
        (element) => element.exercise == state.workoutExercise!.exercise,
      );

      if (workoutExerciseIndex == -1) {
        list.add(state.workoutExercise!);
      } else {
        list[workoutExerciseIndex] = state.workoutExercise!;
      }

      final temp = workout.copyWith(workoutExercises: list);

      workoutRepository.updateWorkout(workout: temp);

      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.saved));
    } catch (e) {
      emit(state.copyWith(status: WorkoutExerciseDetailsStatus.failure));
    }
  }
}
