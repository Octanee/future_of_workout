import 'dart:async';

import '../../models/models.dart';

abstract class WorkoutRepository {
  final _controller = StreamController<List<WorkoutBase>>();

  Stream<List<WorkoutBase>> get workouts =>
      _controller.stream;

  void addToStream({required List<WorkoutBase> workouts}) =>
      _controller.sink.add(workouts);

  Future<void> fetchAll();
  Future<WorkoutBase> createWorkout();
  Future<void> removeWorkout({required String id});
  Future<WorkoutBase?> getOne({required String id});
  Future<WorkoutBase?> toggleFavorite({required String id});

  void dispose() {
    _controller.close();
  }
}
