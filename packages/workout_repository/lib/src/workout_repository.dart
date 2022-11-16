import 'package:workout_api/workout_api.dart';

/// {@template workout_repository}
/// A repository that handles plans related requests.
/// {@endtemplate}
class WorkoutRepository {
  /// {@macro workout_repository}
  const WorkoutRepository({required WorkoutApi workoutApi})
      : _workoutApi = workoutApi;

  final WorkoutApi _workoutApi;

  /// Provides a [Stream] of all plans
  Stream<List<Plan>> getPlans() => _workoutApi.getPlans();

  /// Provides a [Stream] of specific plan
  Stream<Plan> getPlanStream({required String id}) =>
      _workoutApi.getPlanStream(id: id);

  /// Get the plan with the given `id`.
  ///
  /// If no [Plan] with the given `id` exists,
  /// a [PlanNotFoundException] error is thrown.
  Plan getPlan({required String id}) => _workoutApi.getPlan(id: id);

  /// Saves a `plan`.
  ///
  /// If a `plan` with the same `id` already exists,
  /// it will be replaced.
  Future<void> savePlan(Plan plan) => _workoutApi.savePlan(plan);

  /// Deletes the [Plan] with the given `id`.
  ///
  /// If no [Plan] with the given `id` exists,
  /// a [PlanNotFoundException] erros is thrown.
  Future<void> deletePlan(String id) => _workoutApi.deletePlan(id);
}
