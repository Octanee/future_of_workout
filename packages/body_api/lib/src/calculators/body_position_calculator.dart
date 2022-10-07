import 'package:body_api/body_api.dart';

/// Helper class to calculate a position on displayed body.
class BodyPositionCalculator {
  BodyPositionCalculator._();

  /// Calculate body position for the given `muscles`.
  static BodyPosition calculate(Map<Muscle, int> muscles) {
    final keys = <Muscle>[];

    muscles.forEach((key, value) {
      if (value > 0) keys.add(key);
    });

    BodyPosition? getHigher({
      required BodyPosition a,
      required BodyPosition b,
    }) {
      final aValue = a.contains(muscles: keys);
      final bValue = b.contains(muscles: keys);

      if (aValue == bValue) return null;

      return aValue > bValue ? a : b;
    }

    final fullPosition =
        getHigher(a: BodyPosition.front, b: BodyPosition.back) ??
            BodyPosition.front;

    final BodyPosition? partPosition;

    if (fullPosition == BodyPosition.front) {
      partPosition =
          getHigher(a: BodyPosition.frontUpper, b: BodyPosition.frontLower);
    } else {
      partPosition =
          getHigher(a: BodyPosition.backUpper, b: BodyPosition.backLower);
    }

    return partPosition ?? fullPosition;
  }
}
