import 'package:test/test.dart';
import 'package:workout_api/src/models/exercise_series.dart';

void main() {
  group('Exercise series', () {
    ExerciseSeries createSubject({
      int index = 1,
      double weight = 1,
      int reps = 2,
      int rest = 3,
    }) {
      return ExerciseSeries(
        index: index,
        weight: weight,
        reps: reps,
        rest: rest,
      );
    }

    group('contructor', () {
      test('works correctly', () {
        expect(createSubject, returnsNormally);
      });
    });
  });
}
