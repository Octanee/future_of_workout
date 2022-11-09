import 'package:exercise_api/exercise_api.dart';
import 'package:rxdart/rxdart.dart';

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
  Stream<List<Exercise>> getExercises() {
    final defaultExercises =
        Stream.value(DefaultExerciseProvider.defaultExercises);
    final createdExercises = _exerciseApi.getExercises();

    return Rx.combineLatest2<List<Exercise>, List<Exercise>, List<Exercise>>(
      defaultExercises,
      createdExercises,
      (List<Exercise> a, List<Exercise> b) => a + b,
    );
  }

  /// Get the exercise with the given `id`.
  ///
  /// If no exercise with the given `id` exists,
  /// a [ExerciseNotFoundException] error is thrown.
  Exercise get({required String id}) {
    try {
      final exercise = DefaultExerciseProvider.defaultExercises.firstWhere(
        (element) => element.id == id,
        orElse: () => _exerciseApi.get(id: id),
      );
      return exercise;
    } catch (_) {
      throw ExerciseNotFoundException();
    }
  }

  /// Get instructions of exercise with the given `id`
  ///
  /// If no exercise with the given `id` exists
  /// or there are no instructions,
  /// return empty array.
  List<String> getInstructions({required String id}) =>
      instructions?.get(id: id) ?? [];
}
