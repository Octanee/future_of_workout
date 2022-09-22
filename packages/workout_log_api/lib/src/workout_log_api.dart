import 'package:workout_log_api/workout_log_api.dart';

/// {@template workout_log_api}
/// The interface for an API providing access to list of workout logs.
/// {@endtemplate}
abstract class WorkoutLogApi {
  /// {@macro workout_log_api}
  const WorkoutLogApi();

  /// Provides a [Stream] of all workouts Logs.
  Stream<List<WorkoutLog>> getWorkoutLogs();

  /// Provides a [Stream] of specific workout log.
  Stream<WorkoutLog?> getWorkout({required String id});

  /// Provides a [Stream] of specific workout log.
  Stream<WorkoutLog?> getCurrentWorkout();

  /// Get the workout log with the given `id`.
  ///
  /// If no log with the given `id` exists,
  /// a [WorkoutLogNotFoundException] error is thrown.
  WorkoutLog get({required String id});

  /// Save a [workoutLog].
  ///
  /// If log with the given `id` already exists,
  /// it will be replaced.
  Future<void> saveWorkoutLog({required WorkoutLog workoutLog});

  /// Deletes a `workoutLog` with the given [id].
  ///
  /// If no workout log with the given [id] exists,
  /// a [WorkoutLogNotFoundException] error is thrown.
  Future<void> deleteWorkoutLog({required String id});
}
