import 'dart:async';

import 'package:future_of_workout/src/data/models/models.dart';

abstract class BaseExerciseRepository {
  StreamController<List<Exercise>> _controller =
      StreamController<List<Exercise>>();

  Stream<List<Exercise>> get exercises =>
      _controller.stream.asBroadcastStream();

  void addToStream({required List<Exercise> exerises}) {
    _controller.sink.add(exerises);
  }

  void dispose() {
    _controller.close();
  }

  void flush() {
    if (_controller.hasListener) {
      _controller.close();
      _controller = StreamController<List<Exercise>>();
    }
  }

  Future<void> fetchAll();
  Future<Exercise> getById({required String id});
  Future<Exercise> getByName({required String name});
}
