import 'package:goal_api/goal_api.dart';

/// {@template goal_repository}
/// A repository that handles goal related requests.
/// {@endtemplate}
class GoalRepository {
  /// {@macro goal_repository}
  const GoalRepository({required GoalApi goalApi}) : _goalApi = goalApi;

  final GoalApi _goalApi;

  /// Provides a [Stream] of all goals
  Stream<List<Goal>> getgoals() => _goalApi.getGoals();

  /// Get the goal with the given `id`.
  ///
  /// If no goal with the given `id` exists,
  /// a [GoalNotFoundException] error is thrown.
  Goal get({required String id}) => _goalApi.get(id: id);

  /// Saves a [Goal].
  ///
  /// If a [Goal] with the same `id` already exists,
  /// it will be replaced.
  Future<void> saveGoal(Goal goal) => _goalApi.saveGoal(goal);

  /// Deletes the `goal` with the given [id].
  ///
  /// If no goal with the given [id] exists,
  /// a [GoalNotFoundException] erros is thrown.
  Future<void> deleteGoal(String id) => _goalApi.deleteGoal(id);
}
