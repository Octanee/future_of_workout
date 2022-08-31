import 'package:uuid/uuid.dart';

import '../models/models.dart';

class WorkoutRepository {
  final _workouts = List.generate(
    3,
    (index) => Workout(id: const Uuid().v1(), name: 'Workout $index'),
  );

  Future<List<Workout>> fetchWorkouts() async => Future.delayed(
        const Duration(seconds: 1),
        () => _workouts,
      );

  Future<void> addWorkout({required Workout workout}) async => Future.delayed(
        const Duration(seconds: 1),
        () => _workouts.add(workout),
      );

  Future<void> deleteWorkout({required Workout workout}) async =>
      Future.delayed(
        const Duration(seconds: 1),
        () => _workouts.remove(workout),
      );
}
