import 'dart:math';

import 'package:body_api/body_api.dart';

/// Different body positions
enum BodyPosition {
  /// Full body of front muscles.
  front,

  /// Upper body from the front.
  frontUpper,

  /// Lower body from the front.
  frontLower,

  /// Full body of back muscles.
  back,

  /// Upper body from the back.
  backUpper,

  /// Lower body from the back.
  backLower;

  /// Calculate body position for the given `muscles`.
  static BodyPosition calculate(Map<Muscle, int> muscles) {
    // TODO(Octane): Calculate body position
    final index = Random().nextInt(BodyPosition.values.length);
    return BodyPosition.values[index];
  }
}
