import 'dart:async';

import '../../models/exercise.dart';

abstract class ExerciseRepository {
  final _controller = StreamController<List<Exercise>>();

  Stream<List<Exercise>> get exercises => _controller.stream;

  void addToStream({required List<Exercise> exerises}) {
    _controller.sink.add(exerises);
  }

  

  void dispose() {
    _controller.close();
  }
}
