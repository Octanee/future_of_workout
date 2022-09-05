import 'dart:async';

import '../../../data/models/models.dart';

abstract class BaseExerciseRepository {
  final _controller = StreamController<List<Exercise>>();

  Stream<List<Exercise>> get exercises => _controller.stream;

  void addToStream({required List<Exercise> exerises}) {
    _controller.sink.add(exerises);
  }

  Future<void> fetchAll();
  Future<Exercise?> getById({required String id});
  Future<Exercise?> getByName({required String name});

  void dispose() {
    _controller.close();
  }
}
