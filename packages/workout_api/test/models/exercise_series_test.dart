import 'package:test/test.dart';
import 'package:workout_api/src/models/exercise_series.dart';

void main() {
  group('Exercise series', () {
    ExerciseSeries createSubject({
      double weight = 1,
      int reps = 2,
      int rest = 3,
    }) {
      return ExerciseSeries(
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
