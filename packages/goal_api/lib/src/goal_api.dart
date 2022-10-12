import 'package:goal_api/goal_api.dart';

/// {@template goal_api}
/// The interface for an API that provides access to a list of goals.
/// {@endtemplate}
abstract class GoalApi {
  /// {@macro exercise_api}
  const GoalApi();

  /// Provides a [Stream] of all exercises.
  Stream<List<Goal>> getGoals();

  /// Get the exercise with the given `id`.
  ///
  /// If no exercise with the given `id` exists,
  /// a [GoalNotFoundException] error is thrown.
  Goal get({required String id});

  /// Saves a [Goal].
  ///
  /// If a [Goal] with the same `id` already exists,
  /// it will be replaced.
  Future<void> saveGoal(Goal goal);

  /// Deletes the `goal` with the given [id].
  ///
  /// If no goal with the given [id] exists,
  /// a [GoalNotFoundException] erros is thrown.
  Future<void> deleteGoal(String id);
}
