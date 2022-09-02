import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/models.dart';
import '../../../../data/repositories/repositories.dart';

part 'created_list_state.dart';

class CreatedListCubit extends Cubit<CreatedListState> {
  CreatedListCubit({required this.repository})
      : super(const CreatedListState.loading()) {
    _subscribe();
  }

  final WorkoutRepository repository;
  late final StreamSubscription _subscription;

  Future<void> fetchList() async {
    try {
      emit(const CreatedListState.loading());
      await repository.fetchAll();
    } on Exception {
      emit(const CreatedListState.failure());
    }
  }

  void _subscribe() {
    _subscription = repository.workouts.listen(
      (workouts) {
        emit(CreatedListState.success(workouts: workouts));
      },
      onError: (error) => emit(const CreatedListState.failure()),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
