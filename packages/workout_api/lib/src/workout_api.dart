import 'package:workout_api/src/exceptions/exceptions.dart';
import 'package:workout_api/src/models/models.dart';

/// {@template workout_api}
/// The interface for an API that provides access to a list of plan.
/// {@endtemplate}
abstract class WorkoutApi {
  /// {@macro workout_api}
  const WorkoutApi();

  /// Provides a [Stream] of all plans.
  Stream<List<Plan>> getPlans();

  /// Provides a [Stream] of specific plan.
  Stream<Plan?> getPlanStream({required String id});

  /// Get the plan with the given `id`.
  ///
  /// If no plan with the given `id` exists,
  /// a [PlanNotFoundException] error is thrown.
  Plan getPlan({required String id});

  /// Saves a `plan`.
  ///
  /// If a `plan` with the same `id` already exists,
  /// it will be replaced.
  Future<void> savePlan(Plan plan);

  /// Deletes the [Plan] with the given `id`.
  ///
  /// If no plan with the given `id` exists,
  /// a [PlanNotFoundException] erros is thrown.
  Future<void> deletePlan(String id);

  // /// Provides a [Stream] of all workouts.
  // Stream<List<Workout>> getWorkouts();

  // /// Provides a [Stream] of specific workout.
  // Stream<Workout?> getWorkout({required String id});

  // /// Get the exercise with the given `id`.
  // ///
  // /// If no exercise with the given `id` exists,
  // /// a [WorkoutNotFoundException] error is thrown.
  // Workout get({required String id});

  // /// Saves a [workout].
  // ///
  // /// If a [workout] with the same `id` already exists,
  // /// it will be replaced.
  // Future<void> saveWorkout(Workout workout);

  // /// Deletes the `workout` with the given [id].
  // ///
  // /// If no workout with the given [id] exists,
  // /// a [WorkoutNotFoundException] erros is thrown.
  // Future<void> deleteWorkout(String id);
}
