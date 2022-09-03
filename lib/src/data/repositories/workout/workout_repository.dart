import 'dart:async';

import '../../models/models.dart';

abstract class WorkoutRepository {
  final _controller = StreamController<List<Workout>>();

  Stream<List<Workout>> get workouts => _controller.stream;

  void addToStream({required List<Workout> workouts}) =>
      _controller.sink.add(workouts);

  Future<void> fetchAll();
  Future<Workout> createWorkout();
  Future<void> removeWorkout({required String id});
  Future<Workout?> getOne({required String id});
  Future<Workout?> toggleFavorite({required String id});

  void dispose() {
    _controller.close();
  }
}
