import 'package:collection/collection.dart';
import 'package:exercise_api/exercise_api.dart';

part 'instructions_en.dart';
part 'instructions_pl.dart';

/// The interface for a instructions of exercises.
abstract class Instructions {
  /// Get instructions by exercise id.
  List<String> get({required String id}) {
    final exercise = DefaultExercise.values
        .firstWhereOrNull((element) => element.name == id);

    switch (exercise) {
      case null:
        return [];
      case DefaultExercise.barbellBenchPress:
        return _barbellBenchPress;
      case DefaultExercise.squat:
        return _squat;
      case DefaultExercise.deadlift:
        return _deadlift;
    }
  }

  /// Return a instance of Instruction
  /// for given language code.
  ///
  /// Supported languages:
  /// `en`, 'pl.
  static Instructions getInstructionsByLanguageCode({
    required String languageCode,
  }) {
    switch (languageCode) {
      case 'en':
        return InstructionsEn();
      case 'pl':
        return InstructionsPl();
    }
    return InstructionsEn();
  }

  List<String> get _barbellBenchPress;

  List<String> get _deadlift;

  List<String> get _squat;
}
