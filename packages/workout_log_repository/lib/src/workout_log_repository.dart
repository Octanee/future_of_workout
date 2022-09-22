import 'package:workout_log_api/workout_log_api.dart';

/// {@template workout_log_repository}
/// A repository that handles workout log related requests.
/// {@endtemplate}
class WorkoutLogRepository {
  /// {@macro workout_log_repository}
  const WorkoutLogRepository({required WorkoutLogApi workoutLogApi})
      : _workoutLogApi = workoutLogApi;

  final WorkoutLogApi _workoutLogApi;

  /// Provides a [Stream] of all workouts Logs.
  Stream<List<WorkoutLog>> getWorkoutLogs() => _workoutLogApi.getWorkoutLogs();

  /// Provides a [Stream] of specific workout log.
  Stream<WorkoutLog?> getWorkout({required String id}) =>
      _workoutLogApi.getWorkout(id: id);

  /// Provides a [Stream] of specific workout log.
  Stream<WorkoutLog?> getCurrentWorkout() => _workoutLogApi.getCurrentWorkout();

  /// Get the workout log with the given `id`.
  ///
  /// If no log with the given `id` exists,
  /// a [WorkoutLogNotFoundException] error is thrown.
  WorkoutLog get({required String id}) => _workoutLogApi.get(id: id);

  /// Save a [workoutLog].
  ///
  /// If log with the given `id` already exists,
  /// it will be replaced.
  Future<void> saveWorkoutLog({required WorkoutLog workoutLog}) =>
      _workoutLogApi.saveWorkoutLog(workoutLog: workoutLog);

  /// Deletes a `workoutLog` with the given [id].
  ///
  /// If no workout log with the given [id] exists,
  /// a [WorkoutLogNotFoundException] error is thrown.
  Future<void> deleteWorkoutLog({required String id}) =>
      _workoutLogApi.deleteWorkoutLog(id: id);
}
