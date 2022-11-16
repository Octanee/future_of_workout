import 'package:workout_api/workout_api.dart';

/// Error thrown when a [Workout] with the given `id` is not found.
class WorkoutNotFoundException implements Exception {}

/// Error thrown when a [WorkoutExercise] with the given `id` is not found.
class WorkoutExerciseNotFoundException implements Exception {}

/// Error thrown when a [Plan] with the given `id` is not found.
class PlanNotFoundException implements Exception {}
