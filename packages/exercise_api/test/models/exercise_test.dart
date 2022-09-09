import 'package:exercise_api/exercise_api.dart';
import 'package:test/test.dart';

void main() {
  group('Exercise', () {
    Exercise createSubject({
      String? id = '1',
      String name = 'name',
      Muscle primaryMuscle = Muscle.chest,
      String imagePath = 'imagePath',
      String imagePathSecondary = 'imagePathSecondary',
    }) {
      return Exercise(
        id: id,
        name: name,
        primaryMuscle: primaryMuscle,
        imagePath: imagePath,
        imagePathSecondary: imagePathSecondary,
      );
    }

    group('contructor', () {
      test('works correctly', () {
        expect(createSubject, returnsNormally);
      });

      group('id', () {
        test('throws AssertionError when "id" is empty', () {
          expect(() => createSubject(id: ''), throwsA(isA<AssertionError>()));
        });

        test('sets "id" if not provided', () {
          expect(createSubject(id: null).id, isNotEmpty);
        });
      });

      test('throws AssertionError when "name" is empty', () {
        expect(() => createSubject(name: ''), throwsA(isA<AssertionError>()));
      });

      test('throws AssertionError when "imagePath" is empty', () {
        expect(
          () => createSubject(imagePath: ''),
          throwsA(isA<AssertionError>()),
        );
      });

      test('throws AssertionError when "imagePathSecondary" is empty', () {
        expect(
          () => createSubject(imagePathSecondary: ''),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(createSubject().copyWith(), equals(createSubject()));
      });

      test('replaces every parameter', () {
        expect(
          createSubject().copyWith(
            id: '2',
            name: 'new name',
            primaryMuscle: Muscle.abs,
            imagePath: 'new imagePath',
            imagePathSecondary: 'new imagePathSecondary',
          ),
          equals(
            createSubject(
              id: '2',
              name: 'new name',
              primaryMuscle: Muscle.abs,
              imagePath: 'new imagePath',
              imagePathSecondary: 'new imagePathSecondary',
            ),
          ),
        );
      });
    });
  });
}
