import 'package:exercise_api/exercise_api.dart';

/// {@template exercise_api}
/// The interface for an API that provides access to a list of exercises.
/// {@endtemplate}
abstract class ExerciseApi {
  /// {@macro exercise_api}
  const ExerciseApi();

  /// Provides a [Stream] of all exercises.
  Stream<List<Exercise>> getExercises();

}
