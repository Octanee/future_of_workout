import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../models/models.dart';
import '../../../../../repositories/repositories.dart';

part 'created_list_state.dart';

class CreatedListCubit extends Cubit<CreatedListState> {
  CreatedListCubit({required this.repository})
      : super(const CreatedListState.loading());

  final WorkoutRepository repository;

  Future<void> fetchList() async {
    try {
      final workouts = await repository.fetchWorkouts();
      emit(CreatedListState.success(workouts: workouts));
    } on Exception {
      emit(const CreatedListState.failure());
    }
  }

  Future<void> addWorkout({required Workout workout}) async {
    await repository.addWorkout(workout: workout);
    await fetchList();
  }
}
