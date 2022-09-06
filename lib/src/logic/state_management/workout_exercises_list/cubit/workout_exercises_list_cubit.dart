import 'dart:async';

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
  }) : super(const WorkoutExercisesListState.loading()) {
    _subscribe();
  }

  final FakeExerciseRepository exerciseRepository;
  final FakeWorkoutRepository workoutRepository;

  late final StreamSubscription _subscription;

  Future<void> fetchList() async {
    try {
      emit(const WorkoutExercisesListState.loading());
      await exerciseRepository.fetchAll();
    } catch (e) {
      emit(const WorkoutExercisesListState.failure());
    }
  }

  void _subscribe() {
    exerciseRepository.flush();
    _subscription = exerciseRepository.exercises.listen(
      (exercises) {
        emit(WorkoutExercisesListState.loaded(exercises: exercises));
      },
      onError: (error) => emit(
        const WorkoutExercisesListState.failure(),
      ),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
