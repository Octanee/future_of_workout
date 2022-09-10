import 'package:workout_api/workout_api.dart';

/// {@template workout_repository}
/// A repository that handles exercise related requests.
/// {@endtemplate}
class WorkoutRepository {
  /// {@macro workout_repository}
  const WorkoutRepository({required WorkoutApi workoutApi})
      : _workoutApi = workoutApi;

  final WorkoutApi _workoutApi;

  /// Provides a [Stream] of all workouts
  Stream<List<Workout>> getWorkouts() => _workoutApi.getWorkouts();

  /// Get the exercise with the given `id`.
  ///
  /// If no exercise with the given `id` exists,
  /// a [WorkoutNotFoundException] error is thrown.
  Workout get({required String id}) => _workoutApi.get(id: id);

  /// Saves a [workout].
  /// 
  /// If a [workout] with the same `id` already exists,
  /// it will be replaced.
  Future<void> saveWorkout(Workout workout) => _workoutApi.saveWorkout(workout);

  /// Deletes the `workout` with the given [id].
  /// 
  /// If no workout with the given [id] exists,
  /// a [WorkoutNotFoundException] erros is thrown.
  Future<void> deleteWorkout(String id) => _workoutApi.deleteWorkout(id);
}
