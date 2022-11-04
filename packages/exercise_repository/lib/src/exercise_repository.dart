import 'package:exercise_api/exercise_api.dart';

/// {@template exercise_repository}
/// A repository that handles exercise related requests.
/// {@endtemplate}
class ExerciseRepository {
  /// {@macro exercise_repository}
  ExerciseRepository({
    required ExerciseApi exerciseApi,
  }) : _exerciseApi = exerciseApi;

  final ExerciseApi _exerciseApi;

  /// Instance of instruction for current locales
  Instructions? instructions;

  /// Setup instructions by languageCode
  void initInstructions({required String languageCode}) {
    instructions =
        Instructions.getInstructionsByLanguageCode(languageCode: languageCode);
  }

  /// Provides a [Stream] of all exercises
  Stream<List<Exercise>> getExercises() => _exerciseApi.getExercises();

  /// Get the exercise with the given `id`.
  ///
  /// If no exercise with the given `id` exists,
  /// a [ExerciseNotFoundException] error is thrown.
  Exercise get({required String id}) => _exerciseApi.get(id: id);

  /// Get instructions of exercise with the given `id`
  ///
  /// If no exercise with the given `id` exists
  /// or there are no instructions,
  /// return empty array.
  List<String> getInstructions({required String id}) =>
      instructions?.get(id: id) ?? [];
}
