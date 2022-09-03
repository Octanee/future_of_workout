import 'dart:developer';

import 'package:uuid/uuid.dart';

import '../../models/models.dart';
import '../repositories.dart';

class FakeWorkoutRepository extends WorkoutRepository {
  List<Workout> _workouts = [];

  @override
  Future<void> fetchAll() async {
    if (_workouts.isEmpty) {
      log('FakeWorkoutRepository empty list');
      await Future.delayed(
        const Duration(seconds: 1),
        () => _workouts = List.generate(
          3,
          (index) => Workout(
            id: const Uuid().v1(),
            name: 'Workout $index',
            body: const Body(),
          ),
        ),
      );
    }

    addToStream(workouts: _workouts);
  }

  @override
  Future<Workout?> getOne({required String id}) async {
    if (_workouts.isEmpty) {
      await fetchAll();
    }

    try {
      return _workouts.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Workout?> toggleFavorite({required String id}) async {
    final item = await getOne(id: id);
    if (item == null) {
      return null;
    }

    final toggledWorkout = item.copyWith(isFavorite: !item.isFavorite);
    _updateWorkoutsWith(workout: toggledWorkout);

    addToStream(workouts: _workouts);

    return toggledWorkout;
  }

  @override
  Future<Workout> createWorkout() async {
    try {
      final workout = Workout(
        id: const Uuid().v1(),
        name: 'Workout',
        body: const Body(),
      );

      _workouts.add(workout);

      addToStream(workouts: _workouts);

      return workout;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> removeWorkout({required String id}) async {
    final index = _workouts.indexWhere((element) => element.id == id);
    if (index != -1) {
      _workouts.removeAt(index);
    }

    addToStream(workouts: _workouts);
  }

  void _updateWorkoutsWith({required Workout workout}) {
    final index = _workouts.indexWhere((element) => element.id == workout.id);
    if (index != -1) {
      _workouts[index] = workout;
    }
  }
}
