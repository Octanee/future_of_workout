import 'dart:async';
import 'dart:developer';

import 'package:future_of_workout/src/data/models/models.dart';

abstract class BaseWorkoutRepository {
  StreamController<List<Workout>> _controller =
      StreamController<List<Workout>>();

  Stream<List<Workout>> get workouts => _controller.stream;

  void addToStream({required List<Workout> workouts}) {
    log('WorkoutRepository: addToStream { ${workouts.length} }');
    _controller.sink.add(workouts);
  }

  void dispose() {
    _controller.close();
  }

  void flush() {
    if (_controller.hasListener) {
      _controller.close();
      _controller = StreamController<List<Workout>>();
    }
  }

  Future<void> fetchAll();
  Future<Workout> createWorkout();
  Future<void> removeWorkout({required String id});
  Future<Workout> getOne({required String id});
  Future<void> updateWorkout({required Workout workout});
}
