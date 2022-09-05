import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../data/models/models.dart';
import '../../../../repositories/repositories.dart';


part 'created_list_state.dart';

class CreatedListCubit extends Cubit<CreatedListState> {
  CreatedListCubit({required this.repository})
      : super(const CreatedListState.loading()) {
    _subscribe();
  }

  final BaseWorkoutRepository repository;
  late final StreamSubscription _subscription;

  Future<void> fetchList() async {
    try {
      emit(const CreatedListState.loading());
      await repository.fetchAll();
    } catch (e) {
      emit(const CreatedListState.failure());
    }
  }

  Future<void> createWorkout() async {
    try {
      emit(const CreatedListState.adding());
      final workout = await repository.createWorkout();
      emit(CreatedListState.added(newWorkout: workout));
      await fetchList();
    } catch (e) {
      const CreatedListState.failure();
    }
  }

  Future<void> toggleFavorite({required Workout workout}) async {
    try {
      final temp = workout.copyWith(isFavorite: !workout.isFavorite);
      await repository.updateWorkout(workout: temp);
      emit(CreatedListState.toggleFavorite(workout: temp));
      await fetchList();
    } catch (e) {}
  }

  void _subscribe() {
    _subscription = repository.workouts.listen(
      (workouts) {
        emit(CreatedListState.loaded(workouts: workouts));
      },
      onError: (error) => emit(const CreatedListState.failure()),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    repository.dispose();
    return super.close();
  }
}
