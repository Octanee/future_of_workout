import 'package:exercise_api/exercise_api.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class TestExerciseApi extends ExerciseApi {
  TestExerciseApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('ExerciseApi', () {
    test('can be constructed', () {
      expect(TestExerciseApi.new, returnsNormally);
    });
  });
}
