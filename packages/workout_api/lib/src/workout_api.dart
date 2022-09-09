import 'package:workout_api/src/exceptions/exceptions.dart';
import 'package:workout_api/src/models/models.dart';

/// {@template todos_api}
/// The interface for an API that provides access to a list of workouts.
/// {@endtemplate}
abstract class WorkoutApi {
  /// {@macro todos_api}
  const WorkoutApi();

  /// Provides a [Stream] of all workouts.
  Stream<List<Workout>> getWorkouts();

  /// Get the exercise with the given `id`.
  ///
  /// If no exercise with the given `id` exists,
  /// a [WorkoutNotFoundException] error is thrown.
  Workout get({required String id});

  /// Saves a [workout].
  /// 
  /// If a [workout] with the same `id` already exists,
  /// it will be replaced.
  Future<void> saveWorkout(Workout workout);

  /// Deletes the `workout` with the given [id].
  /// 
  /// If no workout with the given [id] exists,
  /// a [WorkoutNotFoundException] erros is thrown.
  Future<void> deleteWorkout(String id);
}
