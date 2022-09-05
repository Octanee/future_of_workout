import 'dart:async';
import 'dart:developer';

import '../../../data/models/models.dart';

abstract class BaseWorkoutRepository {
  final _controller = StreamController<List<Workout>>();

  Stream<List<Workout>> get workouts => _controller.stream;

  void addToStream({required List<Workout> workouts}) {
    log('WorkoutRepository: addToStream { ${workouts.length} }');
    _controller.sink.add(workouts);
  }

  Future<void> fetchAll();
  Future<Workout> createWorkout();
  Future<void> removeWorkout({required String id});
  Future<Workout?> getOne({required String id});
  Future<void> updateWorkout({required Workout workout});

  void dispose() {
    _controller.close();
  }
}
