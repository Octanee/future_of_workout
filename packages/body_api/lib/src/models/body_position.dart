import 'dart:collection';

import 'package:body_api/body_api.dart';

/// Different body positions
enum BodyPosition {
  /// Full body of front muscles.
  front(
    muscles: [
      Muscle.neck,
      Muscle.abs,
      Muscle.biceps,
      Muscle.chest,
      Muscle.obliques,
      Muscle.serratus,
      Muscle.shoulders,
      Muscle.trapezius,
      Muscle.forearm,
      Muscle.abductors,
      Muscle.adductors,
      Muscle.calf,
      Muscle.quadriceps,
    ],
  ),

  /// Upper body from the front.
  frontUpper(
    muscles: [
      Muscle.neck,
      Muscle.abs,
      Muscle.biceps,
      Muscle.chest,
      Muscle.obliques,
      Muscle.serratus,
      Muscle.shoulders,
      Muscle.trapezius,
      Muscle.forearm,
    ],
  ),

  /// Lower body from the front.
  frontLower(
    muscles: [
      Muscle.abductors,
      Muscle.adductors,
      Muscle.calf,
      Muscle.quadriceps,
    ],
  ),

  /// Full body of back muscles.
  back(
    muscles: [
      Muscle.forearm,
      Muscle.neck,
      Muscle.erectorSpinae,
      Muscle.lattisimus,
      Muscle.obliques,
      Muscle.shoulders,
      Muscle.teresMajor,
      Muscle.trapezius,
      Muscle.triceps,
      Muscle.abductors,
      Muscle.adductors,
      Muscle.calf,
      Muscle.glutes,
      Muscle.hamstering,
    ],
  ),

  /// Upper body from the back.
  backUpper(
    muscles: [
      Muscle.forearm,
      Muscle.neck,
      Muscle.erectorSpinae,
      Muscle.lattisimus,
      Muscle.obliques,
      Muscle.shoulders,
      Muscle.teresMajor,
      Muscle.trapezius,
      Muscle.triceps,
    ],
  ),

  /// Lower body from the back.
  backLower(
    muscles: [
      Muscle.abductors,
      Muscle.adductors,
      Muscle.calf,
      Muscle.glutes,
      Muscle.hamstering,
    ],
  );

  /// Construcor
  const BodyPosition({this.muscles = const []});

  /// List of muscle groups visible in specific position.
  final List<Muscle> muscles;

  /// Calculate body position for the given `muscles`.
  static BodyPosition calculate(Map<Muscle, int> muscles) {
    final keys = <Muscle>[];

    muscles.forEach((key, value) {
      if (value > 0) keys.add(key);
    });

    final front = BodyPosition.front._contains(muscles: keys) >=
        BodyPosition.back._contains(muscles: keys);

    if (front) {
      final upper = BodyPosition.frontUpper._contains(muscles: keys) >=
          BodyPosition.frontLower._contains(muscles: keys);

      return upper ? BodyPosition.frontUpper : BodyPosition.frontLower;
    } else {
      final upper = BodyPosition.backUpper._contains(muscles: keys) >=
          BodyPosition.backLower._contains(muscles: keys);

      return upper ? BodyPosition.backUpper : BodyPosition.backLower;
    }
  }

  int _contains({required Iterable<Muscle> muscles}) {
    return muscles.fold<int>(
      0,
      (previousValue, muscle) =>
          muscles.contains(muscle) ? previousValue + 1 : previousValue,
    );
  }
}
